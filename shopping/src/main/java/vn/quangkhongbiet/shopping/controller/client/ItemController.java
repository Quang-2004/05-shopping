package vn.quangkhongbiet.shopping.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.quangkhongbiet.shopping.domain.Address;
import vn.quangkhongbiet.shopping.domain.Cart;
import vn.quangkhongbiet.shopping.domain.CartDetail;
import vn.quangkhongbiet.shopping.domain.ImageDetail;
import vn.quangkhongbiet.shopping.domain.Order;
import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.domain.User;
import vn.quangkhongbiet.shopping.service.AddressService;
import vn.quangkhongbiet.shopping.service.CartDetailService;
import vn.quangkhongbiet.shopping.service.CartService;
import vn.quangkhongbiet.shopping.service.ImageDetailService;
import vn.quangkhongbiet.shopping.service.OrderService;
import vn.quangkhongbiet.shopping.service.ProductService;
import vn.quangkhongbiet.shopping.service.UserService;



@Controller
public class ItemController {


    private final ProductService productService;
    private final ImageDetailService imageDetailService;
    private final UserService userService;
    private final CartService cartService;
    private final CartDetailService cartDetailService;
    private final AddressService addressService;
    private final OrderService orderService;

    public ItemController(
            ProductService productService,
            ImageDetailService imageDetailService,
            UserService userService,
            CartService cartService,
            CartDetailService cartDetailService,
            AddressService addressService,
            OrderService orderService) {

        this.productService = productService;
        this.imageDetailService = imageDetailService;
        this.userService = userService;
        this.cartService = cartService;
        this.cartDetailService = cartDetailService;
        this.addressService = addressService;
        this.orderService = orderService;
    }

    @GetMapping("/product/{id}")
    public String getDetailProductPage(@PathVariable long id, Model model) {
        Product product = this.productService.findById(id);
        List<ImageDetail> imageDetails = this.imageDetailService.findByProduct(product);

        model.addAttribute("product", product);
        model.addAttribute("imageDetails", imageDetails);
        return "client/product/detail";

    }

    @PostMapping("/add-product-to-cart")
    public String handleAddProduct(
            HttpServletRequest request,
            @RequestParam("id") long id,
            @RequestParam("quantity") long quantity) {

        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");

        this.productService.handleAddProductToCart(email, id, session, quantity);
        return "redirect:/product/" + id;
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User currentUser = this.userService.findByEmail(email);
        Cart cart = this.cartService.findByUser(currentUser);

        List<CartDetail> cartDetails = this.cartDetailService.findByCart(cart);
        double totalPrice = 0;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += (cartDetail.getPrice() * cartDetail.getQuantity());
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);

        return "client/cart/show";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(
        @ModelAttribute("cart") Cart cart, 
        HttpServletRequest request) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.cartService.handleUpdateCartBeforeCheckout(cartDetails);

        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User currentUser = this.userService.findByEmail(email);

        List<Address> addresses = this.addressService.findByUser(currentUser);
        if (addresses == null || addresses.isEmpty()){ 
            session.setAttribute("redirectTo", "/checkout");
            return "redirect:/account/add-address";
        }
            
        return "redirect:/checkout";
    }

    @GetMapping("/checkout")
    public String getCheckoutPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User currentUser = this.userService.findByEmail(email);
        Cart cart = this.cartService.findByUser(currentUser);

        List<CartDetail> cartDetails = this.cartDetailService.findByCart(cart);
        double totalPrice = 0;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += (cartDetail.getPrice() * cartDetail.getQuantity());
        }

        if (!this.addressService.existsByUser(currentUser)) {
            return "redirect:/account/add-address";
        }
        Address address = this.addressService.findByDefaultAddressAndUser(true, currentUser);
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("address", address);

        return "client/cart/checkout";
    }

    @GetMapping("/place-order")
    public String handlePlaceOrder(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User currentUser = this.userService.findByEmail(email);

        List<Address> addresses = this.addressService.findByUser(currentUser);
        if (addresses == null || addresses.isEmpty()) {
            return "redirect:/account/add-address";
        }

        this.orderService.handleSaveOrder(session, this.addressService.findByDefaultAddressAndUser(true, currentUser));

        return "redirect:/";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User currentUser = this.userService.findByEmail(email);
        List<Order> orders = this.orderService.findOrderByUser(currentUser);

        model.addAttribute("orders", orders);
        return "client/cart/order-history";
    }
    
    @PostMapping("/delete-product-from-cart/{id}")
    public String handleDeleteProductFromCart(@PathVariable long id, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User currentUser = this.userService.findByEmail(email);
        Cart cart = this.cartService.findByUser(currentUser);

        this.cartDetailService.deleteByCartAndProduct(cart, this.productService.findById(id));

        if(cart.getSum() > 0){
            long s = cart.getSum() - 1;
            cart.setSum(s);
            this.cartService.save(cart);
            session.setAttribute("sum", s);
        }
        
        return "redirect:/cart";
    }

    @GetMapping("/products")
    public String getFillterProductPage() {
        return "client/product/products";
    }
    

}