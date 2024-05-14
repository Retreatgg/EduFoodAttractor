package com.example.edufood.repository;

import com.example.edufood.model.CartOrders;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartOrdersRepository extends JpaRepository<CartOrders, Long> {

    List<CartOrders> findByRestaurantIdAndUserId(Long restaurantId, Long userId);
}
