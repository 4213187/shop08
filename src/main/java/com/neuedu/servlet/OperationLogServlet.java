package com.neuedu.servlet;

import com.neuedu.entity.OperationLog;
import com.neuedu.mapper.AdminLogMapper;
import com.neuedu.mapper.OperationLogMapper;
import com.neuedu.service.OperationLogService;
import com.neuedu.service.impl.OperationLogServiceImpl;
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

@WebServlet(name = "AdminOperationLogServlet",urlPatterns = "/admin/OperationLogServlet")
public class OperationLogServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletUtil.setCharSet(request, response);
        SqlSession sqlSession = MyBatisUtil.getSession();
        OperationLogMapper operationLogMapper = sqlSession.getMapper(OperationLogMapper.class);
        OperationLogService operationLogService = new OperationLogServiceImpl(operationLogMapper);
        String method = request.getParameter("method");
        if ("findAllOperationLog".equals(method)){
            List<OperationLog> operationLogs = operationLogService.findAll();

            request.setAttribute("operationLogs",operationLogs);
            request.getRequestDispatcher("admin_operationlog_list.jsp").forward(request,response);
        }
    }
}
