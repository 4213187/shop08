package com.neuedu.mapper;

import com.neuedu.entity.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    List<Admin> findAll(int grade);
    Admin find(@Param("aname")String aname,@Param("pwd")String apwd);
    Admin findById(int id);
    Admin findByAname(String aname);
    void delete(int id);
    void update(Admin admin);
    void add(Admin admin);
}
