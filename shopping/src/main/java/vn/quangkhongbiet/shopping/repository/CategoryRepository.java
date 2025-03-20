package vn.quangkhongbiet.shopping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.quangkhongbiet.shopping.domain.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long>{
    Category findByName(String name);

    List<Category> findAll();
}
