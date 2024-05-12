package com.example.edufood.service;

import com.example.edufood.dto.DishDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface DishService {

    List<DishDto> getDishesByRestaurantId(Long restaurantId);
}
