package com.example.edufood.service.impl;

import com.example.edufood.dto.CartOrderDto;
import com.example.edufood.dto.RestaurantDto;
import com.example.edufood.model.CartOrders;
import com.example.edufood.model.Dish;
import com.example.edufood.model.Restaurant;
import com.example.edufood.repository.CartOrdersRepository;
import com.example.edufood.repository.DishRepository;
import com.example.edufood.repository.RestaurantRepository;
import com.example.edufood.service.CartOrderService;
import com.example.edufood.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor

public class CartOrderImpl implements CartOrderService {
    private final CartOrdersRepository cartOrdersRepository;
    private final RestaurantRepository restaurantRepository;
    private final DishRepository dishRepository;
    @Override
    public void addToCart(CartOrderDto cartOrderDto) {
        Restaurant restaurant = restaurantRepository.findById(cartOrderDto.getRestaurantId())
                .orElseThrow(() -> new RuntimeException("Restaurant not found"));

        Dish dish = dishRepository.findById(cartOrderDto.getDishId())
                .orElseThrow(() -> new RuntimeException("Dish not found"));

        CartOrders cartOrder = new CartOrders();
        cartOrder.setRestaurant(restaurant);
        cartOrder.setDish(dish);
        cartOrdersRepository.save(cartOrder);

        log.info("Dish {} added to cart from restaurant {}", dish.getName(), restaurant.getName());
    }

    @Override
    public void removeFromCart(Long cartOrderId) {
        CartOrders cartOrder = cartOrdersRepository.findById(cartOrderId)
                .orElseThrow(() -> new RuntimeException("Cart Order not found"));

        cartOrdersRepository.delete(cartOrder);

        log.info("Dish {} removed from cart", cartOrder.getDish().getName());
    }

}
