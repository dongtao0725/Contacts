package com.dongt.dao;

import com.dongt.domain.Department;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by dongtao on 2017/7/18.
 */
@Repository
public interface DepartmentDao {
    public List<Department> getAllDepartment();
    public List<Department> getDepartmentByMap(Map<String,Object> map);
    public void addDepartment(Department department);
    public void updateDepartment(Department department);
    public void deleteDepartment(Integer dept_id);
}
