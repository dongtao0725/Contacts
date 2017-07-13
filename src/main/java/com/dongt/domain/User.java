package com.dongt.domain;

/**
 * Created by dongt on 2017/7/12.
 */
public class User {
    private Integer id;
    private String username;
    private String password;
    private Management_Role role;

    public User(){}
    public User(Integer id,String username,String password,Management_Role role){
        this.id=id;
        this.username=username;
        this.password=password;
        this.role=role;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Management_Role getRole() {
        return role;
    }

    public void setRole(Management_Role role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Admin:[id=" + id + ",username=" + username + ",password="
                + password + ",role_name=" + role.getRole_name() + "]";
    }
}
