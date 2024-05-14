package com.example.edufood.dto;


import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class OrderCreateDto {

    private Long dishId;
    private String dishName;
    private Double dishPrice;
    private Long restaurantId;
    private String restaurantName;
}
