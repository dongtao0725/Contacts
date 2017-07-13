package com.dongt.controller;

import com.dongt.domain.User;
import com.dongt.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by dongt on 2017/7/13.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("/login")
    public String login(@ModelAttribute("form") User user, HttpServletRequest request, HttpSession session ){
        User resultUser = userService.login(user);
        if(resultUser == null){
            request.setAttribute("user",user);
            request.setAttribute("errorMsg","Please check your username and password!");
            return "login";
        }else {
            session.setAttribute("currentUser",resultUser);
            session.setAttribute("username",resultUser.getUsername());
            return "redirect:main";
        }
    }

    @RequestMapping(value="/main")
    public String test(Model model) throws Exception{
        return "dashboard";
    }
}
