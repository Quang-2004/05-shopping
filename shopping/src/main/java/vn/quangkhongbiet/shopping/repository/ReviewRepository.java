package vn.quangkhongbiet.shopping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.domain.Review;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long>{
    List<Review> findByProduct(Product product);

    List<Review> findByProductAndRating(Product product, long rating);
}
