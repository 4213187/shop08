package com.neuedu.service.impl;

import com.neuedu.entity.User;
import com.neuedu.mapper.UserMapper;
import com.neuedu.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    private  UserMapper userMapper;
    public  UserServiceImpl(){

    }
    public  UserServiceImpl(UserMapper userMapper){
      this.userMapper =userMapper;
    }
    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }

    @Override
    public User findById(int id) {
        return userMapper.findById(id);
    }

    @Override
    public void resetPassword(User user) {
        userMapper.update(user);
    }

    @Override
    public void updateInfo(User user) {
        userMapper.update(user);
    }
}
