package com.dongt.controller;

import com.dongt.domain.Department;
import com.dongt.service.DepartmentService;
import com.dongt.service.DispatchRuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
        request.setAttribute("dispatchRuleList",dispatchRuleService.getDispatchRuleByDeptId(dept_id));
        request.setAttribute("deptList",departmentService.getDepartmentByMap(map));
        request.setAttribute("dispatchRuleList",dispatchRuleService.getDispatchRuleByDeptId(dept_id));
        if(session.getAttribute("currentUser")==null ) {
            return "WEB-INF/views/dispatchList";
        }else{
            return "WEB-INF/views/admin/dispatchList";
        }
    }
}
