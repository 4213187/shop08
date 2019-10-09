package com.neuedu.service;

import com.neuedu.entity.Category;

import java.util.List;

/**
 * @author 小浩
 * @version 1.0
 * @date 2019/10/8 18:21
 */
public interface CategoryService {
    /**
     * 递归查询类别
     *
     * @return List<Category>
     */
    List<Category> findAll();

    /**
     * 添加根类别
     *
     * @param category 类别
     */
    void addRoot(Category category);

    /**
     * 添加子类别点
     *
     * @param category 类别
     */
    void addChild(Category category);

    /**
     * 通过id查找对应的类别
     *
     * @param id 类别的id
     * @return 类别对象
     */
    Category findById(int id);

    /**
     * 通过id修改类别是否为叶子结点
     *
     * @param id 类别的id
     */
    void updateLeafById(int id);

    /**
     * 修改类型的信息
     * @param category 修改的类型
     */
    void updateInfo(Category category);
}
