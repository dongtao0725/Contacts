package com.dongt.domain;

/**
 * Created by dongtao on 2017/7/18.
 */
public class Department {
    private Integer dept_id;
    private String dept_name;
    private String dept_description;
    private Integer parent_id;
    private Integer contacts;
    private Integer role;

    public Integer getDept_id() {
        return dept_id;
    }

    public void setDept_id(Integer dept_id) {
        this.dept_id = dept_id;
    }

    public String getDept_name() {
        return dept_name;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }

    public String getDept_description() {
        return dept_description;
    }

    public void setDept_description(String dept_description) {
        this.dept_description = dept_description;
    }

    public Integer getParent_id() {
        return parent_id;
    }

    public void setParent_id(Integer parent_id) {
        this.parent_id = parent_id;
    }

    public Integer getContacts() {
        return contacts;
    }

    public void setContacts(Integer contacts) {
        this.contacts = contacts;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public String toString(){
        return dept_id+dept_name+dept_description+parent_id+contacts+role;
    }
}
