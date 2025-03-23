package vn.quangkhongbiet.shopping.service.specification;


import org.springframework.data.jpa.domain.Specification;

import vn.quangkhongbiet.shopping.domain.Category_;
import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.domain.Product_;

public class CategorySpecs {
    public static Specification<Product> matchCategoryName(String categoryName) {
        return (root, query, builder) -> {
            return builder.like(root.join(Product_.CATEGORY).get(Category_.NAME), categoryName);
        };
    }
}
