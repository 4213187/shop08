package com.neuedu.servlet;



import com.neuedu.util.DescribeCaptchaResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CodeServlet",urlPatterns = "/admin/CodeServlet")
public class TCodeServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
               this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String ticket = request.getParameter("ticket");
        String randstr = request.getParameter("randstr");
        System.out.println(ticket);
        System.out.println(randstr);
        DescribeCaptchaResult describeCaptchaResult = new DescribeCaptchaResult();
        PrintWriter out = response.getWriter();
        if (describeCaptchaResult.codeResponse(ticket,randstr)){
             out.print("ok");
        }else{
            out.print("fail");
        }



    }


}
