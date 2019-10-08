package com.neuedu.service.impl;

import com.neuedu.entity.AdminLog;
import com.neuedu.mapper.AdminLogMapper;
import com.neuedu.service.AdminLogService;
import com.neuedu.util.MyBatisUtil;

import java.util.List;

public class AdminLogServiceImpl implements AdminLogService {
    AdminLogMapper adminLogMapper;

    public AdminLogServiceImpl() {

    }

    public AdminLogServiceImpl(AdminLogMapper adminLogMapper) {
        this.adminLogMapper = adminLogMapper;
    }

    @Override
    public void add(AdminLog adminLog) {

        adminLogMapper.add(adminLog);

    }

    @Override
    public List<AdminLog> findAll() {
        return adminLogMapper.findAll();
    }

    @Override
    public List<AdminLog> findByAname(String aname) {
        return adminLogMapper.findByAname(aname);
    }
}
