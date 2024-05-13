package com.example.edufood.controller;


import com.example.edufood.dto.OrderDto;
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

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Controller
@RequestMapping("profile")
@RequiredArgsConstructor
public class ProfileController {

    private final UserUtil userUtil;
    private final OrderService orderService;

    @GetMapping("")
    public String profile(Authentication authentication, Model model) {
        User user = userUtil.getUserByAuth(authentication);
        List<OrderDto> orderDtoList = orderService.ordersByUserId(user);
        orderDtoList.sort(Comparator.comparing(OrderDto::getCreateDate));

        model.addAttribute("user", user);
        model.addAttribute("orders", orderDtoList);

        return "profile/profile";
    }
}
