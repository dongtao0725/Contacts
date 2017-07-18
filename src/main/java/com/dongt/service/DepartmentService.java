package com.dongt.service;

import com.dongt.domain.Department;

import java.util.Map;
import java.util.List;

/**
 * Created by dongtao on 2017/7/18.
 */
public interface DepartmentService {
    public List<Department> getAllDepartment();
    public List<Department> getDepartmentByMap(Map<String,Object> map);
    public void addDepartment(Department department);
    public void updateDepartment(Department department);
    public void deleteDepartment(Integer dept_id);
}
