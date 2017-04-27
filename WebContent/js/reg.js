function loadXMLDoc() {
	var ajax = false;
	try {
		ajax = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
		try {
			ajax = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (E) {
			ajax = false;
		}
	}
	if (!ajax && typeof XMLHttpRequest != 'undefined') {
		ajax = new XMLHttpRequest();
	}
	return ajax;
}
function ck_User_Name() {
	var ajax = loadXMLDoc();
	var userName = document.getElementByName("username").value;
	var urlString = "CkUserNameExist?username=" + userName;
	ajax.onreadystatechange = function() {
		if (ajax.readyState == 4 && ajax.status == 200) {
			document.getElementById("s1").innerHTML = ajax.responseText;
		}
	}
	ajax.open("GET", urlString, true);
	ajax.send();
}

function Password() {
	if (document.getElementById("password").value == null
			|| document.getElementById("password").value == "")
		document.getElementById("s2").innerHTML = "<img src='images/error.png'>  密码不允许为空！";
	else
		document.getElementById("s2").innerHTML = "<img src='images/ok.png'>";
}

function ck_Password() {
	var x = document.getElementById("password").value;
	var y = document.getElementById("passwordrepeat").value;
	if (x != y || y == "" || y == null)
		document.getElementById("s3").innerHTML = "<img src='images/error.png'>  两次输入的密码不一致！";
	else
		document.getElementById("s3").innerHTML = "<img src='images/ok.png'>";
}
function ck_Phonenum() {
	var x = document.getElementById("phonenum").value.length;
	if (x != 11)
		document.getElementById("s4").innerHTML = "<img src='images/error.png'>  请输入有效的手机号码!";
	else
		document.getElementById("s4").innerHTML = "<img src='images/ok.png'>";
}
function ck_Emailadd() {
	if (document.getElementById("emailadd").value == "") {
		document.getElementById("s5").innerHTML = "<img src='images/error.png'>  电子邮件不能为空!";
		return false;
	} else {
		reg = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/gi;
		if (!reg.test(document.getElementById("emailadd").value)) {
			document.getElementById("s5").innerHTML = "<img src='images/error.png'>  不是合法的电子邮件!";
			return false;
		} else {
			document.getElementById("s5").innerHTML = "<img src='images/ok.png'>";
			return true;
		}
	}
}
function ck_Form(thisform) {
	if(thisform.username.value == ''){
		thisform.username.focus();
		return false;
	}
	if(thisform.password.value == ''){
		thisform.password.focus();
		return false;
	}
	if(thisform.passwordrepeat.value == ''){
		thisform.passwordrepeat.focus();
		return false;
	}
	if(thisform.phonenum.value == ''){
		thisform.phonenum.focus();
		return false;
	}
	if(thisform.emailadd.value == ''){
		thisform.emailadd.focus();
		return false;
	}
	var x = thisform.password.value;
	var y = thisform.passwordrepeat.value;
	
	if (x != y || y == "" || y == null){
		thisform.passwordrepeat.focus();
		return false;
	}
	var z = thisform.phonenum.value.length;
	if (z != 11){
		thisform.phonenum.focus();
		return false;
	}
	var reg = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/gi;
	if (!reg.test(document.getElementById("emailadd").value)) {
		thisform.emailadd.focus();
		return false;
		}
	
	return true;
}