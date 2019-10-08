<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@include file="header.jsp"%>
	<div class="page">
		<div class="page-container">
			<div class="container">
				<div class="row">
					<div class="span12">
<%--						<a href="add_admin.jsp"  class="btn pull-right">添加管理员</a>--%>
						<h4 class="header">管理员操作日志</h4>
						<table class="table table-striped sortable">
							<thead>
								<tr>


									<th>操作人员</th>
									<th>操作对象</th>
									<th>操作类型</th>
									<th>操作内容</th>
									<th>操作时间</th>
									<th>操作IP</th>
									<th>当前状态</th>

								</tr>
							</thead>
							<tbody>
							<c:forEach items="${operationLogs}" var="log">
								<tr>
									<td>${log.operator}</td>
									<td>${log.object}</td>
									<td>${log.type}</td>
									<td>${log.content}</td>
									<td>${log.operationDate}</td>
									<td>${log.ip}</td>
									<c:if test="${log.status==0}">
										<td>已提交</td>
										<td><a id="rollback" class="btn btn-danger" href="OperationDataServlet?method=rollback&uuid=${log.uuid}"   >回滚</a></td>
									</c:if>
									<c:if test="${log.status==1}">
										<td>已回滚</td>
									<td><a  class="btn btn-danger"   disabled  >回滚</a></td>
									</c:if>
<%--									<c:choose>--%>
<%--										<c:when test="${log.status}==0">--%>
<%--
<%--										</c:when>--%>
<%--										<c:when test="${log.status}==1">--%>
<%--											<button id="rollback" class="btn btn-danger"  type="button" value="回滚" disabled ></button>--%>
<%--										</c:when>--%>
<%--									</c:choose>--%>


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
						class="close">&times;</button>
					<h3>新建管理员</h3>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="AdminServlet?method=add" method="post" />
					<div class="control-group">
						<label for="inputEmail" class="control-label">账号</label>
						<div class="controls">
							<input id="inputEmail" type="text" name="aname" placeholder="请输入用户名" />
						</div>
					</div>
					<div class="control-group">
						<label for="inputCurrentPassword" class="control-label">密码
						</label>
						<div class="controls">
							<input id="inputCurrentPassword" name="apwd" type="password"
								placeholder="请输入密码" />
						</div>
					</div>
					<div class="modal-footer">
						<a href="#" data-dismiss="modal" class="btn">关闭</a><input
							type="submit" data-dismiss="modal" class="btn btn-primary"
							value="添加" />
					</div>
                    </form>
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
<%--<script>--%>
<%--	protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';--%>
<%--	address = protocol + window.location.host + window.location.pathname--%>
<%--			+ '/ws';--%>
<%--	socket = new WebSocket(address);--%>
<%--	socket.onmessage = function(msg) {--%>
<%--		msg.data == 'reload' && window.location.reload()--%>
<%--	}--%>
<%--</script>--%>
</html>