package vn.quangkhongbiet.shopping.controller.admin;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
@PreAuthorize("hasRole('ADMIN')")
public class DashBoardController {
    
    @GetMapping("/admin")
    public String getDashBoardPage() {
        return "admin/homepage/show";
    }
    
}
