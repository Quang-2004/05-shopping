package vn.quangkhongbiet.shopping.domain.DTO;

import jakarta.validation.constraints.Email;
import lombok.Data;
import vn.quangkhongbiet.shopping.service.validator.RegisterChecked;

@RegisterChecked
@Data
public class RegisterDTO {
    private String firstName;
    private String lastName;
    
    @Email(message = "Email is not in correct format!", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;
    private String password;
    private String confirmPassword;

}
