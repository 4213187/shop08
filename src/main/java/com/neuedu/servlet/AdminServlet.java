package com.neuedu.servlet;

import com.neuedu.entity.Admin;
import com.neuedu.entity.AdminLog;
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
import com.neuedu.util.IpUtil;
import com.neuedu.util.MyBatisUtil;
import com.neuedu.util.UUIDUtil;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "AdminServlet", urlPatterns = "/admin/AdminServlet")
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession sqlSession = MyBatisUtil.getSession();
        AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
        AdminService adminService = new AdminServiceImpl(adminMapper);
        AdminLogMapper adminLogMapper = sqlSession.getMapper(AdminLogMapper.class);
        AdminLogService adminLogService = new AdminLogServiceImpl(adminLogMapper);
        OperationLogMapper operationLogMapper = sqlSession.getMapper(OperationLogMapper.class);
        OperationLogService operationLogService = new OperationLogServiceImpl(operationLogMapper);

        OperationDataMapper operationDataMapper = sqlSession.getMapper(OperationDataMapper.class);
        OperationDataService operationDataService = new OperationDataServiceImpl(operationDataMapper);

        HttpSession session = request.getSession();
        //           通过session获取操作人
        Admin Admin = (Admin) session.getAttribute("admin");
        String method = request.getParameter("method");
        if ("login".equals(method)) {
            String index = request.getParameter("index");

            String ipAddress = IpUtil.getIpAddress(request);

            String aname = request.getParameter("aname");
            String apwd = request.getParameter("apwd");
            Admin admin = adminService.login(aname, apwd);
            if (admin != null) {
                AdminLog adminLog = new AdminLog();
                adminLog.setAname(admin.getAname());
                adminLog.setIp(ipAddress);
                adminLogService.add(adminLog);
 //           提交事务 原子性 否则回滚
                MyBatisUtil.sessionCommit(sqlSession);
                session.setAttribute("admin", admin);
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("msg", "登陆失败");
                request.getRequestDispatcher("login" + index + ".jsp").forward(request, response);
            }

        } else if ("findAll".equals(method)) {
            Admin admin = (Admin) session.getAttribute("admin");
            List<Admin> admins = adminService.findAll(admin.getGrade());
            request.setAttribute("admins", admins);
            request.getRequestDispatcher("admins.jsp").forward(request, response);

        } else if ("delete".equals(method)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Admin admin = adminService.findById(id);
//           添加删除之前的数据保存到数据表
            OperationData operationData = new OperationData();
            operationData.setUuid(UUIDUtil.getUUID());
            operationData.setAdminId(admin.getId());
            operationData.setAdminAname(admin.getAname());
            operationData.setAdminApwd(admin.getApwd());
            operationData.setAdminDisabled(admin.getDisabled());
            operationData.setAdminGrade(admin.getGrade());
            operationDataService.add(operationData);
//          删除操作
            adminService.delete(id);
            OperationLog operationLog = new OperationLog();
//          添加删除日志到日志表
            operationLog.setUuid(operationData.getUuid());
            operationLog.setOperator(Admin.getAname());
            operationLog.setObject(admin.getAname());
            operationLog.setIp(IpUtil.getIpAddress(request));
            operationLog.setContent("删除了一个账号为:" + admin.getAname() + "的管理员");
            operationLog.setType("删除管理员");
            operationLogService.add(operationLog);
//           提交事务 原子性 否则回滚
            MyBatisUtil.sessionCommit(sqlSession);
            response.sendRedirect("AdminServlet?method=findAll");
        } else if ("add".equals(method)) {
            String aname = request.getParameter("aname");
            String apwd = request.getParameter("apwd");
            int grade = Integer.parseInt(request.getParameter("grade"));
            Admin admin = new Admin();
            admin.setAname(aname);
            admin.setApwd(apwd);
            admin.setGrade(grade);
            admin.setDisabled(0);
            adminService.add(admin);
            System.out.println(admin);
//          添加增加日志到日志表
            OperationLog operationLog = new OperationLog();
            operationLog.setUuid(UUIDUtil.getUUID());
            operationLog.setType("增加管理员");
            operationLog.setContent("增加了一个账号为:" + admin.getAname() + "的管理员");
            operationLog.setIp(IpUtil.getIpAddress(request));
            operationLog.setObject(admin.getAname());
            operationLog.setOperator(Admin.getAname());
            operationLogService.add(operationLog);
            System.out.println(operationLog);
 //           提交事务 原子性 否则回滚
            MyBatisUtil.sessionCommit(sqlSession);
            response.sendRedirect("AdminServlet?method=findAll");

        } else if ("toupdate".equals(method)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Admin admin1 = adminService.findById(id);
            request.setAttribute("admin1", admin1);
            request.getRequestDispatcher("update_admin.jsp").forward(request, response);

        } else if ("update".equals(method)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String apwd = request.getParameter("newpwd");
            int grade = Integer.parseInt(request.getParameter("grade"));
            int disabled = Integer.parseInt(request.getParameter("disabled"));

//           保存更新前的数据到 操作数据表
           Admin beforeAdmin = adminService.findById(id);
            OperationData operationData = new OperationData();
            operationData.setUuid(UUIDUtil.getUUID());
            operationData.setAdminId(beforeAdmin.getId());
            operationData.setAdminAname(beforeAdmin.getAname());
            operationData.setAdminApwd(beforeAdmin.getApwd());
            operationData.setAdminDisabled(beforeAdmin.getDisabled());
            operationData.setAdminGrade(beforeAdmin.getGrade());
            operationDataService.add(operationData);
//           拿到前台要更新的数据
            Admin admin = adminService.findById(id);
            admin.setApwd(apwd);
            admin.setGrade(grade);
            admin.setDisabled(disabled);
            adminService.update(admin);
//           添加更新日志 到 操作日志表
            OperationLog operationLog = new OperationLog();
            operationLog.setOperator(Admin.getAname());
            operationLog.setObject(admin.getAname());
            operationLog.setType("修改管理员");
            operationLog.setContent("对管理员" + admin.getAname() + "进行了修改");
            operationLog.setIp(IpUtil.getIpAddress(request));
            operationLog.setUuid(operationData.getUuid());
            operationLogService.add(operationLog);
//           提交事务 原子性 否则回滚
            MyBatisUtil.sessionCommit(sqlSession);
            response.sendRedirect("AdminServlet?method=findAll");
        } else if ("updatePerson".equals(method)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String apwd = request.getParameter("newpwd");
            Admin admin = adminService.findById(id);
            admin.setApwd(apwd);
            adminService.update(admin);
//           提交事务 原子性 否则回滚
            MyBatisUtil.sessionCommit(sqlSession);
            response.sendRedirect(request.getContextPath() + "/IndexServlet");

        } else if ("logout".equals(method)) {
            session.invalidate();
            response.sendRedirect(request.getContextPath() + "/IndexServlet");

        } else if ("findByAname".equals(method)) {

            String aname = request.getParameter("aname");

            Admin admin = adminService.findByAname(aname);
            PrintWriter out = response.getWriter();

            if (admin != null) {
                out.print("fail");
            } else {
                out.print("success");
            }
        } else if ("lock".equals(method)) {
            String aname = request.getParameter("aname");
            session.invalidate();
            request.setAttribute("aname", aname);
            request.getRequestDispatcher("lock.jsp").forward(request, response);


        } else if ("unlock".equals(method)) {

            String aname = request.getParameter("aname");
            String apwd = request.getParameter("apwd");
            Admin admin = adminService.login(aname, apwd);
            if (admin != null) {

                session.setAttribute("admin", admin);
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("msg", "解锁失败");
                request.setAttribute("aname", aname);
                request.getRequestDispatcher("lock.jsp").forward(request, response);
            }


        }

    }

}
