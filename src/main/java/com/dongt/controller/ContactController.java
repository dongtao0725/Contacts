package com.dongt.controller;

import com.dongt.service.ContactService;
import com.dongt.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/contact")
public class ContactController {
    @Autowired
    private ContactService contactService;
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/dept_id")
    public String getContactsByDeptID(Integer dept_id, HttpServletRequest request){
        if(dept_id==null ||  dept_id<=0){
            dept_id=1;
        }
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("level",1);
            request.setAttribute("contactslist",contactService.getContactsByDeptID(dept_id));
            request.setAttribute("deptlist",departmentService.getDepartmentByMap(map));
            return "WEB-INF/views/contactslist";
    }
}
