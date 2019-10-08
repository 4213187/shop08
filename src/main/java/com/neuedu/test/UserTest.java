package com.neuedu.test;

import com.neuedu.entity.User;
import com.neuedu.mapper.UserMapper;
import com.neuedu.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class UserTest {
    public static void main(String[] args) {
        SqlSession sqlSession = MyBatisUtil.getSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        List<User> users = userMapper.findAll();
        System.out.println(users);
    }
}
