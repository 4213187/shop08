package com.neuedu.servlet;

import com.neuedu.entity.Admin;
import com.neuedu.entity.OperationData;
import com.neuedu.entity.OperationLog;
import com.neuedu.mapper.AdminLogMapper;
import com.neuedu.mapper.AdminMapper;
import com.neuedu.mapper.OperationDataMapper;
import com.neuedu.mapper.OperationLogMapper;
import com.neuedu.service.AdminLogService;
import com.neuedu.service.AdminService;
import com.neuedu.service.OperationDataService;
import com.neuedu.service.OperationLogService;
import com.neuedu.service.impl.AdminLogServiceImpl;
import com.neuedu.service.impl.AdminServiceImpl;
import com.neuedu.service.impl.OperationDataServiceImpl;
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

@WebServlet(name = "OperationDataServlet",urlPatterns = "/admin/OperationDataServlet")
public class OperationDataServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletUtil.setCharSet(request, response);
        SqlSession sqlSession = MyBatisUtil.getSession();
        OperationLogMapper operationLogMapper = sqlSession.getMapper(OperationLogMapper.class);
        OperationLogService operationLogService = new OperationLogServiceImpl(operationLogMapper);
        OperationDataMapper operationDataMapper = sqlSession.getMapper(OperationDataMapper.class);
        OperationDataService operationDataService =new OperationDataServiceImpl(operationDataMapper);
        AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
        AdminService adminService = new AdminServiceImpl(adminMapper);
        String method =request.getParameter("method");
        if ("rollback".equals(method)){
            String uuid =request.getParameter("uuid");
            OperationLog operationLog = operationLogService.findByUUID(uuid);
//           如果是增加操作直接删除对应管理员即可
            if ("增加管理员".equals(operationLog.getType())){
                Admin afteradmin = adminMapper.findByAname(operationLog.getObject());
                adminService.delete(afteradmin.getId());

//          如果是删除或者修改操作回滚
            }else if("修改管理员".equals(operationLog.getType())){
                OperationData operationData = operationDataService.findByUUID(uuid);
                Admin beforeadmin =new Admin();
                beforeadmin.setId(operationData.getAdminId());
                beforeadmin.setAname(operationData.getAdminAname());
                beforeadmin.setApwd(operationData.getAdminApwd());
                beforeadmin.setDisabled(operationData.getAdminDisabled());
                beforeadmin.setGrade(operationData.getAdminGrade());
                adminService.update(beforeadmin);


            }else if ("删除管理员".equals(operationLog.getType())){
                OperationData operationData = operationDataService.findByUUID(uuid);
                Admin beforeadmin =new Admin();
                beforeadmin.setId(operationData.getAdminId());
                beforeadmin.setAname(operationData.getAdminAname());
                beforeadmin.setApwd(operationData.getAdminApwd());
                beforeadmin.setDisabled(operationData.getAdminDisabled());
                beforeadmin.setGrade(operationData.getAdminGrade());
                adminService.add(beforeadmin);
            }
            operationLogService.update(operationLog);
//           提交事务 原子性 否则回滚
            MyBatisUtil.sessionCommit(sqlSession);
            response.sendRedirect("OperationLogServlet?method=findAllOperationLog");
        }
    }
}
