package vn.quangkhongbiet.shopping.service;

import java.util.List;
import org.springframework.stereotype.Service;

import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.domain.Review;
import vn.quangkhongbiet.shopping.repository.ReviewRepository;

@Service
public class ReviewService {
    private final ReviewRepository reviewRepository;

    public ReviewService(ReviewRepository reviewRepository) {
        this.reviewRepository = reviewRepository;
    }
    
    public void save(Review review){
        this.reviewRepository.save(review);
    }

    public List<Review> findByProduct(Product product){
        return this.reviewRepository.findByProduct(product);
    }


    public List<Review> findByProductAndRating(Product product, long rating){
        return reviewRepository.findByProductAndRating(product, rating);
    }

}
