package com.dongt.service.impl;

import com.dongt.dao.DispatchPrincipleDao;
import com.dongt.domain.DispatchPrinciple;
import com.dongt.service.DispatchPrincipleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("DispatchPrincipleService")
public class DispatchPrincipleServiceImpl implements DispatchPrincipleService {
    @Autowired
    private DispatchPrincipleDao dispatchPrincipleDao;

    public DispatchPrinciple getDispatchPrincipleByDeptID(Integer dept_id){
        return dispatchPrincipleDao.getDispatchPrincipleByDeptID(dept_id);
    }
    public Integer addDispatchPrinciple(DispatchPrinciple dispatchPrinciple){
        return dispatchPrincipleDao.addDispatchPrinciple(dispatchPrinciple);
    }
    public Integer updateDispatchPrinciple(DispatchPrinciple dispatchPrinciple){
        return dispatchPrincipleDao.updateDispatchPrinciple(dispatchPrinciple);
    }
    public Integer deleteDispatchPrinciple(Integer p_id){
        return dispatchPrincipleDao.deleteDispatchPrinciple(p_id);
    }
}
