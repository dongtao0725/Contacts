package com.dongt.controller;

import com.dongt.domain.Management_Role;
import com.dongt.domain.User;
import com.dongt.service.M_RoleService;
import com.dongt.service.UserService;
import com.dongt.util.MD5Util;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by dongt on 2017/7/13.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;
    @Resource
    private M_RoleService m_roleService;

    MD5Util MD5Util = new MD5Util();

    @RequestMapping("/login")
    public String login(@ModelAttribute("form") User user, HttpServletRequest request, HttpSession session ){
        user.setPassword(MD5Util.getMD5(user.getPassword()));
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

    @RequestMapping("/logout")
    public String logout(HttpSession session) throws Exception{
        session.invalidate();
        return "redirect:/login.jsp";
    }

    @RequestMapping("/userlist")
    public String userlist(User user, HttpServletRequest request) throws  Exception{
        Map<String,Object> map = new HashMap<String, Object>();
        String username = user.getUsername();
        if (username!=null ){
            map.put("username","%"+username+"%");
        }
        List<User> userlist = userService.findUsers(map);
        List<Management_Role> m_Rolelist = m_roleService.getAllM_Role();
        request.setAttribute("m_Rolelist",m_Rolelist);
        request.setAttribute("userlist",userlist);
        return "WEB-INF/views/userlist";
    }

    @RequestMapping("/saveuser")
    public String saveuser(User user)throws Exception{
        if (user.getId()==null){
            user.setPassword(MD5Util.getMD5(user.getPassword()));
            userService.addUser(user);
        }else{
            user.setPassword(MD5Util.getMD5(user.getPassword()));
            userService.updateUser(user);
        }
        return "redirect:userlist";
    }

    @RequestMapping(value = "/deleteuser" ,method= RequestMethod.GET)
    public String deleteuser(Integer id) throws Exception{
        userService.deleteUser(id);
        return "redirect:userlist";
    }

}
