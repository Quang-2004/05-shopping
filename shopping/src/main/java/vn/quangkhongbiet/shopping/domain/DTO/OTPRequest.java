package vn.quangkhongbiet.shopping.domain.DTO;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OTPRequest {
    private String email;
    @NotBlank(message = "OTP không được để trống!")
    private String otp;
}
