package com.dongt.controller;

import com.dongt.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by dongtao on 2017/7/19.
 */
@Controller
@RequestMapping("/dept")
public class DeptController {
    @Resource
    private  DepartmentService departmentService;

   @RequestMapping("/deptlist")
   public String getAllDepartment(HttpServletRequest request){
        request.setAttribute("AllDepartmentList",departmentService.getAllDepartment());
        return "WEB-INF/views/deptlist";
    }
}
