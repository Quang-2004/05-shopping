package vn.quangkhongbiet.shopping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.quangkhongbiet.shopping.domain.ImageDetail;
import vn.quangkhongbiet.shopping.domain.Product;

@Repository
public interface ImageDetailRepository extends JpaRepository<ImageDetail, Long>{
    List<ImageDetail> findByProduct(Product product);
}
