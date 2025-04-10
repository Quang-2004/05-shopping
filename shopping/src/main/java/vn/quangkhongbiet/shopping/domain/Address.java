package vn.quangkhongbiet.shopping.domain;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "addresses")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Address implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private boolean defaultAddress;
    @NotNull
    @Size(min = 5, message = "Địa chỉ quá ngắn!")
    private String receiverAddress;

    @NotNull
    @Size(min = 2, message = "Tên quá ngắn. Yêu cầu tối thiểu 2 ký tự!")
    private String receiverName;

    @NotNull
    @Size(min=0,max=10, message = "Số điện thoại không hợp lệ!")
    @Pattern(regexp = "^$|^\\d{10}$", message = "Số điện thoại không hợp lệ!")
    private String receiverPhone;
    
    private String typeAddress;
    // user id
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    
}
