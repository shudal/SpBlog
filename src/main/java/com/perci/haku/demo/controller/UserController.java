package com.perci.haku.demo.controller;

import com.perci.haku.demo.entity.User;
import com.perci.haku.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("/blog/login/index")
    public String loginIndex(ModelMap map) {
        map.addAttribute("title", "登录");
        return "user/login";
    }

    @RequestMapping("/blog/regis/index")
    public String regisIndex(ModelMap map) {
        map.addAttribute("title", "注册");
        return "user/regis";
    }

    @ResponseBody
    @RequestMapping(value = "/blog/login", method = RequestMethod.POST)
    public Map<String, Object> login(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", -1);
        try {
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("role")) {
                        map.put("msg", "login_already");
                        return map;
                    }
                }
            }

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User user = userService.findByUsername(username);

            if (user == null) {
                map.put("msg", "username_not_exist");
                return map;
            }

            if (!DigestUtils.md5DigestAsHex(password.getBytes()).equals(user.getPassword())) {
                map.put("msg", "password_wrong");
                return map;
            }

            Cookie cookie = new Cookie("role", user.getRole()+ "");
            response.addCookie(cookie);

            map.put("code", 1);
            map.put("msg", "OK");
            return map;
        } catch (Exception e) {
            map.put("msg", e.getMessage());
            return map;
        }
    }

    @ResponseBody
    @RequestMapping(value = "/blog/regis", method = RequestMethod.POST)
    public Map<String, Object> regis(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", -1);

        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String nickname = request.getParameter("nickname");

            if (username.equals("") || password.equals("")) {

            }

            if(userService.findByUsername(username) != null) {
                map.put("msg", "username_exist");
                return map;
            }

            User user = new User();
            user.setUsername(username);
            user.setPassword(DigestUtils.md5DigestAsHex(password.getBytes()));
            user.setNickname(nickname);

            userService.save(user);

            map.put("code", 1);
            map.put("msg", "OK");

            return map;
        } catch (Exception e) {
            map.put("msg", e.getMessage());
            return map;
        }
    }
}
