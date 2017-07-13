package com.dongt.service;

import com.dongt.domain.User;

import java.util.List;
import java.util.Map;

/**
 * Created by dongt on 2017/7/13.
 */
public interface UserService {
    public User login(User user);
    public List<User> findUsers(Map<String, Object> map);
    public Integer getCount(Map<String, Object> map);
    public Integer addUser(User user);
    public Integer updateUser(User user);
    public Integer deleteUser(Integer id);
}
