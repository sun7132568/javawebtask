$.validator.setDefaults({
		submitHandler : function() {
			ajaxSubmitForm();
		}
	});
	$().ready(function() {
		$("#form1").validate({

			rules : {
				password : {
					required : true
				},
				passwordrepeat : {
					required : true,
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
				},
				passwordrepeat : {
					required : "密码不能为空！",
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
				if (data == 1) {
					alert("修改成功！");
					window.location.reload();
				} else
					alert("更新失败！")
			}
		});
	}