package com.example.edufood.service;

import com.example.edufood.dto.OrderDto;
import com.example.edufood.model.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

@Service
public interface OrderService {

    List<OrderDto> ordersByUserId(User user);

    void save(Long restId, User user, Double check);
}
