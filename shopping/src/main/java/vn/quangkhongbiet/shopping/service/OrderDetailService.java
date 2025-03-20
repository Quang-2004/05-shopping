package vn.quangkhongbiet.shopping.service;

import org.springframework.stereotype.Service;

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
}
