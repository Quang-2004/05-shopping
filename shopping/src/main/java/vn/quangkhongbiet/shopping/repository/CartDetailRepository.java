package vn.quangkhongbiet.shopping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.quangkhongbiet.shopping.domain.Cart;
import vn.quangkhongbiet.shopping.domain.CartDetail;
import vn.quangkhongbiet.shopping.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long>{
    @SuppressWarnings("unchecked")
    CartDetail save(CartDetail cartDetail);

    CartDetail findById(long id);

    boolean existsByCartAndProduct(Cart cart, Product product);

    CartDetail findByCartAndProduct(Cart cart, Product product);

    List<CartDetail> findByCart(Cart cart);

    @Transactional
    void deleteByCart(Cart cart);

    @Transactional
    void deleteByCartAndProduct(Cart cart, Product product);
}
