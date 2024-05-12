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

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {

    private final RestaurantService restaurantService;

    @GetMapping("")
    public String main(Model model,
                       @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC,  size = 5) Pageable pageable) {
        Page<RestaurantDto> page = restaurantService.getAllRestaurants(pageable);

        model.addAttribute("page", page);
        model.addAttribute("pageNumber", pageable.getPageNumber());
        model.addAttribute("pageSize", pageable.getPageSize());
        return "main/index";
    }
}
