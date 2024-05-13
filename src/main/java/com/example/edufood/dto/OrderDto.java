package com.example.edufood.dto;

import com.example.edufood.model.Restaurant;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class OrderDto {

    private Long id;
    private Restaurant restaurant;
    private String createDate;
    private Double check;


}
