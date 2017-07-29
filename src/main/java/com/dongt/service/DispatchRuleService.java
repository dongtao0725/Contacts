package com.dongt.service;

import com.dongt.domain.DispatchRule;

import java.util.List;

public interface DispatchRuleService {
    List<DispatchRule> getDispatchRuleByDeptId(Integer dept_id);
    List<DispatchRule> getDispatchRuleByAreaOrDepartment(String param);
    Integer addDispatchRule(DispatchRule dispatchRule);
    Integer updateDispatchRule(DispatchRule dispatchRule);
    Integer deleteDispatchRule(Integer r_id);
}
