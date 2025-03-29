package vn.quangkhongbiet.shopping.controller.client;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.quangkhongbiet.shopping.service.ProductService;

class CartRequest {
    private long quantity;
    private long productId;

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }
}

@RestController
public class CartAPI {

    private final ProductService productService;

    public CartAPI(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping("/api/add-product-to-cart")
    public ResponseEntity<Integer> addProductToCart(
            @RequestBody CartRequest cartRequest,
            HttpServletRequest request) {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            return ResponseEntity.status(401).body(-1); // Chưa đăng nhập
        }

        String email = (String) session.getAttribute("email");
        try {
            this.productService.handleAddProductToCart(email, cartRequest.getProductId(), session,
                    cartRequest.getQuantity());
            int sum = ((Number) session.getAttribute("sum")).intValue();
            return ResponseEntity.ok().body(sum);
        } catch (Exception e) {
            e.printStackTrace(); // Log lỗi để debug
            return ResponseEntity.status(500).body(-1); // Lỗi server
        }
    }

}
