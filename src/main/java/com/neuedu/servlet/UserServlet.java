package com.neuedu.servlet;

import com.neuedu.entity.User;
import com.neuedu.mapper.UserMapper;
import com.neuedu.service.UserService;
import com.neuedu.service.impl.UserServiceImpl;
import com.neuedu.util.MyBatisUtil;
import com.neuedu.util.RandomCodeUtil;
import com.neuedu.util.SendEmail;
import com.neuedu.util.ServletUtil;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/admin/UserServlet")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletUtil.setCharSet(request, response);
        PrintWriter out = response.getWriter();
        SqlSession sqlSession = MyBatisUtil.getSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        UserService userService = new UserServiceImpl(userMapper);

        String method = request.getParameter("method");
        if ("findAll".equals(method)) {
            List<User> users = userService.findAll();
            request.setAttribute("users", users);
            request.getRequestDispatcher("user_list.jsp").forward(request, response);
        } else if ("resetPassword".equals(method)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String code = RandomCodeUtil.getSixRandomCode();
            User user = userService.findById(id);
            if (SendEmail.sendEmail(user.getUserEmail(),code)){
                user.setUserPassword(code);
                userService.resetPassword(user);
                MyBatisUtil.sessionCommit(sqlSession);
                response.sendRedirect("UserServlet?method=findAll");

            }

        } else if ("toUpdate".equals(method)){
            int id = Integer.parseInt(request.getParameter("id"));
            User user = userService.findById(id);
            request.setAttribute("user",user);
            request.getRequestDispatcher("update_user.jsp").forward(request,response);
        }else if ("updateInfo".equals(method)){
            int id = Integer.parseInt(request.getParameter("id"));
            String expiryDate =request.getParameter("expiryDate");
            int disabled = Integer.parseInt(request.getParameter("disabled"));
            User user = userService.findById(id);
            user.setVip(1);
            user.setDisabled(disabled);
            if (expiryDate!=null &&!expiryDate.equals("")){
                user.setExpiryDate(Timestamp.valueOf(expiryDate));

            }else {
                user.setExpiryDate(null);
            }
            userService.updateInfo(user);
            MyBatisUtil.sessionCommit(sqlSession);
            response.sendRedirect("UserServlet?method=findAll");

        }
    }
}
