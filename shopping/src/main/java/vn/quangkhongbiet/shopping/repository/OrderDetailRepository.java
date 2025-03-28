package vn.quangkhongbiet.shopping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.quangkhongbiet.shopping.domain.Order;
import vn.quangkhongbiet.shopping.domain.OrderDetail;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long>{

    @SuppressWarnings("unchecked")
    OrderDetail save(OrderDetail orderDetail);
    
    @Transactional
    void deleteByOrder(Order order);

    List<OrderDetail> findByOrder(Order order);

    OrderDetail findById(long id);
}
