package vn.quangkhongbiet.shopping.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import vn.quangkhongbiet.shopping.domain.Category;
import vn.quangkhongbiet.shopping.repository.CategoryRepository;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }
    
    public Category findByName(String name){
        return this.categoryRepository.findByName(name);
    }

    public List<Category> findAll(){
        return this.categoryRepository.findAll();
    }

    public Page<Category> findAllWithSpec(Specification<Category> spec, Pageable pageable){
        return this.categoryRepository.findAll(spec, pageable);
    }
}
