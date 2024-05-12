package com.example.edufood.service.impl;

import com.example.edufood.dto.RestaurantDto;
import com.example.edufood.model.Restaurant;
import com.example.edufood.repository.RestaurantRepository;
import com.example.edufood.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class RestaurantServiceImpl implements RestaurantService {

    private final RestaurantRepository restaurantRepository;

    @Override
    public Page<RestaurantDto> getAllRestaurants(Pageable pageable) {
        Page<Restaurant> restaurants = restaurantRepository.findAll(pageable);
        List<Restaurant> restaurantList = restaurants.getContent();
        return new PageImpl<>(transformModelForDto(restaurantList));
    }

    private List<RestaurantDto> transformModelForDto(List<Restaurant> restaurants) {
        List<RestaurantDto> dtos = new ArrayList<>();

        restaurants.forEach(restaurant -> {
            dtos.add(RestaurantDto.builder()
                            .id(restaurant.getId())
                            .description(restaurant.getDescription())
                            .name(restaurant.getName())
                    .build());
        });

        return dtos;
    }
}
