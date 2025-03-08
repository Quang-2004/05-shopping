package vn.quangkhongbiet.shopping.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class test {
    @GetMapping("/")
    public String getMethodName() {
        return "sdjaksfhkajsdhf";
    }
  
}
