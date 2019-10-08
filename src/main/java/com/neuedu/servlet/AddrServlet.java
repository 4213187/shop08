package com.neuedu.servlet;

import com.alibaba.fastjson.JSON;
import com.neuedu.entity.City;
import com.neuedu.entity.Country;
import com.neuedu.entity.Province;
import com.neuedu.mapper.AddrMapper;
import com.neuedu.service.AddrService;
import com.neuedu.service.impl.AddrServiceImpl;
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

@WebServlet(name = "AddrServlet", urlPatterns = "/AddrServlet")
public class AddrServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession sqlSession = MyBatisUtil.getSession();
        AddrMapper addrMapper = sqlSession.getMapper(AddrMapper.class);
        AddrService addrService = new AddrServiceImpl(addrMapper);
        ServletUtil.setCharSet(request, response);
        PrintWriter out = response.getWriter();
        String method =request.getParameter("method");
        if ("findAllProvince".equals(method)){

            List<Province> all = addrService.findAllProvince();
            String provinces = JSON.toJSONString(all);

            out.print(provinces);
        }else if ("findByProvince".equals(method)){
            String provinceId = request.getParameter("provinceId");

            List<City> all = addrService.findByProvince(provinceId);
            String cities = JSON.toJSONString(all);

            out.print(cities);
        }else if ("findByCity".equals(method)){
            String cityId = request.getParameter("cityId");

            List<Country> all = addrService.findByCity(cityId);
            String countries = JSON.toJSONString(all);
            out.print(countries);
        }


    }
}
