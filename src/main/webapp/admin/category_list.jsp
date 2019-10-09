<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
<script>
    $(function () {
        $.ajax({
            type: "post",
            url: "CategoryServlet?method=findAll",
            // dateType:'json',
            success: function (resp) {
                var categories = eval(resp);

                findChildren(categories);
            }

        })
    })

    function findChildren(categories) {
        for (let i in categories) {
            let c = categories[i];
            var str = "";
            var li="" ;
            if (c.grade == 2) {
                str = "----";
            } else if (c.grade == 3) {
                str = "--------";
            }
            if (c.grade == 3){
                li ="";
            }else {
                li ="<li><a href='CategoryServlet?method=toAddChildren&id="+c.id+"'  >添加子类别</a> ";
            }
            var tr = "<tr><td>" + c.id + "</td><td>" + str + c.name + "</td><td>" + c.descr + "</td><td>" + c.pid + "</td><td>" + (c.leaf == 1 ? "是" : "否") + "</td><td>" + c.grade + "</td>" +
                " <td> " +
                  "<div class='btn-group'> " +
                     "<button class='btn btn-info'>操作</button>" +
                      " <button data-toggle='dropdown' class='btn btn-info dropdown-toggle'> " +
                       "<span class='caret'></span> " +
                     "</button> " +
                     "<ul class='dropdown-menu'> " +

                        li +
                        "<li><a href='#'>删除</a> " +
                      "</ul> " +
                  "</div> " +
                "</td>"
         + "</tr>";

            if (c.leaf == 1) {
                $("#categories").append(tr);
                // $(tr).appendTo("#categories");
            } else {
                $(tr).appendTo("#categories");
                findChildren(c.children);
            }
        }

    }


</script>
<div class="page">
    <div class="page-container">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <%--                    <a href="#newUserModal" data-toggle="modal" class="btn pull-right">添加用户</a>--%>
                    <h4 class="header">类别列表</h4>
                    <table class="table table-striped sortable">
                        <thead>
                        <tr>

                            <th>类别ID</th>
                            <th>类别名称</th>
                            <th>类别描述</th>
                            <th>上一级类别ID</th>
                            <th>叶子结点</th>
                            <th>级别</th>

                        </tr>
                        </thead>
                        <tbody id="categories">

                        </tbody>
                    </table>
                    <div class="pagination pagination-centered">
                        <ul>
                            <li class="disabled"><a href="#">&laquo;</a></li>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">&raquo;</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div id="newUserModal" class="modal hide fade">
            <div class="modal-header">
                <button type="button" data-dismiss="modal" aria-hidden="true"
                        class="close">&times;
                </button>
                <h3>新建用户</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="add.do" method="post"/>
                <div class="control-group">
                    <label for="inputEmail" class="control-label">用户名</label>
                    <div class="controls">
                        <input id="inputEmail" type="text" placeholder="请输入用户名"/>
                    </div>
                </div>
                <div class="control-group">
                    <label for="inputCurrentPassword" class="control-label">密码
                    </label>
                    <div class="controls">
                        <input id="inputCurrentPassword" type="password"
                               placeholder="请输入密码"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" data-dismiss="modal" class="btn">关闭</a><input
                        type="submit" data-dismiss="modal" class="btn btn-primary"
                        value="添加用户"/>
                </div>
            </div>
            </form>
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