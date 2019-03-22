package com.perci.haku.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @RequestMapping("/blog/admin/index")
    public String index(ModelMap map, @CookieValue("role") String role) {
        if (! role.equals("1")) {
            return  "";
        }
        map.addAttribute("title", "管理");
        return "admin/index";
    }
}
