package com.example.edufood.controller;

import com.example.edufood.model.User;
import com.example.edufood.service.CartOrderService;
import com.example.edufood.service.DishService;
import com.example.edufood.service.RestaurantService;
import com.example.edufood.util.UserUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
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
    private final CartOrderService cartOrderService;
    private final UserUtil userUtil;

    @GetMapping("{id}")
    public String getRestaurant(Authentication auth, Model model, @PathVariable Long id) {
        model.addAttribute("restaurant", restaurantService.getRestaurantById(id));
        model.addAttribute("dishes", dishService.getDishesByRestaurantId(id));
        model.addAttribute("basket", true);
        return "restaurants/restaurant";
    }
}
