package com.dongt.domain;

import java.util.List;

public class Dispatch {
    private Department dept;
    private DispatchPrinciple dispatchPrinciple;
    private List<DispatchRule> dispatchRuleList;

    public Department getDept() {
        return dept;
    }

    public void setDept(Department dept) {
        this.dept = dept;
    }

    public DispatchPrinciple getDispatchPrinciple() {
        return dispatchPrinciple;
    }

    public void setDispatchPrinciple(DispatchPrinciple dispatchPrinciple) {
        this.dispatchPrinciple = dispatchPrinciple;
    }

    public List<DispatchRule> getDispatchRuleList() {
        return dispatchRuleList;
    }

    public void setDispatchRuleList(List<DispatchRule> dispatchRuleList) {
        this.dispatchRuleList = dispatchRuleList;
    }
}
