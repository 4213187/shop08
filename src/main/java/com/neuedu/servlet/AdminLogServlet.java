package com.neuedu.servlet;

import com.neuedu.entity.AdminLog;
import com.neuedu.mapper.AdminLogMapper;
import com.neuedu.service.AdminLogService;
import com.neuedu.service.impl.AdminLogServiceImpl;
import com.neuedu.util.MyBatisUtil;
import com.neuedu.util.ServletUtil;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminLogServlet", urlPatterns = "/admin/AdminLogServlet")
public class AdminLogServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletUtil.setCharSet(request, response);
        SqlSession sqlSession = MyBatisUtil.getSession();
        AdminLogMapper adminLogMapper = sqlSession.getMapper(AdminLogMapper.class);
        AdminLogService adminLogService  =new AdminLogServiceImpl(adminLogMapper);
        String method = request.getParameter("method");
        if ("findAllLog".equals(method)) {
            List<AdminLog> adminLogs = adminLogService.findAll();
            request.setAttribute("adminLogs",adminLogs);
            request.getRequestDispatcher("admin_log_list.jsp").forward(request,response);

        }else if ("findByAname".equals(method)){
            String aname = request.getParameter("aname");
            List<AdminLog> adminLogs = adminLogService.findByAname(aname);
            request.setAttribute("adminLogs",adminLogs);
            System.out.println(adminLogs);
            request.getRequestDispatcher("person_log_list.jsp").forward(request,response);
        }

    }
}
