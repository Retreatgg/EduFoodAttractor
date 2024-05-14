package com.example.edufood.service;

import com.example.edufood.dto.RestaurantDto;
import com.example.edufood.model.Restaurant;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface RestaurantService {

    Page<RestaurantDto> getAllRestaurants(Pageable pageable);
    Page<RestaurantDto> getAllRestaurants(Pageable pageable, String restaurantName);

    RestaurantDto getRestaurantById(Long id);
    List<RestaurantDto> allRestaurants();
    int lengthRestaurants();

    Restaurant findRestaurantById(Long id);
}
