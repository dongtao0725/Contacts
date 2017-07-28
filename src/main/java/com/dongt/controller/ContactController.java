package com.dongt.controller;

import com.dongt.domain.Contact;
import com.dongt.domain.Department;
import com.dongt.service.ContactService;
import com.dongt.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/contact")
public class ContactController {
    @Autowired
    private ContactService contactService;
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/dept_id")
    public String getContactsByDeptID(Integer dept_id, Integer secondaryDept_id, HttpServletRequest request, HttpSession session){
        Integer company_id = dept_id;
        List<Department> secondaryDeptList;
        Map<String,Object> map = new HashMap<String, Object>();

        if(dept_id==null ||  dept_id<=0){
            dept_id=1;
            company_id = dept_id;
        }else{
            Map<String,Object> map1 = new HashMap<String, Object>();
            map1.put("parent_id",dept_id);
            map1.put("contacts",1);
            secondaryDeptList = departmentService.getDepartmentByMap(map1);
            if(null != secondaryDeptList && secondaryDeptList.size() > 0){
                if(secondaryDept_id==null || secondaryDept_id<=0) {
                    dept_id = secondaryDeptList.get(0).getDept_id();
                }else{
                    dept_id=secondaryDept_id;
                }
                request.setAttribute("secondaryDeptList",secondaryDeptList);
            }
        }

        map.put("level",1);
        map.put("contacts",1);
        request.setAttribute("company",departmentService.getDepartmentByDept_id(company_id));
        request.setAttribute("realCompany",departmentService.getDepartmentByDept_id(dept_id));
        request.setAttribute("contactsList",contactService.getContactsByDeptID(dept_id));
        request.setAttribute("deptList",departmentService.getDepartmentByMap(map));
        if(session.getAttribute("currentUser")==null ) {
            return "WEB-INF/views/contactslist";
        }else{
            return "WEB-INF/views/admin/contactslist";
        }
    }

    @RequestMapping("/search")
    public String search(@RequestParam("name") String name,HttpServletRequest request){
        request.setAttribute("contactsList",contactService.getContactsByName('%'+name+'%'));
        return "WEB-INF/views/contactslist";
    }

    @RequestMapping("/saveContact")
    public String saveContact(Contact contact, HttpServletRequest request){
        if(contact.getC_id()==null){
            contactService.addContact(contact);
        }else{
            contactService.updateContact(contact);
        }
        String url = request.getHeader("Referer");
        return "redirect:"+url;
    }

    @RequestMapping("/deleteContact")
    public String deleteContact(Integer c_id,HttpServletRequest request){
        if(c_id!=null && c_id>0) {
            contactService.deleteContact(c_id);
        }
        String url = request.getHeader("Referer");
        return "redirect:"+url;
    }
}
