<%@page import="java.util.List"%>
<%@page import="is.pojo.UserPojo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/reg.js"></script>
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
					minlength:6
				},
				passwordrepeat : {
					required : true,
					minlength:6,
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
					minlength:"密码不得低于6位字符！"
				},
				passwordrepeat : {
					required : "密码不能为空！",
					minlength:"密码不得低于6位字符！",
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
			cache : true,
			type : "POST",
			url : "Update",
			data : $('#form1').serialize(),
			async : false,
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
<style type="text/css">
body {
	background: #eeeeee url(images/bg.jpg) top left repeat;
}

.error {
	margin-left: 50px;
	color: red;
}

#form1 {
	width: 600px;
	height: 600px;
	margin: 50px auto;
}

.lab {
	float: left;
	width: 100px;
	height: 26px;
	margin-top: 12px;
	text-align: right;
}

input[type="text"] {
	width: 120px;
	height: 16px;
	margin-top: 10px;
	margin-left: 10px;
	font-family: Verdana, Arial;
	font-size: 14px;
	color: #2d2d2d;
}

input[type="radio"] {
	width: 30px;
	height: 20px;
	margin-top: 10px;
	margin-right: 10px;
}

.sex {
	width: 400px;
	height: 38px;
	margin-top: 10px;
	margin-left: 105px;
}

.inpt {
	width: 400px;
	height: 38px;
	margin-top: 10px;
	margin-left: 105px;
	background: url(images/username-field.png) center left no-repeat;
}

.inpt:hover {
	background: url(images/username-field-hover.png) center left no-repeat;
}

.password-field {
	background: url(images/password-field.png) center left no-repeat;
}

.password-field:hover {
	background: url(images/password-field-hover.png) center left no-repeat;
}
</style>
<%
	session = request.getSession();
	List<UserPojo> list = (List) session.getAttribute("userInfo");
	UserPojo userPojo = list.get(0);	
%>
<title>个人信息修改</title>
</head>
<body>
	<div>
		<form name="form1" id="form1">
			<fieldset>
				<legend>修改个人信息</legend>

				<p>
				<div class="lab">
					<label for="username">用户名：</label>
				</div>
				<div class="inpt">
				<input type="hidden" name="userid" value="<%=userPojo.getUserid()%>" id="userid">
					<input type="text" id="username" name="username"
						value="<%=userPojo.getUsername()%>" readonly="readonly" /> <span
						id="s1" style="color: red; padding-left: 25px;"></span>
				</div>

				</p>

				<p>
				<div class="lab">
					<label for="password">密码：</label>
				</div>
				<div class="password-field inpt">
					<input type="text" name="password" id="password"
						value="<%=userPojo.getPassword()%>" />
				</div>
				</p>

				<p>
				<div class="lab">
					<label for="passwordrepeat">确认密码：</label>
				</div>
				<div class="inpt password-field">
					<input type="text" name="passwordrepeat" id="passwordrepeat"
						value="<%=userPojo.getPassword()%>" />
				</div>
				</p>

				<p>
				<div class="lab">
					<label for="sex">性别：</label>
				</div>
				<div class="sex">
					<input type="radio" value="男" name="sex" checked="checked" /><span>男</span>

					<input type="radio" value="女" name="sex" /><span>女</span>
				</div>
				</p>

				<p>
				<div class="lab">
					<label for="phonenum">电话号码：</label>
				</div>
				<div class="inpt">
					<input type="text" name="phonenum" id="phonenum"
						value="<%=userPojo.getPhonenum()%>" />
				</div>
				</p>

				<p>
				<div class="lab">
					<label for="emailadd">E-mail地址：</label>
				</div>
				<div class="inpt">
					<input type="text" name="emailadd" id="emailadd"
						value="<%=userPojo.getEmailadd()%>" />
				</div>
				</p>

				<p>
					<input type="submit" value="更新"> <input type="reset"
						value="重置">
				</p>
			</fieldset>
		</form>
	</div>
</body>
</html>