package com.dongt.dao;

import com.dongt.domain.DispatchRule;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DispatchRuleDao {
    List<DispatchRule> getDispatchRuleByDeptId(Integer dept_id);
    List<DispatchRule> getDispatchRuleByAreaOrDepartment(String param);
    Integer addDispatchRule(DispatchRule dispatchRule);
    Integer updateDispatchRule(DispatchRule dispatchRule);
    Integer deleteDispatchRule(Integer r_id);
}
