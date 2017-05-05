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
			url : "Login?method=login",
			data : $('#login').serialize(),
			dataType : "json",
			cache : false,
			async : true,
			error : function(request) {
				alert("Connection error:" + request.error);
			},
			success : function(data) {
				if (data.flag == 0)
					window.location.href = "admin.html";
				else if (data.flag == 1) {
					window.location.reload();
				} else if (data.flag == 2)
					alert("身份选择错误！")
				else
					alert("账号或密码错误！")
			}
		});
	}
</script>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#defaultNavbar1">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">IS</a>
			</div>
			<div class="collapse navbar-collapse" id="defaultNavbar1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Link<span class="sr-only">(current)</span></a></li>
					<li><a href="#">###</a></li>
					<li><a href="#">###</a></li>
					<li><a href="#">###</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">###<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">###</a></li>
							<li><a href="#">###</a></li>
							<li><a href="#">###</a></li>
							<li class="divider"></li>
							<li><a href="#">###</a></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">查询</button>
				</form>
				<div class="navbar-right nav" hidden=""></div>
				<div class="navbar-right nav" id="state_content">

					<!-- ------------加载注册登录按钮或者登录状态信息----------- -->
				</div>
				<script type="text/javascript">
					$("#state_content").load("CkState");
				</script>
			</div>
		</div>
	</nav>
	<!-- 导航条结束-->

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
					<button id="cls" type="button" class="btn btn-primary pull-right"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script src="js/bootstrap.js"></script>
</body>
</html>

