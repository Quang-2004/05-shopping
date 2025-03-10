package vn.quangkhongbiet.shopping.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "addresses")
public class Address {
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
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToOne(mappedBy = "address")
    private Order order;

    public Address() {
    }

    public Address(long id, boolean defaultAddress, String receiverAddress, String receiverName, String receiverPhone,
            String typeAddress, User user, Order order) {
        this.id = id;
        this.defaultAddress = defaultAddress;
        this.receiverAddress = receiverAddress;
        this.receiverName = receiverName;
        this.receiverPhone = receiverPhone;
        this.typeAddress = typeAddress;
        this.user = user;
        this.order = order;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public boolean isDefaultAddress() {
        return defaultAddress;
    }

    public void setDefaultAddress(boolean defaultAddress) {
        this.defaultAddress = defaultAddress;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getReceiverPhone() {
        return receiverPhone;
    }

    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }

    public String getTypeAddress() {
        return typeAddress;
    }

    public void setTypeAddress(String typeAddress) {
        this.typeAddress = typeAddress;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    
}
