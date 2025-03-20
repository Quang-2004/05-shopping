package vn.quangkhongbiet.shopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.quangkhongbiet.shopping.domain.Address;
import vn.quangkhongbiet.shopping.domain.Cart;
import vn.quangkhongbiet.shopping.domain.CartDetail;
import vn.quangkhongbiet.shopping.domain.Order;
import vn.quangkhongbiet.shopping.domain.OrderDetail;
import vn.quangkhongbiet.shopping.domain.User;
import vn.quangkhongbiet.shopping.repository.CartDetailRepository;
import vn.quangkhongbiet.shopping.repository.CartRepositoty;
import vn.quangkhongbiet.shopping.repository.OrderRepository;
import vn.quangkhongbiet.shopping.repository.UserRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;
    private final CartRepositoty cartRepositoty;
    private final CartDetailRepository cartDetailRepository;
    private final OrderDetailService orderDetailService;

    public OrderService(
            OrderRepository orderRepository,
            UserRepository userRepository,
            CartRepositoty cartRepositoty,
            CartDetailRepository cartDetailRepository,
            OrderDetailService orderDetailService) {

        this.orderRepository = orderRepository;
        this.userRepository = userRepository;
        this.cartRepositoty = cartRepositoty;
        this.cartDetailRepository = cartDetailRepository;
        this.orderDetailService = orderDetailService;
    }

    public List<Order> findOrderByUser(User user) {
        return this.orderRepository.findOrderByUser(user);
    }

    public List<Order> findAll() {
        return this.orderRepository.findAll();
    }

    public void handleSaveOrder(HttpSession session, Address address) {
        String email = (String) session.getAttribute("email");
        User currentUser = this.userRepository.findByEmail(email);
        Cart cart = this.cartRepositoty.findByUser(currentUser);

        List<CartDetail> cartDetails = this.cartDetailRepository.findByCart(cart);
        long totalPrice = 0;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += (cartDetail.getPrice() * cartDetail.getQuantity());
        }

        Order order = new Order();
        order.setStatus("SHIPPING");
        order.setTotalPrice(totalPrice);
        order.setAddress(address);
        order.setUser(currentUser);
        // save
        this.orderRepository.save(order);

        
        for (CartDetail cartDetail : cartDetails) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setPrice(cartDetail.getPrice());
            orderDetail.setQuantity(cartDetail.getQuantity());
            orderDetail.setProduct(cartDetail.getProduct());
            orderDetail.setOrder(order);
            this.orderDetailService.save(orderDetail);
        }

        // delete 
        this.cartDetailRepository.deleteByCart(cart);
        
        cart.setSum(0);
        this.cartRepositoty.save(cart);

        // update sum in session
        session.setAttribute("sum", 0);
    }
}
