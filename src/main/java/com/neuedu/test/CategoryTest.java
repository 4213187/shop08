package com.neuedu.test;

import com.neuedu.entity.Category;
import com.neuedu.mapper.CategoryMapper;
import com.neuedu.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class CategoryTest {
    public static void main(String[] args) {
        SqlSession sqlSession = MyBatisUtil.getSession();
        CategoryMapper categoryMapper = sqlSession.getMapper(CategoryMapper.class);
        List<Category> categories = categoryMapper.findAll();
        System.out.println(categories);
    }
}
