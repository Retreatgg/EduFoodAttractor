package com.example.edufood.service.impl;

import com.example.edufood.dto.DishDto;
import com.example.edufood.model.Dish;
import com.example.edufood.repository.DishRepository;
import com.example.edufood.service.DishService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class DishServiceImpl implements DishService {

    private final DishRepository dishRepository;

    @Override
    public List<DishDto> getDishesByRestaurantId(Long restaurantId) {
        List<Dish> dishes = dishRepository.findDishByRestaurantId(restaurantId);
        return transformListModelForDto(dishes);
    }


    private List<DishDto> transformListModelForDto(List<Dish> dishes) {
        List<DishDto> dtos = new ArrayList<>();

        dishes.forEach(dish -> {
            dtos.add(DishDto.builder()
                            .id(dish.getId())
                            .image(dish.getImage())
                            .description(dish.getDescription())
                            .name(dish.getName())
                            .price(dish.getPrice())
                    .build());
        });

        return dtos;
    }
}
