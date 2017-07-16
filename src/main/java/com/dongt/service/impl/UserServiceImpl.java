package com.dongt.service.impl;

import com.dongt.dao.UserDao;
import com.dongt.domain.User;
import com.dongt.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by dongt on 2017/7/13.
 */
@Service("userService")
public class UserServiceImpl  implements UserService{
    @Resource
    private UserDao userDao;

    public User login(User user){
        return userDao.login(user);
    }

    public List<User> findUsers(Map<String, Object> map){
        return userDao.findUsers(map);
    }

    public Integer getCount(Map<String, Object> map){
        return userDao.getCount(map);
    }

    public Integer addUser(User user){
        return userDao.addUser(user);
    }
    public Integer updateUser(User user){
        return userDao.updateUser(user);
    }
    public Integer deleteUser(Integer id){
        return userDao.deleteUser(id);
    }
}
