package com.expenses.security;

import com.expenses.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class ExpenseSecurityConfig {

    private final CustomOAuth2UserService customOAuth2UserService;

    @Autowired
    public ExpenseSecurityConfig(CustomOAuth2UserService customOAuth2UserService) {
        this.customOAuth2UserService = customOAuth2UserService;
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {return new BCryptPasswordEncoder();}

    @Bean
    public DaoAuthenticationProvider authenticationProvider(UserService userService) {
        DaoAuthenticationProvider auth = new DaoAuthenticationProvider(userService);
        auth.setPasswordEncoder(passwordEncoder());
        return auth;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http, DaoAuthenticationProvider authenticationProvider) {

        http
                .authenticationProvider(authenticationProvider)
                .authorizeHttpRequests(configurer -> configurer
                        .requestMatchers(
                            "/",
                            "/login",
                            "/**/*.css",
                            "/**/*.js",
                            "/**/*.png",
                            "/**/*.jpg"
                        )
                        .permitAll()


                        .requestMatchers("/dashboard/**").hasAnyRole("USER", "ADMIN")
                        .requestMatchers("/expenses/**").hasAnyRole("USER", "ADMIN")
                        .requestMatchers("/expense-new/**").hasAnyRole("USER", "ADMIN")
                        .requestMatchers("/categories/**").hasAnyRole("USER", "ADMIN")
                        .anyRequest().authenticated()
                )
                .formLogin(form -> form
                        .loginPage("/login")
                        .loginProcessingUrl("/authenticate")
                        .defaultSuccessUrl("/dashboard", true)
                        .permitAll()
                )
                .oauth2Login(oauth2 -> oauth2
                        .loginPage("/login")
                        .userInfoEndpoint(userInfo -> userInfo
                                .userService(customOAuth2UserService)
                        )
                        .defaultSuccessUrl("/dashboard", true)
                )
                .logout(logout -> logout
                        .permitAll()
                        .logoutSuccessUrl("/")
                )
                .exceptionHandling(configurer ->
                        configurer.accessDeniedPage("/access-denied")
                );

        return http.build();
    }
}
