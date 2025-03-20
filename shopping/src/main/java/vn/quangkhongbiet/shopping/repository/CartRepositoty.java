package vn.quangkhongbiet.shopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.quangkhongbiet.shopping.domain.Cart;
import vn.quangkhongbiet.shopping.domain.User;

@Repository
public interface CartRepositoty extends JpaRepository<Cart, Long>{

    @SuppressWarnings("unchecked")
    Cart save(Cart cart);

    Cart findByUser(User user);

    @Transactional
    void deleteById(long id);
}
