package vn.quangkhongbiet.shopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.quangkhongbiet.shopping.domain.Order;
import vn.quangkhongbiet.shopping.domain.OrderDetail;
import vn.quangkhongbiet.shopping.repository.OrderDetailRepository;

@Service
public class OrderDetailService {
    private final OrderDetailRepository orderDetailRepository;

    public OrderDetailService(OrderDetailRepository orderDetailRepository) {
        this.orderDetailRepository = orderDetailRepository;
    }
    
    public void save(OrderDetail orderDetail){ 
        this.orderDetailRepository.save(orderDetail);
    }

    public void deleteByOrder(Order order){
        this.orderDetailRepository.deleteByOrder(order);
    }

    public List<OrderDetail> findByOrder(Order order){
        return this.orderDetailRepository.findByOrder(order);
    }
}
