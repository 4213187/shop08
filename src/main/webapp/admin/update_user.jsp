<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<!DOCTYPE html>--%>
<%@include file="header.jsp" %>
<script src="laydate/laydate.js" ></script>
<script>
    laydate.render({
        elem: '#expiryDate'
        ,type: 'datetime'
        ,lang: 'en'
        ,min: '${user.expiryDate}'// 这里是设置最小日期
        ,btns: ['clear', 'confirm']
    });
    // function getNowFormatDate() {
    //
    //     var date = new Date(s );
    //     var seperator1 = "-";
    //     var seperator2 = ":";
    //     var month = date.getMonth() + 1;
    //     var strDate = date.getDate();
    //     if (month >= 1 && month <= 9) {
    //         month = "0" + month;
    //     }
    //     if (strDate >= 0 && strDate <= 9) {
    //         strDate = "0" + strDate;
    //     }
    //     var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
    //         + " " + date.getHours() + seperator2 + date.getMinutes()
    //         + seperator2 + date.getSeconds();
    //     return currentdate;
    // }

</script>
<div class="page">
    <div class="page-container">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <h4 class="header">修改用户信息</h4>
                    <form action="UserServlet?method=updateInfo&id=${user.id}" method="post" id="updateForm">
                        <table class="table table-striped sortable">
                            <thead>
                            </thead>
                            <tbody>
                            <tr>
                                <th>用户ID</th>
                                <td><input type="text" value="${user.id}" disabled></td>
                            </tr>
                            <tr>

                                <th>用户状态</th>
                                <td><select id="disabled" name="disabled">
                                    <option value="0" selected>正常</option>
                                    <c:choose>
                                        <c:when test="${user.disabled==1}">
                                            <option value="1" selected>禁用</option>
                                        </c:when>
                                        <c:when test="${user.disabled==0}">
                                            <option value="1">禁用</option>
                                        </c:when>
                                    </c:choose>

                                </select>
                                </td>
                            </tr>
                            <c:if test="${admin.grade==1}">
                            <tr>
                                <th>修改会员到期时间</th>
                                <td>
                                    <input type="text" id="expiryDate" name="expiryDate">
                                </td>
<%--                                <td><select id="vip" name="vip">--%>
<%--                                    <option value="0" selected>普通会员</option>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${user.vip==1}">--%>
<%--                                            <option value="1" selected>VIP</option>--%>
<%--                                        </c:when>--%>
<%--                                        <c:when test="${user.vip==0}">--%>
<%--                                            <option value="1">VIP</option>--%>
<%--                                        </c:when>--%>
<%--                                    </c:choose>--%>
<%--                                </select>--%>
<%--                                </td>--%>
                            </tr>
                            </c:if>
                            <td></td>
                            <td>
                                <button class="btn btn-success"
                                        type="submit">修改
                                </button>&nbsp;&nbsp;&nbsp;<input class="btn btn-danger"
                                                                  type="reset" value="重置"/></td>
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



</html>