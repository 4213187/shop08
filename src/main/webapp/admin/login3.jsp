<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE HTML>
<html>
  <head>
    <title>登录界面</title>
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css3/css.css" />
  </head>
  <body>
      	<form name="form1" action="AdminServlet?method=login&index=3" method="post" >
     		 <h1>小新电商后台管理系统</h1>
            <input class=input_1 id=username size=15  name="aname"  placeholder=用户名><br />
          	<input class=input_1 id=password type=text size=15 name="apwd" placeholder=密码><br />${msg}

<%--  	 		<span class="radio_box">--%>
<%--               <input type="radio" id="radio_1" name="gettype" value="users" checked>--%>
<%--               <label for="radio_1"></label>--%>
<%--              普通用户--%>
<%--        	</span>--%>
<%--    		<span class="radio_box">--%>
<%--               <input type="radio" id="radio_2" name="gettype" value="admin">--%>
<%--               <label for="radio_2"></label>--%>
<%--               管理员--%>
<%--       		</span>--%>
            <br/>
            <input class=input_3 type="submit"  value="登录"  />
            <input class=input_3 type="button"  onclick=document.form1.reset() value="重置" />
     	</form>
        <script type="text/javascript" src="js3/script.js"></script>
  </body>
</html>
