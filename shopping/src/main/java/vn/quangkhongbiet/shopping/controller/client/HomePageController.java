package vn.quangkhongbiet.shopping.controller.client;

import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.quangkhongbiet.shopping.domain.Address;
import vn.quangkhongbiet.shopping.domain.Category;
import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.domain.User;
import vn.quangkhongbiet.shopping.domain.DTO.RegisterDTO;
import vn.quangkhongbiet.shopping.service.AddressService;
import vn.quangkhongbiet.shopping.service.CategoryService;
import vn.quangkhongbiet.shopping.service.ProductService;
import vn.quangkhongbiet.shopping.service.RoleService;
import vn.quangkhongbiet.shopping.service.UserService;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final RoleService roleService;
    private final AddressService addressService;
    private final CategoryService categoryService;

    public HomePageController(
            ProductService productService,
            UserService userService,
            PasswordEncoder passwordEncoder,
            RoleService roleService,
            AddressService addressService,
            CategoryService categoryService) {

        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.roleService = roleService;
        this.addressService = addressService;
        this.categoryService = categoryService;
    }

    @GetMapping("/")
    public String requestMethodName(Model model) {
        List<Product> products = this.productService.findAll();
        List<Category> categories = this.categoryService.findAll();

        model.addAttribute("products", products);
        model.addAttribute("categories", categories);
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

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        RegisterDTO registerDTO = new RegisterDTO();
        model.addAttribute("registerUser", registerDTO);
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(
            Model model,
            @ModelAttribute("registerUser") @Valid RegisterDTO registerUser,
            BindingResult newUserBindingResult,
            HttpServletRequest request) {

        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>>>>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }

        // validate
        if (newUserBindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.registerDTOtoUser(registerUser);
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        user.setRole(this.roleService.findByName("USER"));
        // save
        this.userService.save(user);

        // add information in session
        HttpSession session = request.getSession(false);
        session.setAttribute("fullName", user.getFullName());
        session.setAttribute("avatar", user.getAvatar());
        session.setAttribute("id", user.getId());
        session.setAttribute("email", user.getEmail());

        long sum = user.getCart() == null ? 0 : user.getCart().getSum();
        session.setAttribute("sum", sum);

        return "redirect:/";
    }

    @GetMapping("/access-deny")
    public String getAccessDenyPage() {
        return "client/access-deny/deny";
    }

    @GetMapping("/account/add-address")
    public String getAddressPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User currentUser = this.userService.findByEmail(email);

        Address address = null;
        if (this.addressService.existsByUser(currentUser)) {
            address = this.addressService.findByDefaultAddressAndUser(true, currentUser);
        } else {
            address = new Address();
        }

        model.addAttribute("address", address);

        return "client/my-account/address";
    }

    @PostMapping("/account/add-address")
    public String handleAddAddress(
            Model model,
            @ModelAttribute("address") @Valid Address address,
            BindingResult newAddressBindingResult,
            HttpServletRequest request) {

        List<FieldError> errors = newAddressBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>>>>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }

        // validate
        if (newAddressBindingResult.hasErrors()) {
            return "client/my-account/address";
        }

        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User currentUser = this.userService.findByEmail(email);

        List<Address> addresses = this.addressService.findByUser(currentUser);

        if (addresses == null || addresses.isEmpty()) {
            address.setDefaultAddress(true);
            address.setUser(currentUser);
        } else {
            address.setDefaultAddress(false);
            address.setUser(currentUser);
        }

        // save address
        this.addressService.save(address);

        model.addAttribute("addresses", addresses);

        String redirectTo = (String) session.getAttribute("redirectTo");
        if(redirectTo.equals("/checkout")){
            return "redirect:" + redirectTo;
        }
        else if(redirectTo.equals("/account/change-address")){
            return "redirect:" + redirectTo;
        }
        return "redirect:/checkout";
    }

    @GetMapping("/account/change-address")
    public String getChangeAddressPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User currentUser = this.userService.findByEmail(email);

        Address myAddress = this.addressService.findByDefaultAddressAndUser(true, currentUser);
        List<Address> addresses = this.addressService.findByUser(currentUser);

        // add redirect after add-address 
        session.setAttribute("redirectTo", "/account/change-address");
        
        model.addAttribute("addresses", addresses);
        model.addAttribute("myAddress", myAddress);
        return "client/my-account/change-address";
    }

    @PostMapping("/account/change-default-address")
    public String handleChangeDefaultAddress(@RequestParam("id") Optional<String> IdOpional,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User currentUser = this.userService.findByEmail(email);

        if (IdOpional.isPresent()) {
            // delete default address
            this.addressService.handleChangeDefaultAddress(currentUser);

            Address address = this.addressService.findById(Long.parseLong(IdOpional.get()));
            // set default address
            address.setDefaultAddress(true);
        }
        return "redirect:/checkout";
    }

    @GetMapping("/account/update-address")
    public String getUpdateAddressPage() {
        return "client/my-account/update-address";
    }

    @PostMapping("/account/update-address")
    public String handleUpdateAddress() {
        // TODO: process POST request

        return "";
    }

}
