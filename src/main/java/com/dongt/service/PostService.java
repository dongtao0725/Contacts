package com.dongt.service;

import com.dongt.domain.Post;

import java.util.List;
import java.util.Map;

/**
 * Created by dongt on 2017/7/13.
 */
public interface PostService {
    public List<Post> getPost(Map<String, Object> map);
    public Integer getCount(Map<String, Object> map);
    public Integer addPost(Post post);
    public Integer updatePost(Post post);
    public Integer deletePost(Integer id);
    public Post getPostById(Integer id);
}
