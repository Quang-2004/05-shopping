package vn.quangkhongbiet.shopping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.quangkhongbiet.shopping.domain.Order;
import vn.quangkhongbiet.shopping.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long>{

    @SuppressWarnings("unchecked")
    Order save(Order order);

    Order findById(long id);
    
    List<Order> findOrderByUser(User user);

    @Transactional
    void deleteById(long id);
} 
