package com.neuedu.mapper;

import com.neuedu.entity.AdminLog;

import java.util.List;

public interface AdminLogMapper {
    void add(AdminLog adminLog);
    List<AdminLog> findAll();
    List<AdminLog> findByAname(String aname);
}
