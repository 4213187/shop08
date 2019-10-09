<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />

<title>修改类别</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.css" />
<link rel="stylesheet" href="css/styles.css" />
<link rel="stylesheet" href="css/toastr.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.knob.js"></script>
<script src="js/jquery.sparkline.min.js"></script>
<script src="js/toastr.js"></script>
<script src="js/jquery.tablesorter.min.js"></script>
<script src="js/jquery.peity.min.js"></script>
<script src="js/fullcalendar.min.js"></script>
<script src="js/gcal.js"></script>
<script src="js/setup.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>
<%@include file="header.jsp" %>
	<div class="page">
		<div class="page-container">
			<div class="container">
				<div class="row">
					<div class="span12">
						<h4 class="header">修改类别</h4>
						<form action="CategoryServlet?method=update&id=${category.id}" method="post">
							<table class="table table-striped sortable">
								<thead>
								</thead>
								<tbody>
									<tr>
										<th>类别名称</th>
										<td><input type="text" name="name" value="${category.name}"/></td>
									</tr>
									<tr>
										<th>类别描述</th>
										<td><textarea rows="5" cols="20" name="descr">${category.descr}</textarea></td>
									</tr>
									
									<tr>
										<td></td>
										<td><input class="btn btn-success" type="submit"
											value="修改" />&nbsp;&nbsp;&nbsp;<input class="btn btn-danger"
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

</html>