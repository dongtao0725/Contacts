package com.dongt.test;

import com.dongt.domain.User;
import com.dongt.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by dongt on 2017/7/13.
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring 配置文件
@ContextConfiguration({ "classpath:spring-mybatis.xml" })
public class SpringMybatisTest {
    @Autowired
    private UserService userService;
    @Test
    public void testLogin() {
        User user = new User();
        user.setUsername("superadmin");
        user.setPassword("123456");
        System.out.println(userService.login(user).toString());

    }
}

