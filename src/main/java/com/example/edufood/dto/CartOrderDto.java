package com.example.edufood.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CartOrderDto {
    private Long id;
    private Long restaurantId;
    private String restaurantName;
    private Long dishId;
    private String dishName;
}
