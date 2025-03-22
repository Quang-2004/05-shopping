package vn.quangkhongbiet.shopping.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.quangkhongbiet.shopping.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>{

    @SuppressWarnings("unchecked")
    Product save(Product product);

    Product findById(long id);

    void deleteById(long id);

    List<Product> findAll();

    Page<Product> findAll(Pageable pageable);
    
} 
