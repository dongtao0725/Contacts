package com.dongt.dao;

import com.dongt.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by dongt on 2017/7/12.
 */
@Repository
public interface UserDao {
    public User login(User user);
    public List<User> findUsers(Map<String, Object> map);
    public Integer getCount(Map<String, Object> map);
    public Integer addUser(User user);
    public Integer updateUser(User user);
    public Integer deleteUser(Integer id);
}
