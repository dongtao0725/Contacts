package com.dongt.dao;

import com.dongt.domain.Post;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by dongt on 2017/7/13.
 */
@Repository
public interface PostDao {
    List<Post> getPost(Map<String, Object> map);
    Integer getCount(Map<String, Object> map);
    Integer addPost(Post post);
    Integer updatePost(Post post);
    Integer deletePost(Integer id);
    Post getPostById(Integer id);
}
