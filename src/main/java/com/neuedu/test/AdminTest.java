package com.neuedu.test;

import com.neuedu.entity.Admin;
import com.neuedu.mapper.AdminMapper;
import com.neuedu.service.AdminService;
import com.neuedu.service.impl.AdminServiceImpl;
import com.neuedu.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class AdminTest {
    public static void main(String[] args) {
        SqlSession sqlSession = MyBatisUtil.getSession();
        AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
        AdminService adminService = new AdminServiceImpl(mapper);
//        List<Admin> admins = adminService.findAll();
//        for (Admin admin: admins) {
//            System.out.println(admin);
//
//        }
//      ConcurrentHashMap
    }
    Map map = new HashMap();
}
