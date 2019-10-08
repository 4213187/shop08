package com.neuedu.mapper;

import com.neuedu.entity.User;

import java.util.List;

public interface UserMapper {
    List<User> findAll();
    void update(User user);
    User findById(int id);
}
