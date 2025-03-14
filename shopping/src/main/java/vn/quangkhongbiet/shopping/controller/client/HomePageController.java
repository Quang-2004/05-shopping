package vn.quangkhongbiet.shopping.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.service.ProductService;


@Controller
public class HomePageController {

    private final ProductService productService;

    public HomePageController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String requestMethodName(Model model) {
        List<Product> products = this.productService.findAll();
        model.addAttribute("products", products);
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

    @GetMapping("/access-deny")
    public String getAccessDenyPage() {
        return "client/access-deny/deny";
    }

    
    
}
