package com.dongt.service.impl;

import com.dongt.dao.DispatchRuleDao;
import com.dongt.domain.DispatchRule;
import com.dongt.service.DispatchRuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("DispatchRuleService")
public class DispatchRuleServiceImpl implements DispatchRuleService {
    @Autowired
    private DispatchRuleDao dispatchRuleDao;

    public List<DispatchRule> getDispatchRuleByDeptId(Integer dept_id){
        return dispatchRuleDao.getDispatchRuleByDeptId(dept_id);
    }
    public List<DispatchRule> getDispatchRuleByAreaOrDepartment(String param){
        return dispatchRuleDao.getDispatchRuleByAreaOrDepartment(param);
    }
    public Integer addDispatchRule(DispatchRule dispatchRule){
        return dispatchRuleDao.addDispatchRule(dispatchRule);
    }
    public Integer updateDispatchRule(DispatchRule dispatchRule){
        return dispatchRuleDao.updateDispatchRule(dispatchRule);
    }
    public Integer deleteDispatchRule(Integer r_id){
        return dispatchRuleDao.deleteDispatchRule(r_id);
    }
}
