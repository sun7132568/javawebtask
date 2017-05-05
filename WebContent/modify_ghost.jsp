<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="is.pojo.UserPojo"%>
<%
	UserPojo userPojo = (UserPojo) request.getAttribute("userInfo");
	String userid = "";
	if (userPojo.getUserid() == "1" || userPojo.getUserid().equals("1")) {
		userid = "管理员";
	} else {
		userid = "普通用户";
	}
%>
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
		$("#form1").validate({

			rules : {
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
			url : "Update",
			data : $('#form1').serialize(),
			async : true,
			error : function(request) {
				alert("Connection error:" + request.error);
			},
			success : function(data) {
				alert("修改成功！");
				window.location.reload();
			}
		});
	}
</script>
</head>
<body>
	<nav class="navbar navbar-default ">
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
	<div class="container">
		<form id="form1" role="form">
			<input type="hidden" id="userid" name="userid"
				value="<%=userPojo.getUserid()%>" class="form-control" readonly />
			<table class="table table-striped">
				<tbody>
					<tr>
						<td>用户名</td>
						<td><div class=" col-sm-6">
								<input type="text" id="username" name="username"
									value="<%=userPojo.getUsername()%>" class="form-control"
									readonly />
							</div></td>
					</tr>
					<tr>
						<td>密码</td>
						<td><div class=" col-sm-6">
								<input type="text" name="password" id="password"
									value="<%=userPojo.getPassword()%>" class="form-control" />
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
									value="<%=userPojo.getPhonenum()%>" class="form-control" />
							</div></td>
					</tr>
					<tr>
						<td>邮箱地址</td>
						<td><div class=" col-sm-6">
								<input type="text" name="emailadd" id="emailadd"
									value="<%=userPojo.getEmailadd()%>" class="form-control" />
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