package com.example.edufood.repository;

import com.example.edufood.model.Dish;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DishRepository extends JpaRepository<Dish, Long> {

    List<Dish> findDishByRestaurantId(Long restaurantId);
}
