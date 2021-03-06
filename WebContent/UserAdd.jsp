<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>管理员控制台</title>
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
		$("#form1").validate({

			rules : {
				username : {
					required : true,
					minlength : 6,
					remote : {
						url : "CkUserNameExist",
						type : "POST",
						data : {
							username : function() {
								return $("#username").val();
							}
						}
					}
				},
				password : {
					required : true,
					minlength : 6
				},
				passwordrepeat : {
					required : true,
					minlength : 6,
					equalTo : "#password"
				},
				phonenum : {
					required : true,
					minlength : 11,
					maxlength : 11
				},
				emailadd : {
					required : true,
					email : true
				}

			},
			messages : {
				username : {
					required : "用户名不能为空！",
					minlength : "用户名不得低于6位字符！",
					remote : "用户名已被注册"
				},
				password : {
					required : "密码不能为空！",
					minlength : "密码不得低于6位字符！"
				},
				passwordrepeat : {
					required : "密码不能为空！",
					minlength : "密码不得低于6位字符！",
					equalTo : "两次输入的密码不一致"
				},
				phonenum : {
					required : "请输入有效的手机号码!",
					minlength : "请输入有效的手机号码!",
					maxlength : "请输入有效的手机号码!"
				},
				emailadd : {
					required : "请输入正确的电子邮箱地址！",
					email : "请输入正确的电子邮箱地址！"
				}
			}
		});
	})
	function ajaxSubmitForm() {
		$.ajax({
			cache : false,
			type : "POST",
			url : "Register",
			data : $('#form1').serialize(),
			async : true,
			error : function(request) {
				alert("Connection error:" + request.error);
			},
			success : function(data) {
				alert("添加成功！");
				window.location.reload();
			}
		});
	}
</script>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#inverseNavbar1">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">IS</a>
			</div>
			<div class="collapse navbar-collapse" id="inverseNavbar1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="admin.html">控制台主页<span
							class="sr-only">(current)</span></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">用户管理<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="UserQuery">用户查询</a></li>
							<li><a href="#">添加用户</a></li>
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
			</div>
		</div>
	</nav>
	<div class="container">
		<form id="form1" role="form">
			<table class="table table-striped">
				<tbody>
				<tr>
						<td>身份</td>
						<td><div class=" col-sm-6">
								<select class=" col-sm-6 form-control" name="userid" id="userid">
									<option value="1">管理员</option>
									<option value="0">普通用户</option>
								</select>
							</div></td>
					</tr>
					<tr>
						<td>用户名</td>
						<td><div class=" col-sm-6">
								<input type="text" id="username" name="username"
									 class="form-control"
									 />
							</div></td>
					</tr>
					<tr>
						<td>密码</td>
						<td><div class=" col-sm-6">
								<input type="text" name="password" id="password"
									 class="form-control" />
							</div></td>
					</tr>
					<tr>
						<td>性别</td>
						<td><div class=" col-sm-6">
								<label class="checkbox-inline"> <input type="radio"
									name="sex" value="男" checked> 男
								</label> <label class="checkbox-inline"> <input type="radio"
									name="sex" value="女"> 女
								</label>
							</div></td>
					</tr>
					<tr>
						<td>电话号码</td>
						<td><div class=" col-sm-6">
								<input type="text" name="phonenum" id="phonenum"
									 class="form-control" />
							</div></td>
					</tr>
					<tr>
						<td>邮箱地址</td>
						<td><div class=" col-sm-6">
								<input type="text" name="emailadd" id="emailadd"
									 class="form-control" />
							</div></td>
					</tr>
					<tr>
						<td><div class=" col-sm-6 pull-right">
								<button type="submit" class="btn btn-primary">提交</button>
							</div></td>
						<td><div class=" col-sm-6">
								<button type="reset" class="btn btn-primary">重置</button>
							</div></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<script src="js/bootstrap.js"></script>
</body>
</html>