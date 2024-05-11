package com.example.edufood.service;

import com.example.edufood.dto.UserCreateDto;
import org.springframework.stereotype.Service;

@Service
public interface UserService {

    void register(UserCreateDto user);
}
