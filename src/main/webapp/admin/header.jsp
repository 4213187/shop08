<%@ page import="com.neuedu.entity.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin ==null){
        response.sendRedirect(request.getContextPath()+"/IndexServlet");
    }

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="description" content="description of your site" />
    <meta name="author" content="author of the site" />
    <title>电商平台后台首页</title>
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/bootstrap-responsive.css" />
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/toastr.css" />
    <link rel="stylesheet" href="css/fullcalendar.css" />
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.knob.js"></script>

<%--    <script src="http://d3js.org/d3.v3.min.js"></script>--%>
<%--    <script src="js/jquery.sparkline.min.js"></script>--%>
    <script src="js/toastr.js"></script>
    <script src="js/jquery.tablesorter.min.js"></script>
    <script src="js/jquery.peity.min.js"></script>
    <script src="js/fullcalendar.min.js"></script>
    <script src="js/gcal.js"></script>
    <script src="js/setup.js"></script>
</head>
<body>
<div id="in-nav">
    <div class="container">
        <div class="row">
            <div class="span12">
<%--                <ul class="pull-right">--%>
<%--                    <li><a href="#">链接1</a></li>--%>
<%--                    <li><a href="#">链接2</a></li>--%>
<%--                    <li><a href="#">链接3</a></li>--%>
<%--                    <li><a href="login.jsp">登录</a></li>--%>
<%--                </ul>--%>
                <a id="logo" href="index.jsp">
                    <h4>
                        电商平台后台<strong>管理</strong>
                    </h4>
                </a>
            </div>
        </div>
    </div>
</div>
<div id="in-sub-nav">
    <div class="container">
        <div class="row">
            <div class="span12">
                <ul>
                    <li><a href="index.jsp" class="active"><i
                            class="batch home"></i><br />主页</a></li>
                    <li><a   href="AdminServlet?method=findAll"><i class="batch stream"></i><br />管理员列表</a></li>
                    <li><a href="UserServlet?method=findAll"><i class="batch users"></i><br />用户列表</a></li>
                    <li><a href="categories.html"><i class="batch forms"></i><br />类别列表</a></li>
                    <li><a href="products.html"><i class="batch quill"></i><br />商品列表</a></li>
                    <li><a href="orders.html"><i class="batch plane"></i><br />订单列表</a></li>
                    <li><a href="anothers.html"><i class="batch calendar"></i><br />其它扩展功能</a></li>
                    <li><a href="settings.html"><i class="batch settings"></i><br />系统设置</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>