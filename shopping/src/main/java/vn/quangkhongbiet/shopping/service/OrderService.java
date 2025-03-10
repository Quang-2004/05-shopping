package vn.quangkhongbiet.shopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.quangkhongbiet.shopping.domain.Order;
import vn.quangkhongbiet.shopping.domain.User;
import vn.quangkhongbiet.shopping.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    
    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public List<Order> findOrderByUser(User user) {
        return this.orderRepository.findOrderByUser(user);
    }

    public List<Order> findAll() {
        return this.orderRepository.findAll();
    }
}
