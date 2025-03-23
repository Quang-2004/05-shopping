package vn.quangkhongbiet.shopping.domain.DTO;

import java.util.Optional;

public class ProductCriteriaDTO {
    private Optional<String> page;
    private Optional<String> factory;
    private Optional<String> price;
    private Optional<String> sort;
    private Optional<String> search;
    private Optional<String> categoryName;
    
    public Optional<String> getPage() {
        return page;
    }
    public void setPage(Optional<String> page) {
        this.page = page;
    }
    public Optional<String> getFactory() {
        return factory;
    }
    public void setFactory(Optional<String> factory) {
        this.factory = factory;
    }
    public Optional<String> getPrice() {
        return price;
    }
    public void setPrice(Optional<String> price) {
        this.price = price;
    }
    public Optional<String> getSort() {
        return sort;
    }
    public void setSort(Optional<String> sort) {
        this.sort = sort;
    }
    public Optional<String> getSearch() {
        return search;
    }
    public void setSearch(Optional<String> search) {
        this.search = search;
    }
    public Optional<String> getCategoryName() {
        return categoryName;
    }
    public void setCategoryName(Optional<String> categoryName) {
        this.categoryName = categoryName;
    }
    
    
}
