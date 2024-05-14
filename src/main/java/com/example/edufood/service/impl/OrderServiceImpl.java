package com.example.edufood.service.impl;

import com.example.edufood.dto.OrderDto;
import com.example.edufood.model.Order;
import com.example.edufood.model.User;
import com.example.edufood.repository.OrderRepository;
import com.example.edufood.service.OrderService;
import com.example.edufood.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;
    private final RestaurantService restaurantService;
    private final DateTimeFormatter formatters = DateTimeFormatter.ofPattern("d/MM/uuuu");


    @Override
    public List<OrderDto> ordersByUserId(User user) {
        List<Order> orders = orderRepository.findByUser(user);
        orders.sort(Comparator.comparing(Order::getCreateDate));
        return transformListModelForDto(orders);
    }

    @Override
    public void save(Long restId, User user, Double check) {
        Order order = Order.builder()
                .restaurant(restaurantService.findRestaurantById(restId))
                .user(user)
                .createDate(LocalDateTime.now())
                .check(check)
                .build();

        orderRepository.save(order);
    }

    private List<OrderDto> transformListModelForDto(List<Order> orders) {
        List<OrderDto> dtos = new ArrayList<>();
        orders.forEach(order -> {
            dtos.add(OrderDto.builder()
                            .id(order.getId())
                            .check(order.getCheck())
                            .createDate(order.getCreateDate().format(formatters))
                            .restaurant(order.getRestaurant())
                    .build());
        });

        return dtos;
    }
}
