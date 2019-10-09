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
<%@include file="header.jsp"%>
<script>
	function updateSubmit() {
		$("#tips").html("");
		var newpwd = $("#newpwd").val();
		var conformpwd = $("#conformpwd").val();
		if ( newpwd!=null && newpwd==conformpwd){
		$("#updateForm").submit();
		}else{
			$("#tips").html("密码不一致");
		}
	}
</script>
	<div class="page">
		<div class="page-container">
			<div class="container">
				<div class="row">
					<div class="span12">
						<h4 class="header">修改个人信息</h4>
						<form action="AdminServlet?method=updatePerson&id=${admin.id}" method="post" id="updateForm">
							<table class="table table-striped sortable">
								<thead>
								</thead>
								<tbody>
									<tr>
										<th>管理员ID</th>
										<td><input type="text" value="${admin.id}" disabled></td>
									</tr>

									<tr>
										<th>管理员账号</th>
										<td><input type="text" name="aname"
											value="${admin.aname}" disabled="disabled"/></td>
									</tr>

									<tr>
										<th>原始密码</th>
										<td><input type="text" name="pwd" value="${admin.apwd}"/></td>
									</tr>
									<tr>
										<th>新密码</th>
										<td><input type="password" name="newpwd" id="newpwd" /></td>
									</tr>
									<tr>
										<th>确认新密码</th>
										<td><input type="password" name="conformpwd" id="conformpwd" /> <span id="tips"></span></td>
									</tr>
									<tr>

										<td></td>
										<td><button class="btn btn-success" type="button"
													onclick="updateSubmit()"	 >修改</button>&nbsp;&nbsp;&nbsp;<input class="btn btn-danger"
											type="reset" value="重置" /></td>
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

</html>