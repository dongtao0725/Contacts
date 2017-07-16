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
    public List<Post> getPost(Map<String, Object> map);
    public Integer getCount(Map<String, Object> map);
    public Integer addPost(Post post);
    public Integer updatePost(Post post);
    public Integer deletePost(Integer id);
    public Post getPostById(Integer id);
}
