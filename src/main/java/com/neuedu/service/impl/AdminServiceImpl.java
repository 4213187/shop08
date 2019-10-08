package com.neuedu.service.impl;

import com.neuedu.entity.Admin;
import com.neuedu.mapper.AdminMapper;
import com.neuedu.service.AdminService;
import com.neuedu.util.MyBatisUtil;

import java.util.List;

public class AdminServiceImpl implements AdminService {
    AdminMapper adminMapper;

    public AdminServiceImpl() {

    }

    public AdminServiceImpl(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    @Override
    public Admin login(String aname, String apwd) {
        Admin admin = adminMapper.find(aname, apwd);
        if (admin != null) {
            return admin;
        }
        return null;

    }

    @Override
    public List<Admin> findAll(int grade) {

        return adminMapper.findAll(grade);
    }

    @Override
    public void delete(int id) {
        adminMapper.delete(id);

    }

    @Override
    public void add(Admin admin) {
         adminMapper.add(admin);

    }

    @Override
    public Admin findById(int id) {
        return adminMapper.findById(id);
    }

    @Override
    public void update(Admin admin) {
        adminMapper.update(admin);


    }

    @Override
    public Admin findByAname(String aname) {
        return adminMapper.findByAname(aname);
    }

}
