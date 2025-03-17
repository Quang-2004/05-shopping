package vn.quangkhongbiet.shopping.service;

import org.springframework.stereotype.Service;

import vn.quangkhongbiet.shopping.domain.Cart;
import vn.quangkhongbiet.shopping.domain.User;
import vn.quangkhongbiet.shopping.repository.CartRepositoty;

@Service
public class CartService {
    private final CartRepositoty cartRepositoty;

    public CartService(CartRepositoty cartRepositoty) {
        this.cartRepositoty = cartRepositoty;
    }
    
    public Cart findByUser(User user){
        return this.cartRepositoty.findByUser(user);
    }

    public void save(Cart cart){
        this.cartRepositoty.save(cart);
    }
}
