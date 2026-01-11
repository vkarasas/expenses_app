package com.expenses.security;

import com.expenses.entities.Role;
import com.expenses.entities.User;
import com.expenses.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    private final UserRepository userRepository;

    @Autowired
    public CustomOAuth2UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = super.loadUser(userRequest);
        String subId = oAuth2User.getName();
        String username = oAuth2User.getAttribute("name");
        String email = oAuth2User.getAttribute("email");

        String provider = userRequest.getClientRegistration().getRegistrationId();

        User user = userRepository.findBySubIdAndProvider(subId, provider)
                .orElseGet(() ->{
                    User  newUser = new User();
                    newUser.setUsername(username);
                    newUser.setPassword("---");
                    newUser.setSubId(subId);
                    newUser.setEmail(email);
                    newUser.setProvider(provider);
                    newUser.setEnabled(Boolean.TRUE);

                    Collection<Role> roles = new ArrayList<>();
                    roles.add(new Role("ROLE_USER"));
                    newUser.setRoles(roles);

                    return userRepository.save(newUser);
                });

        // Add roles to user
        return new CustomOAuth2User(oAuth2User, user);
    }
}
