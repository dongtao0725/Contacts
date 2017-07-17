package com.dongt.service;

import com.dongt.domain.Management_Role;

import java.util.List;

/**
 * Created by dongtao on 2017/7/17.
 */
public interface M_RoleService {
    public List<Management_Role> getAllM_Role();
    public Management_Role getM_RoleById(Integer id);
    //ublic Integer addM_Role(Management_Role role);
    //public Integer updateM_Role(Management_Role role);
    //public Integer deleteM_Role(Integer id);
}
