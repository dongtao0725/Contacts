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
    User login(User user);
    List<User> findUsers(Map<String, Object> map);
    Integer getCount(Map<String, Object> map);
    Integer addUser(User user);
    Integer updateUser(User user);
    Integer deleteUser(Integer id);
}
