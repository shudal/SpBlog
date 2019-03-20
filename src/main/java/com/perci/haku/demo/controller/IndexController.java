package com.perci.haku.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController extends BaseController{
    @RequestMapping("/")
    public String index(ModelMap map) {
        map.addAttribute("title", "首页");

        map.addAttribute("name", "kevin");
        map.put("sex", 1);

        List<String> userList = new ArrayList<String>();
        userList.add("hubbert");
        userList.add("cai");
        userList.add("xu");
        map.addAttribute("userList", userList);
        return "index/index";
    }
}
