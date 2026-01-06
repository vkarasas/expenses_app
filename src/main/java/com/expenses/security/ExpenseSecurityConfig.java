package com.expenses.security;

import com.expenses.services.UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.LogoutConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.expression.WebExpressionAuthorizationManager;

@Configuration
public class ExpenseSecurityConfig {

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {return new BCryptPasswordEncoder();}

    @Bean
    public DaoAuthenticationProvider authenticationProvider(UserService userService) {
        DaoAuthenticationProvider auth = new DaoAuthenticationProvider(userService);
        auth.setPasswordEncoder(passwordEncoder());
        return auth;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) {

        http.authorizeHttpRequests(configurer ->
                        configurer
                                .requestMatchers(
                                        "/**/*.css",
                                        "/**/*.js",
                                        "/**/*.png",
                                        "/**/*.jpg")
                                .permitAll()

                                .requestMatchers("/dashboard").hasAnyRole("EMPLOYEE", "MANAGER", "ADMIN")
                                .requestMatchers("/expenses/**").hasAnyRole("MANAGER", "ADMIN")
                                .requestMatchers("/expense-new/**").hasAnyRole("MANAGER", "ADMIN")
                                .requestMatchers("/categories/**").hasRole("ADMIN")
                                .anyRequest().authenticated()
                )
                .formLogin(form ->
                        form
                                .loginPage("/login")
                                .loginProcessingUrl("/dashboard")
                                .permitAll()
                )
                .oauth2Login(oauth2 -> oauth2
                        .loginPage("/login")
                        .defaultSuccessUrl("/dashboard", true)
                )
                .logout(LogoutConfigurer::permitAll)
                .exceptionHandling(configurer ->
                        configurer.accessDeniedPage("/access-denied")
                );

        return http.build();
    }
}
