package com.example.edufood.service;

import com.example.edufood.dto.CartOrderDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public interface CartOrderService {
    void addToCart(CartOrderDto cartOrderDto);
    void clearCart(Long cartOrderId);
    List<CartOrderDto> findByRestauranIdAndUserId(Long restaurantId, Long userId);
}
