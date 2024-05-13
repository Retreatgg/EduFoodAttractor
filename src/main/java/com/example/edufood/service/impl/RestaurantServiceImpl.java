package com.example.edufood.service.impl;

import com.example.edufood.dto.RestaurantDto;
import com.example.edufood.model.Restaurant;
import com.example.edufood.repository.RestaurantRepository;
import com.example.edufood.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class RestaurantServiceImpl implements RestaurantService {

    private final RestaurantRepository restaurantRepository;

    @Override
    public Page<RestaurantDto> getAllRestaurants(Pageable pageable) {
        Page<Restaurant> restaurants = restaurantRepository.findAll(pageable);
        List<Restaurant> restaurantList = restaurants.getContent();
        return new PageImpl<>(transformListModelForDtos(restaurantList));
    }

    @Override
    public RestaurantDto getRestaurantById(Long id) {
        Optional<Restaurant> restaurantOptional = restaurantRepository.findById(id);
        if(restaurantOptional.isPresent()) {
            return transfromModelForDto(restaurantOptional.get());
        }

        String error = "Ресторан не найден с таким ID: " + id;
        log.error(error);
        throw new IllegalArgumentException(error);
    }

    @Override
    public int lengthRestaurants() {
        return restaurantRepository.findAll().size();
    }

    private List<RestaurantDto> transformListModelForDtos(List<Restaurant> restaurants) {
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


    private RestaurantDto transfromModelForDto(Restaurant restaurant) {
        return RestaurantDto.builder()
                .name(restaurant.getName())
                .description(restaurant.getDescription())
                .id(restaurant.getId())
                .build();
    }
}
