package com.perci.haku.demo.controller;

import com.perci.haku.demo.entity.Blog;
import com.perci.haku.demo.service.BlogService;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

@Controller
public class BlogController {
    @Autowired
    BlogService blogService;

    @RequestMapping("/blog/add/index")
    public String addIndex() {
        return "blog/add";
    }
    @RequestMapping("/blog/all/index")
    public String allIndex(ModelMap map) {
        return "blog/all";
    }

    @RequestMapping(value = "/blog/add", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> add (HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", -1);
        map.put("msg", "invalid");

        Cookie[] cookies = request.getCookies();

        boolean tai = false;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("role")) {
                    if (cookie.getValue().equals("1")) {
                        tai = true;
                        break;
                    }
                }
            }
        }

        if (tai) {
            try {
                String title = request.getParameter("title");
                String content = request.getParameter("content");

                if (title.equals("") || content.equals("")) {
                    map.put("msg", "can_not_null");
                    return map;
                }

                Blog blog = new Blog();
                blog.setTitle(title);
                blog.setContent(content);
                blog.setCreate_time(Calendar.getInstance().getTimeInMillis()/100);
                blog.setUpdate_time(blog.getCreate_time());
                blogService.save(blog);

                map.put("code", 1);
                map.put("msg", "OK");
                return map;
            } catch (Exception e) {
                map.put("msg", e.getMessage());
            }
        }
        return map;

    }
}
