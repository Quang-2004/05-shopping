package vn.quangkhongbiet.shopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.quangkhongbiet.shopping.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>{
    Product findById(long id);

    void deleteById(long id);
    
} 
