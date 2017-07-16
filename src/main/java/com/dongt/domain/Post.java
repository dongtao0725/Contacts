package com.dongt.domain;

import java.util.Date;

/**
 * Created by dongt on 2017/7/12.
 */
public class Post {
    private Integer id;
    private String title;
    private String content;
    private User user;
    private Date date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String toString() {
        return "Post:[id=" + id + ",title=" + title + ",content=" + content
                + ",user=" + user.getUsername() + ",date=" + date + "]";
    }
}
