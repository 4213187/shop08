<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<div class="page">
    <div class="page-container">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <%--                    <a href="#newUserModal" data-toggle="modal" class="btn pull-right">添加用户</a>--%>
                    <h4 class="header">用户列表</h4>
                    <table class="table table-striped sortable">
                        <thead>
                        <tr>
                            <th>用户ID</th>
                            <th>用户名</th>
                            <th>密码</th>
                            <th>电话</th>
                            <th>邮箱</th>
                            <th>地址</th>
                            <th>注册日期</th>
                            <th>会员到期时间</th>
                            <th>用户状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${users}" var="user">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.userName}</td>
                                <td>${user.userPassword}</td>
                                <td>${user.userPhone}</td>
                                <td>${user.userEmail}<%--										<span class="label label-success">已发货</span>--%>
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <button class="btn">查看详细地址</button>
                                        <button data-toggle="dropdown" class="btn dropdown-toggle">
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <c:forEach items="${user.addresses}" var="address">
                                            <li class="disabled"><a
                                                    href="#">${address.province}${address.city}${address.country}${address.address}</a>
                                                </c:forEach>
                                        </ul>
                                    </div>
                                </td>


                                <td>${user.userRegisterDate}</td>
                                <td>${user.expiryDate}</td>


                                <c:if test="${user.disabled==0}">
                                    <td>正常</td>
                                </c:if>
                                <c:if test="${user.disabled==1}">
                                    <td>禁用</td>
                                </c:if>
                                <td>
                                    <div class="btn-group">
                                        <button class="btn btn-info">操作</button>
                                        <button data-toggle="dropdown" class="btn btn-info dropdown-toggle">
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a href="UserServlet?method=resetPassword&id=${user.id}">重置密码</a>
                                            <li><a href="UserServlet?method=toUpdate&id=${user.id}">修改信息</a>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
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