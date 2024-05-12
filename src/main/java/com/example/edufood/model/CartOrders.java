package com.example.edufood.model;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "cart_orders")
public class CartOrders {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @Column(name = "restaurant_id")
    private Restaurant restaurant;

    @ManyToOne
    @Column(name = "dish_id")
    private Dish dish;
}
