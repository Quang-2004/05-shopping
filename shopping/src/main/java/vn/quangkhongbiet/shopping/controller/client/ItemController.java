package vn.quangkhongbiet.shopping.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.quangkhongbiet.shopping.domain.ImageDetail;
import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.service.ImageDetailService;
import vn.quangkhongbiet.shopping.service.ProductService;

@Controller
public class ItemController {

    private final ProductService productService;
    private final ImageDetailService imageDetailService;

    public ItemController(
        ProductService productService, 
        ImageDetailService imageDetailService) {


        this.productService = productService;
        this.imageDetailService = imageDetailService;
    }

    @GetMapping("/product/{id}")
    public String getDetailProductPage(@PathVariable long id, Model model) {
        Product product = this.productService.findById(id);
        List<ImageDetail> imageDetails = this.imageDetailService.findByProduct(product);

        model.addAttribute("product", product);
        model.addAttribute("imageDetails", imageDetails);
        return "client/product/detail";
    }
}
