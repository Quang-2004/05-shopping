package vn.quangkhongbiet.shopping.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller
public class HomePageController {


    @RequestMapping("/")
    public String requestMethodName() {
        return "client/homepage/show";
    }
   

    @GetMapping("/client")
    public String client() {
        return "only user can access this page";
    }
    
    @GetMapping("/admin")
    public String getMethodName() {
        return "only admin can access this page";
    }
    
    
}
