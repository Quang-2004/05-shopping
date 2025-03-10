package vn.quangkhongbiet.shopping.domain;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotNull
    @NotEmpty(message = "DetailDesc không được để trống!")
    @Column(columnDefinition = "MEDIUMTEXT")
    private String detailDesc;

    @NotNull()
    @NotEmpty(message = "Factory không được để trống!")
    private String factory;

    private String image;

    @NotNull
    @NotEmpty(message = "Name không được để trống!")
    private String name;

    @NotNull
    @DecimalMin(value = "0", inclusive = false, message = "Price phải lớn hơn 0!")
    private long price;

    @NotNull()
    @DecimalMin(value = "0", inclusive = false, message = "Quantity phải lớn hơn 0!")
    private long quantity;

    @NotNull
    @NotEmpty(message = "ShortDetail không được để trống!")
    private String shortDesc;
    
    private long sold;
    private String target;
    private String size;
    private String color;
    private long totalReview;

    // categoryId
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @OneToMany(mappedBy = "product")
    private List<ImageDetail> ImageDetails;

    @OneToMany(mappedBy = "product")
    private List<Review> reviews;

    public Product() {
    }

    public Product(long id, String detailDesc, String factory, String image, String name, long price, long quantity,
            String shortDesc, long sold, String target, String size, String color, long totalReview, Category category,
            List<ImageDetail> imageDetails, List<Review> reviews) {
        this.id = id;
        this.detailDesc = detailDesc;
        this.factory = factory;
        this.image = image;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.shortDesc = shortDesc;
        this.sold = sold;
        this.target = target;
        this.size = size;
        this.color = color;
        this.totalReview = totalReview;
        this.category = category;
        ImageDetails = imageDetails;
        this.reviews = reviews;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public long getSold() {
        return sold;
    }

    public void setSold(long sold) {
        this.sold = sold;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public long getTotalReview() {
        return totalReview;
    }

    public void setTotalReview(long totalReview) {
        this.totalReview = totalReview;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<ImageDetail> getImageDetails() {
        return ImageDetails;
    }

    public void setImageDetails(List<ImageDetail> imageDetails) {
        ImageDetails = imageDetails;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    

}
