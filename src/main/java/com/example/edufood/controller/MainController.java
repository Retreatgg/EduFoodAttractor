package com.example.edufood.controller;


import com.example.edufood.dto.RestaurantDto;
import com.example.edufood.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {

    private final RestaurantService restaurantService;

    @GetMapping("")
    public String main(Model model,
                       @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC, size = 4) Pageable pageable,
                       @RequestParam(name = "restaurantName", required = false) String restaurantName) {

        Page<RestaurantDto> page;
        if (restaurantName != null) {
            page = restaurantService.getAllRestaurants(pageable, restaurantName);
        } else {
            page = restaurantService.getAllRestaurants(pageable);
        }

        model.addAttribute("allRestaurantsSize", restaurantService.lengthRestaurants());
        model.addAttribute("page", page);
        model.addAttribute("pageNumber", pageable.getPageNumber());
        model.addAttribute("restaurantName", restaurantName);

        if(page.getSize() > 0 && page.getSize() <= 4) {
            int result = restaurantService.lengthRestaurants() / page.getSize();
            if (result == 20) {
                model.addAttribute("maxPage", 1);
            } else if(result == 10) {
                model.addAttribute("maxPage", 2);
            } else if(result == 6) {
                model.addAttribute("maxPage", 3);
            } else if(result <= 5) {
                model.addAttribute("maxPage", result);
            }
        } else {
            model.addAttribute("maxPage", 1);
        }
        return "main/index";
    }
}
