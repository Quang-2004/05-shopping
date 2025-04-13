package vn.quangkhongbiet.shopping.service.notification;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.quangkhongbiet.shopping.domain.User;
import vn.quangkhongbiet.shopping.repository.EmailVerificationTokenRepository;
import vn.quangkhongbiet.shopping.service.UserService;

@Service
public class OTPService {

    @Autowired
    private EmailVerificationTokenRepository otpRepo;
    @Autowired
    private UserService userService;

    public String generateOTP(String email) {
        String otp = String.format("%06d", new Random().nextInt(999999));

        User user = userService.findByEmail(email);
        if (user == null) {
            user = new User();
        } else {
            user.setOtp(null); // Xóa OTP cũ nếu có
        }

        user.setOtp(otp);
        user.setExpiryTime(LocalDateTime.now().plusMinutes(5)); // OTP hết hạn sau 5 phút
        user.setVerified(false);

        otpRepo.save(user);

        return otp;
    }

    public boolean verifyOTP(String email, String otp) {
        Optional<User> tokenOpt = otpRepo
            .findTopByEmailAndOtpAndVerifiedFalseOrderByExpiryTimeDesc(email, otp);

        if (tokenOpt.isEmpty()) return false;

        User user = tokenOpt.get();

        if (user.getExpiryTime().isBefore(LocalDateTime.now())) {
            return false;
        }

        user.setVerified(true);
        otpRepo.save(user);
        return true;
    }
}
