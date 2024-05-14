package com.example.edufood.controller;


import com.example.edufood.dto.OrderCreateDto;
import com.example.edufood.model.User;
import com.example.edufood.service.OrderService;
import com.example.edufood.util.UserUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

@Controller
@RequiredArgsConstructor
@RequestMapping("order")
public class OrderController {

    private final OrderService orderService;
    private final UserUtil userUtil;


    @PostMapping("")
    public String addOrder(Authentication auth, @RequestBody List<OrderCreateDto> orderCreateDtos) {
        User user = userUtil.getUserByAuth(auth);
        Double totalPrice = 0.0;
        for (OrderCreateDto order : orderCreateDtos) {
            totalPrice += order.getDishPrice();
        }

        orderService.save(orderCreateDtos.get(0).getRestaurantId(), user, totalPrice);
        return "redirect:/profile";
    }
}
