package com.neuedu.service;

import com.neuedu.entity.User;

import java.util.List;

public interface UserService {
    List<User>  findAll();
    User findById(int id);
    void resetPassword(User user);
    void updateInfo(User user);
}
