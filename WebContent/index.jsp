<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" />
<!-- <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script> -->
<script src="js/jquery-3.2.0.min.js"></script>
<script type="text/javascript">
	function PostData() {
		$.ajax({
			cache : true,
			type : "POST",
			url : "Login",
			data : $('#form1').serialize(),
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

<title>信息系统分析与设计</title>
</head>
<body>
	<div id="container">
		<form id="form1">
			<div class="login">LOGIN</div>
			<div class="username-text">Username:</div>
			<div class="password-text">Password:</div>
			<div class="username-field">
				<input type="text" name="username" id="username" />
			</div>
			<div class="password-field">
				<input type="password" name="password" id="password" />
			</div>

			<div id="opt">
				<select id="slt1" name="identity">
					<option value="admin" id="admim">admin</option>
					<option value="ghost" id="ghost">ghost</option>
				</select>
			</div>
			<div class="no-usr-pwd">
				<a href="Register.jsp">还没有账户?注册一个吧！ </a>
			</div>
			<input type="button" value="GO" id="btn1" onclick="PostData()" />
		</form>
	</div>
	<div id="footer">&copy;河南财经政法大学计算机与信息工程学院</div>
</body>
</html>