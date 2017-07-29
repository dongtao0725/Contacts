package com.dongt.service;

import com.dongt.domain.DispatchPrinciple;

public interface DispatchPrincipleService {
    DispatchPrinciple getDispatchPrincipleByDeptID(Integer dept_id);
    Integer addDispatchPrinciple(DispatchPrinciple dispatchPrinciple);
    Integer updateDispatchPrinciple(DispatchPrinciple dispatchPrinciple);
    Integer deleteDispatchPrinciple(Integer p_id);
}
