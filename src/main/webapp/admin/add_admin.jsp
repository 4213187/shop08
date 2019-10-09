<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@include file="header.jsp" %>
<div class="page">
    <div class="page-container">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <h4 class="header">添加管理员</h4>
                    <form id="addForm" action="AdminServlet?method=add" method="post">
                        <table class="table table-striped sortable">
                            <thead>
                            </thead>
                            <tbody>
                            <tr>
                                <th>用户名</th>
                                <td><input type="text" name="aname" id="aname" onblur="ajaxAname()"/><span
                                        class="error"></span>&nbsp;&nbsp;<span class="tips" id="anameMsg"></span></td>

                            </tr>
                            <tr>
                                <th>密码</th>
                                <td><input type="password" name="apwd" id="apwd"/></td>
                            </tr>
                            <tr>
                                <th>类型</th>
                                <td>
                                    <select id="grade" name="grade">
                                      <option value="3" selected >普通管理员</option>
                                      <c:if test="${admin.grade==1}">
                                          <option value="2">超级管理员</option>
                                      </c:if>
                                    </select>
                                </td>
                            <tr>
                                <td></td>
                                <td><input class="btn btn-success" type="button" onclick="addSubmit()" value="添加"/>&nbsp;&nbsp;&nbsp;
                                    <input class="btn btn-danger" type="reset" value="重置"/></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
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
<script src="js/d3-setup.js"></script>
<script>
    function addSubmit() {

        if (ajaxAname()) {

            $("#addForm").submit();
        }
    }

    function ajaxAname() {
        var flag = true;
        var inuptAname = $("#aname").val();

        if (inuptAname == "" || inuptAname == null) {
            $("#anameMsg").html("×");
            $("#anameMsg").css("color", "red");
            flag = false;
        } else {

            $.ajax({
                type: "post",
                url: "AdminServlet?method=findByAname",
                data: "aname=" + $("#aname").val(),
                // async:false,
                success: function (msg) {
                    if (msg != null && msg.trim() == "fail") {

                        $("#anameMsg").html("×");
                        $("#anameMsg").css("color", "red");
                        $("#aname").val("");
                        flag = false;

                    } else if (msg != null && msg.trim() == "success") {
                        $("#anameMsg").html("√");
                        $("#anameMsg").css("color", "#00FF7F");
                    }


                }
            })
        }

        return flag;
    }
</script>
<style>
    .tips {
        font-size: large;
    }
</style>
</html>