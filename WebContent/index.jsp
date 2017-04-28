<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>图书管理系统</title>
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery-3.2.0.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/bootstrap.js"></script>
<script>
	$.validator.setDefaults({
		submitHandler : function() {
			ajaxSubmitForm();
		}
	});
	$().ready(function() {
		$("#login").validate({

			rules : {
				username : {
					required : true,
				},
				password : {
					required : true,
				}

			},
			messages : {
				username : {
					required : "用户名不能为空！",
				},
				password : {
					required : "密码不能为空！",
				},
			}
		})
	});

	function ajaxSubmitForm() {
		$.ajax({
			cache : true,
			type : "POST",
			url : "Login",
			data : $('#login').serialize(),
			async : false,
			error : function(request) {
				alert("Connection error:" + request.error);
			},
			success : function(data) {
				if (data == 0)
					window.location.href = "admin.html";
				else if (data == 1)
					window.location.href = "welcome.jsp";
				else if (data == 2)
					alert("身份选择错误！")
				else
					alert("账号或密码错误！")
			}
		});
	}
</script>
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
				<a class="navbar-brand" href="#">IS</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="inverseNavbar1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.html">主页<span
							class="sr-only">(current)</span></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">用户管理<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="userQuery.html">用户查询</a></li>
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
				<button type="button" class="btn navbar-right navbar-btn"
					style="margin-top: 8px;"
					onclick="window.location.href='register.html'">注册</button>
				<button type="button" class="btn navbar-right navbar-btn"
					data-toggle="modal" data-target="#Modal"
					style="margin-top: 8px; margin-right: 20px;">登录</button>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div class="container"></div>
	<div class="modal fade" id="Modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" data-backdrop="static"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4>登录系统</h4>
				</div>
				<div class="modal-body">
					<form id="login" class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-xs-3 control-label">Username</label>
							<div class="col-xs-5">
								<input type="text" class="form-control" name="username"
									id="username" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label">Password</label>
							<div class="col-xs-5">
								<input type="password" class="form-control" name="password"
									id="password" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label">ID</label>
							<div class="col-xs-6">
								<div class="radio">
									<label class="col-xs-3 control-label"> <input
										type="radio" name="identity" value="admin" checked="checked"
										required /> Admin
									</label> <label class="col-xs-3 control-label"> <input
										type="radio" name="identity" value="ghost" /> Ghost
									</label>
								</div>
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Submit</button>
					</form>
					<button type="button" class="btn btn-primary pull-right"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


</body>

</html>
