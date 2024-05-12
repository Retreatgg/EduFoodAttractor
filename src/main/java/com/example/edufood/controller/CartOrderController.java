package com.example.edufood.controller;

import com.example.edufood.dto.CartOrderDto;
import com.example.edufood.service.CartOrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("cart_order")
@RequiredArgsConstructor

public class CartOrderController {
    private final CartOrderService cartOrderService;
    @PostMapping("{restaurantId}/addToCart")
    public String addToCart(@RequestParam Long dishId, @PathVariable Long restaurantId) {
        CartOrderDto cartOrderDto = CartOrderDto.builder()
                .restaurantId(restaurantId)
                .dishId(dishId)
                .build();
        cartOrderService.addToCart(cartOrderDto);
        return "redirect:/";
    }
}
