package vn.quangkhongbiet.shopping.controller.client;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.quangkhongbiet.shopping.domain.Address;
import vn.quangkhongbiet.shopping.domain.Cart;
import vn.quangkhongbiet.shopping.domain.CartDetail;
import vn.quangkhongbiet.shopping.domain.Category;
import vn.quangkhongbiet.shopping.domain.ImageDetail;
import vn.quangkhongbiet.shopping.domain.Order;
import vn.quangkhongbiet.shopping.domain.OrderDetail;
import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.domain.Product_;
import vn.quangkhongbiet.shopping.domain.Review;
import vn.quangkhongbiet.shopping.domain.User;
import vn.quangkhongbiet.shopping.domain.DTO.ProductCriteriaDTO;
import vn.quangkhongbiet.shopping.service.AddressService;
import vn.quangkhongbiet.shopping.service.CartDetailService;
import vn.quangkhongbiet.shopping.service.CartService;
import vn.quangkhongbiet.shopping.service.CategoryService;
import vn.quangkhongbiet.shopping.service.ImageDetailService;
import vn.quangkhongbiet.shopping.service.OrderDetailService;
import vn.quangkhongbiet.shopping.service.OrderService;
import vn.quangkhongbiet.shopping.service.ProductService;
import vn.quangkhongbiet.shopping.service.ReviewService;
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
    private final CategoryService categoryService;
    private final ReviewService reviewService;
    private final OrderDetailService orderDetailService;

    public ItemController(
            ProductService productService,
            ImageDetailService imageDetailService,
            UserService userService,
            CartService cartService,
            CartDetailService cartDetailService,
            AddressService addressService,
            OrderService orderService,
            CategoryService categoryService,
            ReviewService reviewService,
            OrderDetailService orderDetailService) {

        this.productService = productService;
        this.imageDetailService = imageDetailService;
        this.userService = userService;
        this.cartService = cartService;
        this.cartDetailService = cartDetailService;
        this.addressService = addressService;
        this.orderService = orderService;
        this.categoryService = categoryService;
        this.reviewService = reviewService;
        this.orderDetailService = orderDetailService;
    }

    @GetMapping("/product/{id}")
    public String getDetailProductPage(
        @PathVariable long id,
        Model model) {

        Product product = this.productService.findById(id);
        List<ImageDetail> imageDetails = this.imageDetailService.findByProduct(product);
        List<Category> categories = this.categoryService.findAll();
        // sản phẩm gợi ý
        List<Product> productSuggestions = this.productService.findProductSuggestionWithSpec(product.getCategory().getName());
        // all comment
        List<Review> allComments = this.reviewService.findByProduct(product);
        // filter rating 5
        List<Review> reviews_rating_5 = this.reviewService.findByProductAndRating(product, 5);
        // filter rating 4
        List<Review> reviews_rating_4 = this.reviewService.findByProductAndRating(product, 4);
        // filter rating 3
        List<Review> reviews_rating_3 = this.reviewService.findByProductAndRating(product, 3);
        // filter rating 2
        List<Review> reviews_rating_2 = this.reviewService.findByProductAndRating(product, 2);
        // filter rating 1
        List<Review> reviews_rating_1 = this.reviewService.findByProductAndRating(product, 1);

        model.addAttribute("product", product);
        model.addAttribute("imageDetails", imageDetails);
        model.addAttribute("categories", categories);
        model.addAttribute("productSuggestions", productSuggestions);
        model.addAttribute("reviews_rating_1", reviews_rating_1);
        model.addAttribute("reviews_rating_2", reviews_rating_2);
        model.addAttribute("reviews_rating_3", reviews_rating_3);
        model.addAttribute("reviews_rating_4", reviews_rating_4);
        model.addAttribute("reviews_rating_5", reviews_rating_5);
        model.addAttribute("allComments", allComments);
        
        model.addAttribute("total_rating_5", reviews_rating_5.size());
        model.addAttribute("total_rating_4", reviews_rating_4.size());
        model.addAttribute("total_rating_3", reviews_rating_3.size());
        model.addAttribute("total_rating_2", reviews_rating_2.size());
        model.addAttribute("total_rating_1", reviews_rating_1.size());
       
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
        if (addresses == null || addresses.isEmpty()) {
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
        List<Category> categories = this.categoryService.findAll();


        model.addAttribute("orders", orders);
        model.addAttribute("categories", categories);
        return "client/cart/order-history";
    }

    @PostMapping("/delete-product-from-cart/{id}")
    public String handleDeleteProductFromCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User currentUser = this.userService.findByEmail(email);
        Cart cart = this.cartService.findByUser(currentUser);

        this.cartDetailService.deleteByCartAndProduct(cart, this.productService.findById(id));

        if (cart.getSum() > 0) {
            long s = cart.getSum() - 1;
            cart.setSum(s);
            this.cartService.save(cart);
            session.setAttribute("sum", s);
        }

        return "redirect:/cart";
    }

    @GetMapping("/products")
    public String getFillterProductPage(
            Model model,
            HttpServletRequest request,
            ProductCriteriaDTO productCriteriaDTO) {

        int page = 1;
        try {
            if (productCriteriaDTO.getPage().isPresent()) {
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // TODO: handle exception
        }

        Pageable pageable = PageRequest.of(page - 1, 12);
        if (productCriteriaDTO.getSort() != null) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("tang-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("giam-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).descending());
            }
        }

        Page<Product> PageProducts = this.productService.findAllWithSpec(pageable, productCriteriaDTO);
        List<Product> products = PageProducts.getContent();
        List<Category> categories = this.categoryService.findAll();

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            // remove page
            qs = qs.replace("page=" + page, "");
        }
        long totalProducts = PageProducts.getTotalElements();

        model.addAttribute("products", products);
        model.addAttribute("categories", categories);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", PageProducts.getTotalPages());
        model.addAttribute("queryString", qs);
        model.addAttribute("totalProducts", totalProducts);
        model.addAttribute("search", productCriteriaDTO.getSearch() != null ? productCriteriaDTO.getSearch().get() : "");
        return "client/product/products";
    }

    @GetMapping("/product-review")
    public String getRevewPage(
        HttpServletRequest request,
        @ModelAttribute("review") Review review,
        @RequestParam("productId") long productId, 
        @RequestParam("orderDetailId") long orderDetailId,
        Model model) {
        Product product = this.productService.findById(productId);
       
        model.addAttribute("product", product);
        model.addAttribute("orderDetailId", orderDetailId);
        model.addAttribute("review", new Review());
        return "client/product/product-review";
    }

    @PostMapping("/product-review")
    public String handleSaveReviewProduct(
        HttpServletRequest request,
        @ModelAttribute("review") Review review,
        @RequestParam("productId") long productId,
        @RequestParam("orderDetailId") long orderDetailId,
        @RequestParam("imageReivew") MultipartFile fileImage,
        @RequestParam("videoReview") MultipartFile fileVideo) {

    
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User currentUser = this.userService.findByEmail(email);

        Product product = this.productService.findById(productId);
        // tăng 1 đánh giá 
        product.setTotalReview(product.getTotalReview() + 1);
        product.setTotalRating(product.getTotalRating() + review.getRating());

        review.setProduct(product);
        review.setUser(currentUser);
    
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedTime = LocalDateTime.now().format(formatter);
        LocalDateTime currentTime = LocalDateTime.parse(formattedTime, formatter);

        OrderDetail orderDetail = this.orderDetailService.findById(orderDetailId);
        orderDetail.setEvaluated(true); // đã review product

        

        // tạm thời chưa lưu ảnh và video review
        // đợi học rest api

        review.setPostingDate(currentTime);
        this.reviewService.save(review);
        this.orderDetailService.save(orderDetail);
        this.productService.save(product);

        return "redirect:/order-history";
    }

}