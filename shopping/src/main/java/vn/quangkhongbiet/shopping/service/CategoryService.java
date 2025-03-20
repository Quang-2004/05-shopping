package vn.quangkhongbiet.shopping.service;

import java.util.List;

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
}
