package com.example.edufood.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
     public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
         http
                 .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.ALWAYS))
                 .httpBasic(Customizer.withDefaults())
                 .csrf(AbstractHttpConfigurer::disable)
                 .formLogin(form -> form
                         .loginPage("/auth/login")
                         .loginProcessingUrl("/auth/login")
                         .defaultSuccessUrl("/")
                         .failureUrl("/auth/login?error=true")
                         .permitAll())
                 .logout(logout -> logout
                         .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                         .permitAll())
                 .authorizeHttpRequests(authorize -> authorize
                         .requestMatchers("HttpMethod.GET", "/profile").hasAuthority("CUSTOMER")
                         .requestMatchers("HttpMethod.POST", "/order/").hasAuthority("CUSTOMER")
                         .anyRequest().permitAll())
                 .exceptionHandling(Customizer.withDefaults());

         return http.build();
     }
}
