package vn.quangkhongbiet.shopping.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.quangkhongbiet.shopping.domain.Address;
import vn.quangkhongbiet.shopping.domain.Order;
import vn.quangkhongbiet.shopping.domain.OrderDetail;
import vn.quangkhongbiet.shopping.domain.Product;
import vn.quangkhongbiet.shopping.service.AddressService;
import vn.quangkhongbiet.shopping.service.OrderDetailService;
import vn.quangkhongbiet.shopping.service.OrderService;



@Controller
public class OrderController {

    private final OrderService orderService;
    private final OrderDetailService orderDetailService;
    private final AddressService addressService;
    

    public OrderController(OrderService orderService, OrderDetailService orderDetailService, AddressService addressService) {
        this.orderService = orderService;
        this.orderDetailService = orderDetailService;
        this.addressService = addressService;
    }

    @GetMapping("/admin/order")
    public String getOrderPage(Model model, @RequestParam("page")  Optional<String> pageOptional) {
        int page = 1;
        try {
            if(pageOptional.isPresent()){
                page = Integer.parseInt(pageOptional.get());
            }
            else{
                // page = 1
            }
        } catch (Exception e) {
            // TODO: handle exception
        }

        Pageable pageable = PageRequest.of(page - 1, 10);
        Page<Order> PageOrders = this.orderService.findAll(pageable);
        List<Order> orders = PageOrders.getContent();

        model.addAttribute("orders", orders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", PageOrders.getTotalPages());
        return "admin/order/show";
    }

    @GetMapping("/admin/order/{id}")
    public String getDetailOrderPage(@PathVariable long id, Model model) {
        List<OrderDetail> orderDetails = this.orderDetailService.findByOrder(this.orderService.findById(id));

        model.addAttribute("orderDetails", orderDetails);
        return "admin/order/detail";
    }

    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrderPage(Model model, @PathVariable long id) {
        Order order = this.orderService.findById(id);
        Address address = this.addressService.findById(order.getAddress().getId());

        model.addAttribute("order", order);
        model.addAttribute("address", address);

        return "admin/order/update";
    }

     @PostMapping("/admin/order/update")
    public String updateProductPage(Model model, 
        @ModelAttribute("order") Order updateOrder) {

        Order currentOrder = this.orderService.findById(updateOrder.getId());
        if(currentOrder != null){

            // update
            currentOrder.setStatus(updateOrder.getStatus());

            // save order
            this.orderService.save(currentOrder);
            
        }
        
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String getOrderDeletePage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("order", new Order());
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String deleteOrderPage(Model model, @ModelAttribute("order") Order order) {
        this.orderDetailService.deleteByOrder(order);
        this.orderService.deleteById(order.getId());
        return "redirect:/admin/order";
    }
    
    
}
