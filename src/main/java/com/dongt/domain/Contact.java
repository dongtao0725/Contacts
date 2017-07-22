package com.dongt.domain;

public class Contact {
    private Integer c_id;
    private Department dept;
    private String department;
    private String position;
    private String name;
    private String c_phone;
    private String o_phone;
    private String network;
    private String enterprise;

    public Integer getC_id() {
        return c_id;
    }

    public void setC_id(Integer c_id) {
        this.c_id = c_id;
    }

    public Department getDept() {
        return dept;
    }

    public void setDept(Department dept) {
        this.dept = dept;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getC_phone() {
        return c_phone;
    }

    public void setC_phone(String c_phone) {
        this.c_phone = c_phone;
    }

    public String getO_phone() {
        return o_phone;
    }

    public void setO_phone(String o_phone) {
        this.o_phone = o_phone;
    }

    public String getNetwork() {
        return network;
    }

    public void setNetwork(String network) {
        this.network = network;
    }

    public String getEnterprise() {
        return enterprise;
    }

    public void setEnterprise(String enterprise) {
        this.enterprise = enterprise;
    }

    @Override
    public String toString() {
        return "id="+ c_id+" dept.id="+dept.getDept_id()+" dept_name="+dept.getDept_name()+" department="+department+" position="+ position+" name="+name+" c_phone="+c_phone+" o_phone="+o_phone+" network="+network+" enterprise"+enterprise+"\n";
    }
}
