package com.example.edufood.service;

import com.example.edufood.dto.RestaurantDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


@Service
public interface RestaurantService {

    Page<RestaurantDto> getAllRestaurants(Pageable pageable);

    RestaurantDto getRestaurantById(Long id);
}
