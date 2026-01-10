package com.expenses.util;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

public class AuthUtil {

    public static String getAuthUsername() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            if(authentication == null) return null;

            if (authentication.getPrincipal() instanceof UserDetails userDetails) {
                return userDetails.getUsername();
            } else if (authentication.getPrincipal() instanceof OAuth2User oauth2User) {
                return oauth2User.getAttribute("name");
            }
        }

        return null;
    }
}
