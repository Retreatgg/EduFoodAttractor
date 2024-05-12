package com.example.edufood.controller;

import com.example.edufood.service.DishService;
import com.example.edufood.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("restaurant")
@RequiredArgsConstructor
public class RestaurantController {

    private final DishService dishService;
    private final RestaurantService restaurantService;

    @GetMapping("{id}")
    public String getRestaurant(Model model, @PathVariable Long id) {

        model.addAttribute("restaurant", restaurantService.getRestaurantById(id));
        model.addAttribute("dishes", dishService.getDishesByRestaurantId(id));
        return "restaurants/restaurant";
    }
}
