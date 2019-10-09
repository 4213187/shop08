package com.neuedu.servlet;

import com.alibaba.fastjson.JSON;
import com.neuedu.entity.Category;
import com.neuedu.mapper.CategoryMapper;
import com.neuedu.service.CategoryService;
import com.neuedu.service.impl.CategoryServiceImpl;
import com.neuedu.util.MyBatisUtil;
import com.neuedu.util.ServletUtil;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * @author 小浩
 * @version 1.0
 * @date 2019/10/8 18:15
 */
@WebServlet(name = "CategoryServlet",urlPatterns = "/admin/CategoryServlet")
public class CategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
               this.doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession sqlSession = MyBatisUtil.getSession();
        CategoryMapper categoryMapper = sqlSession.getMapper(CategoryMapper.class);
        CategoryService categoryService = new CategoryServiceImpl(categoryMapper);
        ServletUtil.setCharSet(request, response);
        PrintWriter out = response.getWriter();
        String method =request.getParameter("method");
        if ("findAll".equals(method)){
            List<Category> all = categoryService.findAll();
            String categories = JSON.toJSONString(all);
            out.print(categories);
        }else if ("addRoot".equals(method)){
           String name= request.getParameter("name");
            String descr = request.getParameter("descr");
            Category category  = new Category();
            category.setName(name);
            category.setDescr(descr);
            categoryService.addRoot(category);
            MyBatisUtil.sessionCommit(sqlSession);
            response.sendRedirect("category_list.jsp");
        }else  if ("toAddChildren".equals(method)){
            int id = Integer.parseInt(request.getParameter("id"));
            Category category = categoryService.findById(id);
            System.out.println(category);
            request.setAttribute("category",category);
            request.getRequestDispatcher("add_category_child.jsp").forward(request,response);

        }else if ("addChildren".equals(method)){
            int pid = Integer.parseInt(request.getParameter("pid"));
            int grade = Integer.parseInt(request.getParameter("grade"))+1;
            String name = request.getParameter("name");
            String  descr = request.getParameter("descr");
            Category category = new Category();
            category.setDescr(descr);
            category.setName(name);
            category.setGrade(grade);
            category.setPid(pid);
            // 修改父类为非叶子结点
            categoryService.updateLeafById(pid);
            // 添加新结点
            categoryService.addChild(category);

            MyBatisUtil.sessionCommit(sqlSession);
            response.sendRedirect("category_list.jsp");


        }else  if ("toupdate".equals(method)){
            int id =Integer.parseInt(request.getParameter("id"));
            Category category = categoryService.findById(id);
            request.setAttribute("category",category);
            request.getRequestDispatcher("update_category.jsp").forward(request,response);

        }else if ("update".equals(method)){
            int id =Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String  descr = request.getParameter("descr");
            Category category = categoryService.findById(id);
            category.setName(name);
            category.setDescr(descr);
            categoryService.updateInfo(category);
            MyBatisUtil.sessionCommit(sqlSession);
            response.sendRedirect("category_list.jsp");

        }
    }
}
