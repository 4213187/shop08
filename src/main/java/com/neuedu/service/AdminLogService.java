package com.neuedu.service;

import com.neuedu.entity.AdminLog;

import java.util.List;

public interface AdminLogService {
    void add(AdminLog adminLog);
    List<AdminLog> findAll();
    List<AdminLog> findByAname(String aname);
}
