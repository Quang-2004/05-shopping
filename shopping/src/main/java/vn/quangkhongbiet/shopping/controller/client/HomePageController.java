package vn.quangkhongbiet.shopping.controller.client;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.domain.User;
import vn.quangkhongbiet.shopping.domain.DTO.RegisterDTO;
import vn.quangkhongbiet.shopping.service.ProductService;
import vn.quangkhongbiet.shopping.service.RoleService;
import vn.quangkhongbiet.shopping.service.UserService;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final RoleService roleService;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder,
            RoleService roleService) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.roleService = roleService;
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

}
