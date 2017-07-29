package com.dongt.dao;

import com.dongt.domain.DispatchPrinciple;
import org.springframework.stereotype.Repository;

@Repository
public interface DispatchPrincipleDao {
    DispatchPrinciple getDispatchPrincipleByDeptID(Integer dept_id);
    Integer addDispatchPrinciple(DispatchPrinciple dispatchPrinciple);
    Integer updateDispatchPrinciple(DispatchPrinciple dispatchPrinciple);
    Integer deleteDispatchPrinciple(Integer p_id);
}
