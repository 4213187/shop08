package com.neuedu.util;

import javax.servlet.http.HttpServletRequest;

public class IpUtil {
    private  IpUtil(){

    }
    public static String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if ("0:0:0:0:0:0:0:1".equals(ip)){
            ip="127.0.0.1";
        }
        if (ip.contains(",")) {
            return ip.split(",")[0];
        } else {
            return ip;
        }

    }
}
