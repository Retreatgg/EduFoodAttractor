package com.example.edufood.dto;


import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//@Builder
@NoArgsConstructor
public class UserCreateDto {

    private String username;
    private String email;
    private String password;
    private String phoneNumber;

}
