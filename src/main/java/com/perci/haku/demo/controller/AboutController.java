package com.perci.haku.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutController extends BaseController{
    @RequestMapping("blog/about/index")
    public String about(ModelMap map) {
        map.addAttribute("title", "关于");

        return "about/index";
    }
}
