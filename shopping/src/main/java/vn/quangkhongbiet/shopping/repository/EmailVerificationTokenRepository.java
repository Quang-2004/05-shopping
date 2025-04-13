package vn.quangkhongbiet.shopping.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.quangkhongbiet.shopping.domain.User;

public interface EmailVerificationTokenRepository extends JpaRepository<User, Long> {
    Optional<User> findTopByEmailAndOtpAndVerifiedFalseOrderByExpiryTimeDesc(String email, String otp);
}