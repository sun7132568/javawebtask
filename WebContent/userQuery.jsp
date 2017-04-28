<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Untitled Document</title>
<link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#inverseNavbar1">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="admin.html">IS</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="inverseNavbar1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="admin.html">主页<span
							class="sr-only">(current)</span></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">用户管理<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="UserQuery">用户查询</a></li>
							<li><a href="#">添加用户</a></li>
							<li><a href="#">删除用户</a></li>
							<li><a href="#">修改信息</a></li>
							<li><a href="#">权限管理</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">图书管理<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">###</a></li>
							<li><a href="#">###</a></li>
							<li><a href="#">###</a></li>
							<li><a href="#">###</a></li>
							<li><a href="#">###</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">借阅管理<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">###</a></li>
							<li><a href="#">###</a></li>
							<li><a href="#">###</a></li>
							<li><a href="#">###</a></li>
							<li><a href="#">###</a></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">查询</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">联系我们<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">图书馆位置</a></li>
							<li><a href="#">读者留言</a></li>
							<li><a href="#">联系电话</a></li>
							<li class="divider"></li>
							<li><a href="#">赞助</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div class="container">
		<table class="table table-striped">
			<tbody>
				<tr>
					<td>身份</td>
					<td>用户名</td>
					<td>性别</td>
					<td>电话号码</td>
					<td>邮箱地址</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${userPojos}" var="userPojo">
					<c:if test="${userPojo.userid == 1 }">
						<c:set var="identity" scope="request" value="${'管理员'}"></c:set>
					</c:if>
					<c:if test="${userPojo.userid == 0 }">
						<c:set var="identity" scope="request" value="${'普通用户'}"></c:set>
					</c:if>
					<tr>
						<td>${identity }</td>
						<td>${userPojo.username }</td>
						<td>${userPojo.sex }</td>
						<td>${userPojo.phonenum }</td>
						<td>${userPojo.emailadd }</td>
						<td><a>修改</a>&nbsp;/ <a>删除</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.11.2.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.js"></script>
</body>
</html>