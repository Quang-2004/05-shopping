package vn.quangkhongbiet.shopping.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.quangkhongbiet.shopping.domain.Cart;
import vn.quangkhongbiet.shopping.domain.CartDetail;
import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.domain.User;
import vn.quangkhongbiet.shopping.repository.CartDetailRepository;
import vn.quangkhongbiet.shopping.repository.CartRepositoty;
import vn.quangkhongbiet.shopping.repository.ProductRepository;
import vn.quangkhongbiet.shopping.repository.UserRepository;

@Service
public class ProductService {


    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    private final CartRepositoty cartRepositoty;
    private final CartDetailRepository cartDetailRepository;
    

    public ProductService(
        ProductRepository productRepository,
        UserRepository userRepository,
        CartRepositoty cartRepositoty,
        CartDetailRepository cartDetailRepository) {

        this.productRepository = productRepository;
        this.userRepository = userRepository;
        this.cartRepositoty = cartRepositoty;
        this.cartDetailRepository = cartDetailRepository;
    }

    public Page<Product> findAll(Pageable pageable) {
        return this.productRepository.findAll(pageable);
    }

    public List<Product> findAll(){
        return this.productRepository.findAll();
    }

    public Product findById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteById(long id) {
        this.productRepository.deleteById(id);
    }

    public Product save(Product product) {
        return this.productRepository.save(product);
    }

    public void handleAddProductToCart(String email, long id, HttpSession session, long quantity){
        User user = this.userRepository.findByEmail(email);
        if(user != null) {
            Cart cart = this.cartRepositoty.findByUser(user);
            if(cart == null) { 
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                this.cartRepositoty.save(otherCart);
                cart = otherCart;
            }


            Optional<Product> productOptional = Optional.ofNullable(this.productRepository.findById(id));
            if(productOptional.isPresent()){ 
                Product realProduct = productOptional.get();
                // check product da dc them vao trc do chua
                CartDetail cartDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);

                if(cartDetail == null){ 
                    CartDetail otherCartDetail = new CartDetail();
                    otherCartDetail.setCart(cart);
                    otherCartDetail.setPrice(realProduct.getPrice());
                    otherCartDetail.setProduct(realProduct);
                    otherCartDetail.setQuantity(quantity);

                    // save 
                    this.cartDetailRepository.save(otherCartDetail);

                    // update session 
                    long sum = cart.getSum() + 1;
                    cart.setSum(sum);
                    this.cartRepositoty.save(cart);
                    session.setAttribute("sum", sum);

                }
                else{ 
                    cartDetail.setQuantity(cartDetail.getQuantity() + quantity);
                    // save 
                    this.cartDetailRepository.save(cartDetail);
                    
                }
            } 
        }
    }
}
