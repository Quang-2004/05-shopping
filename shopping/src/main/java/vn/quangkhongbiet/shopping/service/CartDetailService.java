package vn.quangkhongbiet.shopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.quangkhongbiet.shopping.domain.Cart;
import vn.quangkhongbiet.shopping.domain.CartDetail;
import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.repository.CartDetailRepository;

@Service
public class CartDetailService {
    private final CartDetailRepository cartDetailRepository;

    public CartDetailService(CartDetailRepository cartDetailRepository) {
        this.cartDetailRepository = cartDetailRepository;
    }
    
    public CartDetail save(CartDetail cartDetail){ 
        return this.cartDetailRepository.save(cartDetail);
    }

    public CartDetail findById(long id){ 
        return this.cartDetailRepository.findById(id);
    }

    public boolean existsByCartAndProduct(Cart cart, Product product){ 
        return this.cartDetailRepository.existsByCartAndProduct(cart, product);
    }

    public CartDetail findByCartAndProduct(Cart cart, Product product){ 
        return this.cartDetailRepository.findByCartAndProduct(cart, product);
    }

    public List<CartDetail> findByCart(Cart cart){
        return this.cartDetailRepository.findByCart(cart);
    }

    public void deleteByCart(Cart cart){ 
        this.cartDetailRepository.deleteByCart(cart);
    }

    public void deleteByCartAndProduct(Cart cart, Product product){
        this.cartDetailRepository.deleteByCartAndProduct(cart, product);
    }

}
