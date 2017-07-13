package com.dongt.service.impl;

import com.dongt.dao.PostDao;
import com.dongt.domain.Post;
import com.dongt.service.PostService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by dongt on 2017/7/13.
 */
@Service("postService")
public class PostServiceImpl implements PostService {
    @Resource
    private PostDao postDao;

    public List<Post> getPost(Map<String, Object> map){
        return postDao.getPost(map);
    }

    public Integer getCount(Map<String, Object> map){
        return postDao.getCount(map);
    }

    public Integer addPost(Post post){
        return postDao.addPost(post);
    }

    public Integer updatePost(Post post){
        return postDao.updatePost(post);
    }

    public Integer deletePost(Integer id){
        return postDao.deletePost(id);
    }

    public Post getPostById(Integer id){
        return postDao.getPostById(id);
    }
}
