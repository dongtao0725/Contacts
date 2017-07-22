package com.dongt.test;

import com.dongt.domain.User;
import com.dongt.service.ContactService;
import com.dongt.service.DepartmentService;
import com.dongt.service.PostService;
import com.dongt.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by dongt on 2017/7/13.
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring 配置文件
@ContextConfiguration({ "classpath:spring-mybatis.xml" })
public class SpringMybatisTest {
    @Autowired
    private UserService userService;
    @Autowired
    private PostService postService;
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private ContactService contactService;
    @Test
    public void testLogin() {
        User user = new User();
        Map<String,Object> map = new HashMap<String, Object>();
        user.setUsername("superadmin");
        user.setPassword("admin");
        //System.out.println(userService.login(user).toString());
        //System.out.println(postService.getPost(map).toString());

        //map.put("level",2);
       // map.put("role",1);
        map.put("parent_id",22);
        //System.out.println(departmentService.getAllDepartment().toString());
        System.out.printf(contactService.getContactsByDeptID(1).toString());
    }
}

