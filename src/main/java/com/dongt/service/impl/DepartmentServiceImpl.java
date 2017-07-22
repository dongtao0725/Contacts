package com.dongt.service.impl;

import com.dongt.dao.DepartmentDao;
import com.dongt.domain.Department;
import com.dongt.service.DepartmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

/**
 * Created by dongtao on 2017/7/18.
 */
@Service("DepartmentService")
public class DepartmentServiceImpl implements DepartmentService {
    @Resource
    private DepartmentDao departmentDao;

    public List<Department> getAllDepartment(){
        //return departmentDao.getAllDepartment();
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("level",1);
        List<Department> departmentList=departmentDao.getDepartmentByMap(map);
        return TreeDepartmentList(departmentList);
    }

    public Department getDepartmentByDept_id(Integer dept_id){
        return departmentDao.getDepartmentByDept_id(dept_id);
    }

    public List<Department> getDepartmentByMap(Map<String,Object> map){
        return departmentDao.getDepartmentByMap(map);
    }

    public void addDepartment(Department department){
        departmentDao.addDepartment(department);
    }

    public void updateDepartment(Department department){
        departmentDao.updateDepartment(department);
    }
    public void deleteDepartment(Integer dept_id){
        departmentDao.deleteDepartment(dept_id);
    }


    public List<Department> TreeDepartmentList(List<Department> departmentList) {
        List<Department> childDepartmentList = new ArrayList<Department>();
        for (Department department : departmentList) {
            int dept_id = department.getDept_id();
            childDepartmentList.add(department);
            Map<String,Object> map = new HashMap<String, Object>();
            map.put("parent_id",dept_id);
            List<Department> c_node=departmentDao.getDepartmentByMap(map);
            childDepartmentList.addAll(TreeDepartmentList(c_node));
        }
        return  childDepartmentList;
    }
}
