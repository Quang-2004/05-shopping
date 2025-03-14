package vn.quangkhongbiet.shopping.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String avatar;

    @Size(min=0,max=10, message = "Số điện thoại không hợp lệ!")
    @Pattern(regexp = "^$|^\\d{10}$", message = "Số điện thoại không hợp lệ!")
    private String phoneNumber;

    private String sex;

    @Email(message = "Email không hợp lệ!", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;

    @NotNull
    @Size(min = 3, message = "Fullname phải có ít nhất 3 ký tự!")
    private String fullName;

    @NotNull
    @Size(min = 2, message = "Password phaỉ có tối thiểu 2 ký tự!")
    private String password;
    
    // role id
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "role_id")
    private Role role;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private List<Address> addresses;

    @OneToOne(mappedBy = "user")
    private Cart cart;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    private List<Order> orders;

    public User() {
    }

    public User(long id, String avatar,
            @Size(min = 0, max = 10, message = "Số điện thoại không hợp lệ!") @Pattern(regexp = "^$|^\\d{10}$", message = "Số điện thoại không hợp lệ!") String phoneNumber,
            String sex,
            @Email(message = "Email không hợp lệ!", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$") String email,
            @NotNull @Size(min = 3, message = "Fullname phải có ít nhất 3 ký tự!") String fullName,
            @NotNull @Size(min = 2, message = "Password phaỉ có tối thiểu 2 ký tự!") String password, Role role,
            List<Address> addresses, Cart cart, List<Order> orders) {
        this.id = id;
        this.avatar = avatar;
        this.phoneNumber = phoneNumber;
        this.sex = sex;
        this.email = email;
        this.fullName = fullName;
        this.password = password;
        this.role = role;
        this.addresses = addresses;
        this.cart = cart;
        this.orders = orders;
    }



    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public List<Address> getAddresses() {
        return addresses;
    }

    public void setAddresses(List<Address> addresses) {
        this.addresses = addresses;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }



    public String getSex() {
        return sex;
    }



    public void setSex(String sex) {
        this.sex = sex;
    }

    
    
    
}
