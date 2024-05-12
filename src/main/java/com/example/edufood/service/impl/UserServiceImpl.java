package com.example.edufood.service.impl;

import com.example.edufood.dto.UserCreateDto;
import com.example.edufood.model.Authority;
import com.example.edufood.model.User;
import com.example.edufood.repository.AuthorityRepository;
import com.example.edufood.repository.UserRepository;
import com.example.edufood.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final AuthorityRepository authorityRepository;
    private final PasswordEncoder encoder;


    @Override
    public void register(UserCreateDto user) {

        if (isUserExistsByEmail(user.getEmail())) {
            String error = "Пользователь с email " + user.getEmail() + " уже существует";
            log.error(error);
            throw new IllegalArgumentException(error);
        }

        User newUser = User.builder()
                .password(encoder.encode(user.getPassword()))
                .enabled(true)
                .username(user.getUsername())
                .email(user.getEmail())
                .phoneNumber(user.getPhoneNumber())
                .avatar("unnamed.jpg")
                .accountTypeId(1L)
                .build();

        userRepository.save(newUser);
    }


    public Boolean isUserExistsByEmail(String email) {
        Optional<User> user = userRepository.findByEmail(email);
        return user.isPresent();
    }
}
