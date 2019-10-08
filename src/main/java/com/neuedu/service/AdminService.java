package com.neuedu.service;

import com.neuedu.entity.Admin;

import java.util.List;

public interface AdminService {
    Admin login(String aname,String apwd);
    List<Admin> findAll(int grade);
    void delete(int id);
    void add(Admin admin);
    Admin findById(int id);
    void update(Admin admin);
    Admin findByAname(String aname);
}
