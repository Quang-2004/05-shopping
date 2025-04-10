package vn.quangkhongbiet.shopping.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
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
import vn.quangkhongbiet.shopping.service.util.UrlSlugging;

@Controller
@PreAuthorize("hasRole('ADMIN')")
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
    public String getProductPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // TODO: handle exception
        }

        Pageable pageable = PageRequest.of(page - 1, 10);
        Page<Product> PageProducts = this.productService.findAll(pageable);
        List<Product> products = PageProducts.getContent();

        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", PageProducts.getTotalPages());
        return "admin/product/show";
    }

    @GetMapping("/admin/product/{slugAndId}")
    public String getProductDetailPage(@PathVariable String slugAndId, Model model) {

        String[] parts = slugAndId.split("-");
        String idStr = parts[parts.length - 1];

        try {
            long id = Long.parseLong(idStr);
            Product product = this.productService.findById(id);
            model.addAttribute("product", product);
            return "admin/product/detail";
        } catch (NumberFormatException e) {
            return "client/error/404";
        }

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
        for (FieldError error : errors) {
            System.out.println(">>>>>>>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }

        // validate
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }

        // slugging
        String slug = UrlSlugging.toSlug(newProduct.getName());
        newProduct.setSlug(slug);

        String image = this.uploadService.handleSaveUploadFile(file, "product");
        newProduct.setImage(image);
        newProduct.setCategory(this.categoryService.findByName(newProduct.getCategory().getName()));
        this.productService.save(newProduct);

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{slugAndId}")
    public String getUpdateProductPage(Model model, @PathVariable String slugAndId) {

        String[] parts = slugAndId.split("-");
        String idStr = parts[parts.length - 1];
        try {
            long id = Long.parseLong(idStr);
            Product currentProduct = this.productService.findById(id);

            model.addAttribute("updateProduct", currentProduct);
            return "admin/product/update";
        } catch (NumberFormatException e) {
            return "client/error/404";
        }
    }

    @PostMapping("/admin/product/update")
    public String updateProductPage(Model model,
            @ModelAttribute("updateProduct") @Valid Product updateProduct,
            BindingResult newProductBindingResult,
            @RequestParam("imageFile") MultipartFile file) {

        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>>>>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }

        // validate
        if (newProductBindingResult.hasErrors()) {
            model.addAttribute("updateProduct", updateProduct);
            return "admin/product/update";
        }

        Product currentProduct = this.productService.findById(updateProduct.getId());
        if (currentProduct != null) {

            String image = this.uploadService.handleSaveUploadFile(file, "product");
            if (image != "")
                currentProduct.setImage(image);

            // update
            currentProduct.setName(updateProduct.getName());
            ;
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

    @GetMapping("/admin/product/delete/{slugAndId}")
    public String getProductDeletePage(Model model, @PathVariable String slugAndId) {

        String[] parts = slugAndId.split("-");
        String idStr = parts[parts.length - 1];
        try {
            long id = Long.parseLong(idStr);
            model.addAttribute("id", id);
            model.addAttribute("newProduct", new Product());
            return "admin/product/delete";
        } catch (NumberFormatException e) {
            return "client/error/404";
        }

    }

    @PostMapping("/admin/product/delete")
    public String deleteProductPage(Model model, @ModelAttribute("newProduct") Product newProduct) {
        this.productService.deleteById(newProduct.getId());
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/add-image-detail/{slugAndId}")
    public String getCreateImageDetailPage(Model model, @PathVariable String slugAndId) {
        String[] parts = slugAndId.split("-");
        String idStr = parts[parts.length - 1];

        try {
            long id = Long.parseLong(idStr);
            model.addAttribute("id", id);
            return "admin/product/add-image-detail";
        } catch (NumberFormatException e) {
            return "client/error/404";
        }

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
