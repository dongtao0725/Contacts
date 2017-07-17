package com.dongt.service.impl;

import com.dongt.dao.M_RoleDao;
import com.dongt.domain.Management_Role;
import com.dongt.service.M_RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dongtao on 2017/7/17.
 */
@Service("M_RoleService")
public class M_RoleServiceImpl implements M_RoleService {
    @Resource
    private M_RoleDao m_roleDao;

    public List<Management_Role> getAllM_Role(){
        return  m_roleDao.getAllM_Role();
    };
    public Management_Role getM_RoleById(Integer id){
        return m_roleDao.getM_RoleById(id);
    };
}
