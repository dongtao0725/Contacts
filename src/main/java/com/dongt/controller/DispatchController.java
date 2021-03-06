package com.dongt.controller;

import com.dongt.domain.Department;
import com.dongt.domain.DispatchPrinciple;
import com.dongt.domain.DispatchRule;
import com.dongt.service.DepartmentService;
import com.dongt.service.DispatchPrincipleService;
import com.dongt.service.DispatchRuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/dispatch")
public class DispatchController {
    @Autowired
    private DispatchRuleService dispatchRuleService;
    @Autowired
    private DispatchPrincipleService dispatchPrincipleService;
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/list")
    public String getDispatchList(Integer dept_id,Integer secondaryDept_id, HttpServletRequest request, HttpSession session){
        Integer company_id = dept_id;
        List<Department> secondaryDeptList;
        Map<String,Object> map = new HashMap<String, Object>();

        if(dept_id==null ||  dept_id<=0){
            dept_id=1;
            company_id = dept_id;
        }else{
            Map<String,Object> map1 = new HashMap<String, Object>();
            map1.put("parent_id",dept_id);
            map1.put("rule",1);
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
        map.put("rule",1);
        request.setAttribute("company",departmentService.getDepartmentByDept_id(company_id));
        request.setAttribute("realCompany",departmentService.getDepartmentByDept_id(dept_id));
        request.setAttribute("dispatchPrinciple",dispatchPrincipleService.getDispatchPrincipleByDeptID(dept_id));
        request.setAttribute("dispatchRuleList",dispatchRuleService.getDispatchRuleByDeptId(dept_id));
        request.setAttribute("deptList",departmentService.getDepartmentByMap(map));
        request.setAttribute("dispatchRuleList",dispatchRuleService.getDispatchRuleByDeptId(dept_id));
        if(session.getAttribute("currentUser")==null ) {
            return "WEB-INF/views/dispatchList";
        }else{
            return "WEB-INF/views/admin/dispatchList";
        }
    }

    @RequestMapping("/search")
    public String search(@RequestParam("param") String param, HttpServletRequest request){
        request.setAttribute("dispatchRuleList",dispatchRuleService.getDispatchRuleByAreaOrDepartment('%'+param+'%'));
        return "WEB-INF/views/dispatchList";
    }

    @RequestMapping("/saveDispatchPrinciple")
    public String saveDispatchPrinciple(DispatchPrinciple dispatchPrinciple,HttpServletRequest request){
        if(dispatchPrinciple.getP_id()==null){
            dispatchPrincipleService.addDispatchPrinciple(dispatchPrinciple);
        }else {
            dispatchPrincipleService.updateDispatchPrinciple(dispatchPrinciple);
        }
        String url = request.getHeader("Referer");
        return "redirect:"+url;
    }

    @RequestMapping("/saveDispatchRule")
    public String saveDispatchPrinciple(DispatchRule dispatchRule, HttpServletRequest request){
        if(dispatchRule.getR_id()==null){
            dispatchRuleService.addDispatchRule(dispatchRule);
        }else {
            dispatchRuleService.updateDispatchRule(dispatchRule);
        }
        String url = request.getHeader("Referer");
        return "redirect:"+url;
    }

    @RequestMapping("/deleteDispatchRule")
    public String deleteDispatchRule(Integer r_id,HttpServletRequest request){
        if(r_id!=null && r_id>0) {
            dispatchRuleService.deleteDispatchRule(r_id);
        }
        String url = request.getHeader("Referer");
        return "redirect:"+url;
    }
}
