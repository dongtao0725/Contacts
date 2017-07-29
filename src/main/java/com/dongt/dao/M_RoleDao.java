package com.dongt.dao;

import com.dongt.domain.Management_Role;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dongtao on 2017/7/17.
 */
@Repository
public interface M_RoleDao {
    List<Management_Role> getAllM_Role();
    Management_Role getM_RoleById(Integer id);
    //Integer addM_Role(Management_Role role);
    //Integer updateM_Role(Management_Role role);
    //Integer deleteM_Role(Integer id);
}
