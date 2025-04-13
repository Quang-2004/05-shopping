package vn.quangkhongbiet.shopping.service.notification;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Async
    public void sendOTPEmail(String to, String otp) {
        SimpleMailMessage message = new SimpleMailMessage();

        Random rand = new Random();
        int randomNumber = rand.nextInt(1000000); // Generate a random number between 0 and 999999
        String random = String.valueOf(randomNumber); // Convert to string
        message.setTo(to);
        message.setSubject(random + " - Xác thực email của bạn");
        message.setText("Mã OTP của bạn là: " + otp + ". Mã có hiệu lực trong 5 phút.");

        mailSender.send(message);
        // Giả lập delay
        try {
            Thread.sleep(3000); // Giả lập gửi mail mất 3s
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
