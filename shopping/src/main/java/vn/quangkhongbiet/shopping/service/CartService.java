package vn.quangkhongbiet.shopping.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.quangkhongbiet.shopping.domain.Cart;
import vn.quangkhongbiet.shopping.domain.CartDetail;
import vn.quangkhongbiet.shopping.domain.User;
import vn.quangkhongbiet.shopping.repository.CartDetailRepository;
import vn.quangkhongbiet.shopping.repository.CartRepositoty;

@Service
public class CartService {
    private final CartRepositoty cartRepositoty;
    private final CartDetailRepository cartDetailRepository;

    public CartService(
            CartRepositoty cartRepositoty,
            CartDetailRepository cartDetailRepository) {

        this.cartRepositoty = cartRepositoty;
        this.cartDetailRepository = cartDetailRepository;
    }

    public Cart findByUser(User user) {
        return this.cartRepositoty.findByUser(user);
    }

    public void save(Cart cart) {
        this.cartRepositoty.save(cart);
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails){ 
        if(cartDetails == null || cartDetails.isEmpty()) return;
        
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cartDetailOptional = Optional.ofNullable(this.cartDetailRepository.findById(cartDetail.getId()));
            if(cartDetailOptional.isPresent()){ 
                CartDetail realCD = cartDetailOptional.get();
                realCD.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(realCD);
            }
        }
    }

    public void deleteById(long id){ 
        this.cartRepositoty.deleteById(id);
    }
}
