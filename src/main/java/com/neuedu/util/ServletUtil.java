package com.neuedu.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

public class ServletUtil {
    private ServletUtil(){}
    public static void setCharSet(HttpServletRequest req, HttpServletResponse resp){
        try {
            req.setCharacterEncoding("utf-8");
            resp.setContentType("text/html;charset=utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}
