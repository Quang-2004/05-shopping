package vn.quangkhongbiet.shopping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.quangkhongbiet.shopping.domain.Order;
import vn.quangkhongbiet.shopping.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long>{
    Order findById(long id);
    
    List<Order> findOrderByUser(User user);
} 
