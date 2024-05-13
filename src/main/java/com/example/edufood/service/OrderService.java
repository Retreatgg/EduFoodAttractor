package com.example.edufood.service;

import com.example.edufood.dto.OrderDto;
import com.example.edufood.model.User;
import org.springframework.data.domain.jaxb.SpringDataJaxb;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OrderService {

    List<OrderDto> ordersByUserId(User user);
}
