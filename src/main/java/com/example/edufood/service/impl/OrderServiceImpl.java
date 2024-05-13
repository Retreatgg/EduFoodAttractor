package com.example.edufood.service.impl;

import com.example.edufood.dto.OrderDto;
import com.example.edufood.model.Order;
import com.example.edufood.model.User;
import com.example.edufood.repository.OrderRepository;
import com.example.edufood.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;
    private final DateTimeFormatter formatters = DateTimeFormatter.ofPattern("d/MM/uuuu");


    @Override
    public List<OrderDto> ordersByUserId(User user) {
        List<Order> orders = orderRepository.findByUser(user);
        return transformListModelForDto(orders);
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
