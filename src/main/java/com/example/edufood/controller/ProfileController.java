package com.example.edufood.controller;


import com.example.edufood.model.User;
import com.example.edufood.service.OrderService;
import com.example.edufood.service.UserService;
import com.example.edufood.util.UserUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("profile")
@RequiredArgsConstructor
public class ProfileController {

    private final UserService userService;
    private final UserUtil userUtil;
    private final OrderService orderService;

    @GetMapping("")
    public String profile(Authentication authentication, Model model) {
        User user = userUtil.getUserByAuth(authentication);
        model.addAttribute("user", user);
        model.addAttribute("orders", orderService.ordersByUserId(user));
        return "profile/profile";
    }
}
