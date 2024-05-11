package com.example.edufood.controller;

import com.example.edufood.dto.UserCreateDto;
import com.example.edufood.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("auth")
public class AuthController {

    private final UserService userService;

    @GetMapping("login")
    public String login() {
        return "login/login";
    }

    @GetMapping("register")
    public String register(Model model) {
        model.addAttribute("userDto", new UserCreateDto());
        return "/user/create_user";
    }

    @PostMapping("register")
    public String register(@Valid UserCreateDto userDto, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("userDto", userDto);
            return "/auth/register";
        }
        userService.register(userDto);
        return "redirect:/";
    }
}
