package vn.quangkhongbiet.shopping.domain;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
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
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "products")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product implements Serializable {
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

    
    @NotEmpty(message = "Size không được để trống!")
    private String size;

    @NotNull
    @NotEmpty(message = "Color không được để trống!")
    private String color;

    private long totalReview;
    private long totalRating;

    private String slug;

    // categoryId
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Category category;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
    private List<ImageDetail> ImageDetails;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
    private List<Review> reviews;

   
}
