package vn.quangkhongbiet.shopping.service.specification;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import jakarta.persistence.criteria.Predicate;
import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.domain.Product_;

public class ProductSpecs {
    public static Specification<Product> matchListFactory(List<String> factory) {
        return (root, query, builder) -> {
            return builder.in(root.get(Product_.FACTORY)).value(factory);
        };
    }

    public static Specification<Product> searchProduct(String search) {
        return (root, query, builder) -> {
            return builder.like(root.get(Product_.NAME), "%" + search + "%");
        };
    }

    public static Specification<Product> matchListPrice(List<String> prices) {
        return (root, query, builder) -> {
            List<Predicate> predicates = new ArrayList<>();
            long start = 0, end = 0;
            for (String price : prices) {
                switch (price) {
                    case "duoi-500":
                        start = 0;
                        end = 500000;
                        break;
                    case "500-den-1-trieu":
                        start = 500000;
                        end = 1000000;
                        break;
                    case "1-den-1-trieu-500":
                        start = 1000000;
                        end = 1500000;
                        break;
                    case "1-trieu-500-den-2-trieu":
                        start = 1500000;
                        end = 2000000;
                        break;
                    case "2-trieu-den-2-trieu-500":
                        start = 2000000;
                        end = 2500000;
                        break;
                }
                Predicate predicate = builder.between(root.get(Product_.PRICE), start, end);
                predicates.add(predicate);
            }
            return builder.or(predicates.toArray(new Predicate[0]));
        };
    }
}
