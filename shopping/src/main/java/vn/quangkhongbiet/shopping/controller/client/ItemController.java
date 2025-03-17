package vn.quangkhongbiet.shopping.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.quangkhongbiet.shopping.domain.Cart;
import vn.quangkhongbiet.shopping.domain.CartDetail;
import vn.quangkhongbiet.shopping.domain.ImageDetail;
import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.domain.User;
import vn.quangkhongbiet.shopping.service.CartDetailService;
import vn.quangkhongbiet.shopping.service.CartService;
import vn.quangkhongbiet.shopping.service.ImageDetailService;
import vn.quangkhongbiet.shopping.service.ProductService;
import vn.quangkhongbiet.shopping.service.UserService;


@Controller
public class ItemController {

    private final ProductService productService;
    private final ImageDetailService imageDetailService;
    private final UserService userService;
    private final CartService cartService;
    private final CartDetailService cartDetailService;

    public ItemController(
        ProductService productService, 
        ImageDetailService imageDetailService,
        UserService userService,
        CartService cartService,
        CartDetailService cartDetailService) {


        this.productService = productService;
        this.imageDetailService = imageDetailService;
        this.userService = userService;
        this.cartService = cartService;
        this.cartDetailService = cartDetailService;
    }

    @GetMapping("/product/{id}")
    public String getDetailProductPage(@PathVariable long id, Model model) {
        Product product = this.productService.findById(id);
        List<ImageDetail> imageDetails = this.imageDetailService.findByProduct(product);

        model.addAttribute("product", product);
        model.addAttribute("imageDetails", imageDetails);
        return "client/product/detail";
        
    }

    
    @PostMapping("/add-product-to-cart/{id}")
    public String handleAddProduct(
        @PathVariable long id,
        HttpServletRequest request) {
        
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");

        this.productService.handleAddProductToCart(email, id, session, 1);
        return "redirect:/";
    }


    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User currentUser = this.userService.findByEmail(email);
        Cart cart = this.cartService.findByUser(currentUser);
        
        List<CartDetail> cartDetails = this.cartDetailService.findByCart(cart);
        model.addAttribute("cartDetails", cartDetails);
        return "client/cart/show";
    }

    @PostMapping("/confilm-checkout")
    public String getCheckOutPage() {
        
        
        return "redirect:/checkout";
    }
    
    @GetMapping("/checkout")
    public String getCheckoutPage() {
        //TODO: process POST request
        
        return "client/cart/checkout";
    }
    
    
    
    
   
}
