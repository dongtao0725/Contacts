package com.dongt.service.impl;

import com.dongt.dao.DepartmentDao;
import com.dongt.domain.Department;
import com.dongt.service.DepartmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
        return departmentDao.getAllDepartment();
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
}
