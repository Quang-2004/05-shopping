package vn.quangkhongbiet.shopping.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;




@Controller
public class HomePageController {


    @GetMapping("/")
    public String requestMethodName() {
        return "client/homepage/show";
    }
   
    @GetMapping("/login")
    public String login(Model model) {
        return "client/auth/login";
    }

    @PostMapping("/login")
    public String handleLoginPage(Model model) {
        return "client/auth/login";
    }

    
    
}
