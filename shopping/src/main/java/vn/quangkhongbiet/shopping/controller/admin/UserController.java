package vn.quangkhongbiet.shopping.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.quangkhongbiet.shopping.domain.User;
import vn.quangkhongbiet.shopping.service.RoleService;
import vn.quangkhongbiet.shopping.service.UploadService;
import vn.quangkhongbiet.shopping.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {

    private final UserService userService;
    private final RoleService roleService;
    private final PasswordEncoder passwordEncoder;
    private final UploadService uploadService;

    public UserController(
            UserService userService,
            RoleService roleService,
            PasswordEncoder passwordEncoder,
            UploadService uploadService) {

        this.userService = userService;
        this.roleService = roleService;
        this.passwordEncoder = passwordEncoder;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.findAll();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(@PathVariable long id, Model model) {
        User user = this.userService.findById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String handleCreateUser(
            Model model,
            @ModelAttribute("newUser") @Valid User user,
            BindingResult newUserBindingResult,
            @RequestParam("avatarFile") MultipartFile file,
            HttpServletRequest request) {

         // get session
         HttpSession session = request.getSession(false);

        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>>>>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }

        // validate
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        user.setRole(this.roleService.findByName(user.getRole().getName()));
        user.setPassword(this.passwordEncoder.encode(user.getPassword()));
        if (file != null) {
            String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
            user.setAvatar(avatar);

            session.setAttribute("avatar", avatar);
        }

        this.userService.save(user);

        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUser(Model model, @PathVariable long id) {
        User user = this.userService.findById(id);
        model.addAttribute("updateUser", user);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String handleUpdateUser(
            Model model,
            @ModelAttribute("updateUser") @Valid User updateUser,
            BindingResult newUserBindingResult,
            @RequestParam("avatarFile") MultipartFile file,
            HttpServletRequest request) {

        // get session
        HttpSession session = request.getSession(false);

        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>>>>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }

        // validate
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/update";
        }

        // get user current
        User currentUser = this.userService.findById(updateUser.getId());
        if (currentUser != null) {
            currentUser.setFullName(updateUser.getFullName());
            currentUser.setPhoneNumber(updateUser.getPhoneNumber());
            currentUser.setSex(updateUser.getSex());
            if (file != null) {
                String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
                currentUser.setAvatar(avatar);

                session.setAttribute("avatar", avatar);
            }

            // save user
            this.userService.save(currentUser);
        }

        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("user", new User());
        model.addAttribute("id", id);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String handleDeleteUser(@ModelAttribute("user") User user) {
        this.userService.delete(user);
        return "redirect:/admin/user";
    }

}
