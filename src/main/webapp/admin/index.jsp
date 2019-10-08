<%@ page import="com.neuedu.entity.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect(request.getContextPath() + "/IndexServlet");
    }


%>
<html>
<head>
    <meta charset="gbk"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>
    <meta name="description" content="description of your site"/>
    <meta name="author" content="author of the site"/>
    <title>电商平台后台首页</title>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/bootstrap-responsive.css"/>
    <link rel="stylesheet" href="css/styles.css"/>
    <link rel="stylesheet" href="css/toastr.css"/>
    <link rel="stylesheet" href="css/fullcalendar.css"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/echarts.js"></script>
    <%--<script src="js/jquery.knob.js"></script>--%>
    <%--<script src="http://d3js.org/d3.v3.min.js"></script>--%>
    <%--<script src="js/jquery.sparkline.min.js"></script>--%>
    <%--<script src="js/toastr.js"></script>--%>
    <%--<script src="js/jquery.tablesorter.min.js"></script>--%>
    <%--<script src="js/jquery.peity.min.js"></script>--%>
    <%--<script src="js/fullcalendar.min.js"></script>--%>
    <%--<script src="js/gcal.js"></script>--%>
    <%--<script src="js/setup.js"></script>--%>
    <script>
        function logout() {
            if (confirm('确认要注销么？')) {
                window.location.href = "AdminServlet?method=logout";

            }
        }

    </script>

    <meta http-equiv="Content-Type" content="text/html; charset=gbk"/>
</head>
<body>

<!-- header -->
<div id="in-nav">
    <div class="container">
        <div class="row">
            <div class="span12">
                <ul class="pull-right">
                    <!-- Single button -->
                    <div class="btn-group" style="position: absolute">
                        <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            ${admin.aname} <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="AdminServlet?method=lock&aname=${admin.aname}" onclick="lock()">锁屏</a></li>
                            <li><a href="javascript:void(0);" onclick="logout()">退出</a></li>

                        </ul>
                    </div>
                </ul>

                <h4>
                    <a id="logo" href="index.jsp"> 电商平台后台<strong>管理</strong></a>
                </h4>

            </div>
        </div>
    </div>

</div>
<div id="in-sub-nav">
    <div class="container">
        <div class="row">
            <div class="span12">
                <ul>
                    <li><a href="index.jsp" class="active"><i class="batch home"></i><br/>主页</a></li>
                    <c:if test="${admin.grade<=2}">
                        <li>
<%--                            <span class="label label-important pull-right">08</span>--%>
                            <a   href="AdminServlet?method=findAll"><i class="batch stream"></i><br/>管理员列表</a></li>
                    </c:if>

                    <li><a href="UserServlet?method=findAll"><i class="batch users"></i><br/>用户列表</a></li>
                    <li><a href="categories.html"><i class="batch forms"></i><br/>类别列表</a></li>
                    <li><a href="products.html"><i class="batch quill"></i><br/>商品列表</a></li>
                    <li>
<%--                        <span class="label label-important pull-right">04</span>--%>
                        <a href="orders.html"><i class="batch plane"></i><br/>订单列表</a></li>
                    <li><a href="anothers.html"><i class="batch calendar"></i><br/>其它扩展功能</a></li>
                    <li><a href="settings.html"><i class="batch settings"></i><br/>系统设置</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="page">
    <div class="page-container">
        <div class="container">
            <div class="row">
                <div class="span3">
                    <h4 style="color: gray; font-size: 30px; font-weight: bold;">后台管理</h4>
                    <div class="sidebar">
                        <ul class="col-nav span3">
                            <!-- 个人中心 -->
                            <li><a href="#metrics" data-toggle="collapse"
                                   class="accordion-toggle"> <span
                                    class="label label-inverse pull-right">1</span>个人中心
                            </a></li>
                            <li id="metrics" class="collapse">
                                <ul>
                                    <li><a href="update_person.jsp"> <i
                                            class="pull-right icon-signal"></i>修改信息
                                    </a><a href="AdminLogServlet?method=findByAname&aname=${admin.aname}"> <i class="pull-right icon-fire"></i>登陆记录
                                    </a></li>
                                </ul>
                            </li>
                            <!-- 管理员管理 -->
                            <c:if test="${admin.grade<=2}">
                                <li><a href="#admin" data-toggle="collapse"
                                       class="accordion-toggle"> <span
                                        class="label label-inverse pull-right">2</span>系统管理
                                </a></li>
                                <li id="admin" class="collapse">
                                    <ul>
                                        <li><a href="AdminServlet?method=findAll"> <i
                                                class="pull-right icon-signal"></i>管理员列表
                                        </a>
                                    </ul>
                                    <c:if test="${admin.grade==1}">
                                        <ul>
                                            <li><a href="AdminLogServlet?method=findAllLog"> <i
                                                    class="pull-right icon-signal"></i>管理员登陆日志
                                            </a>
                                        </ul>
                                        <ul>
                                            <li><a href="OperationLogServlet?method=findAllOperationLog"> <i
                                                    class="pull-right icon-signal"></i>管理员操作日志
                                            </a>
                                        </ul>
                                    </c:if>
                                </li>



                            </c:if>
                            <!-- 用户管理  -->
                            <li><a href="#user" data-toggle="collapse"
                                   class="accordion-toggle"> <span
                                    class="label label-inverse pull-right">3</span>用户管理
                            </a></li>
                            <li id="user" class="collapse">
                                <ul>
                                    <li><a href="UserServlet?method=findAll"> <i
                                            class="pull-right icon-signal"></i>用户列表
                                    </a><a href="#"> <i class="pull-right icon-fire"></i>添加用户
                                    </a></li>
                                </ul>
                            </li>
                            <!-- 类别管理  -->
                            <li><a href="#bookmarks" data-toggle="collapse"
                                   class="accordion-toggle"><span
                                    class="label label-inverse pull-right">4 </span>类别管理</a></li>
                            <li id="bookmarks" class="collapse">
                                <ul>
                                    <li><a href="add_category_root.jsp"> <i
                                            class="pull-right icon-plane"></i>添加根类别
                                    </a><a href="categories.jsp"> <i class="pull-right icon-fire"></i>类别列表
                                    </a></li>
                                </ul>
                            </li>

                            <!-- 商品管理  -->
                            <li><a href="#product" data-toggle="collapse"
                                   class="accordion-toggle"> <span
                                    class="label label-inverse pull-right">5</span>商品管理
                            </a></li>
                            <li id="product" class="collapse">
                                <ul>
                                    <li><a href="products.jsp"> <i
                                            class="pull-right icon-cog"></i>商品列表
                                    </a><a href="add_product.jsp"> <i class="pull-right icon-fire"></i>添加商品
                                    </a> <a href="search_product_complex.jsp"> <i
                                            class="pull-right icon-cog"></i>商品搜索（复杂）
                                    </a></li>
                                </ul>
                            </li>
                            <!-- 订单管理  -->
                            <li><a href="#order" data-toggle="collapse"
                                   class="accordion-toggle"> <span
                                    class="label label-inverse pull-right">6</span>订单管理
                            </a></li>
                            <li id="order" class="collapse">
                                <ul>
                                    <li><a href="orders.jsp"> <i
                                            class="pull-right icon-cog"></i>查看订单
                                    </a> <a href="search_order_complex.jsp"> <i
                                            class="pull-right icon-cog"></i>订单搜索（复杂）
                                    </a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="span9">
                    <h4 class="header"
                        style="color: gray; font-size: 30px; font-weight: bold;">数据统计</h4>
                    <div id="d3" style="width: 100%; margin-top: -30px"></div>
                    <br/>
                    <div id="mydiv" style="height: 400px"></div>

                </div>
            </div>
            <script>
                function loadData(option) {

                }

                var myChart = echarts.init(document.getElementById("mydiv"));
                var option = {
                    dataset: {
                        source: [
                            ['score', 'amount', 'product'],
                            [89.3, 58212, 'Matcha Latte'],
                            [57.1, 78254, 'Milk Tea'],
                            [74.4, 41032, 'Cheese Cocoa'],
                            [50.1, 12755, 'Cheese Brownie'],
                            [89.7, 20145, 'Matcha Cocoa'],
                            [68.1, 79146, 'Tea'],
                            [19.6, 91852, 'Orange Juice'],
                            [10.6, 101852, 'Lemon Juice'],
                            [32.7, 20112, 'Walnut Brownie']
                        ]
                    },
                    grid: {containLabel: true},
                    xAxis: {name: '商品总数'},
                    yAxis: {type: 'category'},
                    series: [
                        {
                            type: 'bar',
                            encode: {
                                // Map the "amount" column to X axis.
                                x: 'amount',
                                // Map the "product" column to Y axis
                                y: 'product'
                            }
                        }
                    ]
                };
                loadData(option);
                myChart.setOption(option);
            </script>

        </div>
    </div>
</div>

<footer>
    <div class="container">
        <div class="row">
            <div class="span12">
                <p class="pull-right">版权所有&nbsp;&nbsp;&nbsp;可以翻版</p>
                <p>&copy; Copyright 2018 Somnus</p>
            </div>
        </div>
    </div>
</footer>
</body>

</html>