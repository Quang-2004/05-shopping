package vn.quangkhongbiet.shopping.service;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.quangkhongbiet.shopping.domain.Cart;
import vn.quangkhongbiet.shopping.domain.CartDetail;
import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.domain.User;
import vn.quangkhongbiet.shopping.domain.DTO.ProductCriteriaDTO;
import vn.quangkhongbiet.shopping.repository.CartDetailRepository;
import vn.quangkhongbiet.shopping.repository.CartRepositoty;
import vn.quangkhongbiet.shopping.repository.ProductRepository;
import vn.quangkhongbiet.shopping.repository.UserRepository;
import vn.quangkhongbiet.shopping.service.specification.CategorySpecs;
import vn.quangkhongbiet.shopping.service.specification.ProductSpecs;

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

    public List<Product> findAll() {
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

    public void handleAddProductToCart(String email, long id, HttpSession session, long quantity) {
        User user = this.userRepository.findByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepositoty.findByUser(user);
            if (cart == null) {
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                this.cartRepositoty.save(otherCart);
                cart = otherCart;
            }

            Optional<Product> productOptional = Optional.ofNullable(this.productRepository.findById(id));
            if (productOptional.isPresent()) {
                Product realProduct = productOptional.get();
                // check product da dc them vao trc do chua
                CartDetail cartDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);

                if (cartDetail == null) {
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

                } else {
                    cartDetail.setQuantity(cartDetail.getQuantity() + quantity);
                    // save
                    this.cartDetailRepository.save(cartDetail);

                }
            }
        }
    }

    public Page<Product> findAllWithSpec(Pageable pageable, ProductCriteriaDTO productCriteriaDTO) {
        if (productCriteriaDTO.getFactory() == null
                && productCriteriaDTO.getPrice() == null
                && productCriteriaDTO.getSearch() == null
                && productCriteriaDTO.getCategoryName() == null) {

            return this.productRepository.findAll(pageable);
        }

        Specification<Product> combinedSpec = Specification.where(null);
        if (productCriteriaDTO.getFactory() != null) {
            Specification<Product> currentSpecs = ProductSpecs
                    .matchListFactory(Arrays.asList(productCriteriaDTO.getFactory().get().split(",")));
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getPrice() != null) {
            Specification<Product> currentSpecs = ProductSpecs
                    .matchListPrice(Arrays.asList(productCriteriaDTO.getPrice().get().split(",")));
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getSearch() != null) {
            Specification<Product> currentSpecs = ProductSpecs
                    .searchProduct(productCriteriaDTO.getSearch().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getCategoryName() != null) {
            Specification<Product> currentSpecs = CategorySpecs
                    .matchCategoryName(productCriteriaDTO.getCategoryName().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        return this.productRepository.findAll(combinedSpec, pageable);
    }

    public List<Product> findProductSuggestionWithSpec(String categoryName){
        return this.productRepository.findAll(CategorySpecs.matchCategoryName(categoryName));
    }
}
