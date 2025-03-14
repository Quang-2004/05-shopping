package vn.quangkhongbiet.shopping.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.quangkhongbiet.shopping.domain.ImageDetail;
import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.service.CategoryService;
import vn.quangkhongbiet.shopping.service.ImageDetailService;
import vn.quangkhongbiet.shopping.service.ProductService;
import vn.quangkhongbiet.shopping.service.UploadService;


@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;
    private final CategoryService categoryService;
    private final ImageDetailService imageDetailService;
    
    public ProductController(
        ProductService productService, 
        UploadService uploadService, 
        CategoryService categoryService, 
        ImageDetailService imageDetailService) {


        this.productService = productService;
        this.uploadService = uploadService;
        this.categoryService = categoryService;
        this.imageDetailService = imageDetailService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        List<Product> products = this.productService.findAll();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(@PathVariable long id, Model model) {
        Product product = this.productService.findById(id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());

        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProductPage(Model model, 
        @ModelAttribute("newProduct") @Valid Product newProduct,
        BindingResult newProductBindingResult,
        @RequestParam("imageFile") MultipartFile file) {
        
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors ) {
            System.out.println (">>>>>>>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }

        // validate
        if(newProductBindingResult.hasErrors()){
            return "admin/product/create";
        }

        
        String image = this.uploadService.handleSaveUploadFile(file, "product");
        newProduct.setImage(image);
        newProduct.setCategory(this.categoryService.findByName(newProduct.getCategory().getName()));
        this.productService.save(newProduct);
        
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.findById(id);

        model.addAttribute("updateProduct", currentProduct);

        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String updateProductPage(Model model, 
        @ModelAttribute("updateProduct") @Valid Product updateProduct,
        BindingResult newProductBindingResult,
        @RequestParam("imageFile") MultipartFile file) {
        
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors ) {
            System.out.println (">>>>>>>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }

        // validate
        if(newProductBindingResult.hasErrors()){
            model.addAttribute("updateProduct", updateProduct);
            return "admin/product/update";
        }
        
        Product currentProduct = this.productService.findById(updateProduct.getId());
        if(currentProduct != null){
            
            String image = this.uploadService.handleSaveUploadFile(file, "product");
            if(image != "") currentProduct.setImage(image);

            // update
            currentProduct.setName(updateProduct.getName());;
            currentProduct.setPrice(updateProduct.getPrice());
            currentProduct.setDetailDesc(updateProduct.getDetailDesc());
            currentProduct.setShortDesc(updateProduct.getShortDesc());
            currentProduct.setQuantity(updateProduct.getQuantity());
            currentProduct.setFactory(updateProduct.getFactory());
            currentProduct.setTarget(updateProduct.getTarget());
            currentProduct.setColor(updateProduct.getColor());
            currentProduct.setSize(updateProduct.getSize());
            currentProduct.setCategory(this.categoryService.findByName(updateProduct.getCategory().getName()));
            

            // save product
            this.productService.save(currentProduct);
            
        }
        
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getProductDeletePage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String deleteProductPage(Model model, @ModelAttribute("newProduct") Product newProduct) {
        this.productService.deleteById(newProduct.getId());
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/add-image-detail/{id}")
    public String getCreateImageDetailPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        return "admin/product/add-image-detail";
    }

    @PostMapping("/admin/product/add-image-detail")
    public String handleCreateImageDetailPage(
        Model model, 
        @RequestParam("id") long id,
        @RequestParam("imageFile") MultipartFile[] multipartFiles) {

        List<String> images = this.uploadService.handleSaveUploadMultiFile(multipartFiles, "product");
        Product product = this.productService.findById(id);

        
        for (String image : images) {
            ImageDetail imageDetail = new ImageDetail();
            imageDetail.setImageProduct(image);
            imageDetail.setProduct(product);
            this.imageDetailService.save(imageDetail);
        }

        model.addAttribute("updateProduct", product);


        return "admin/product/update";
    }
    
    
}
