<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}/page"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<%session.setAttribute("user",null);%>
<title>登录|zbtMonitor</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/login.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>

<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/login.js"></script>
<script type="text/javascript">
	function ajaxRequest() {
		var userAdmin = $("#userAdmin")[0].value;
		var userPwd = $("#userPwd")[0].value;
		var urlPath = "${ctx}/login.do";
		$.ajax({
			type : "POST",
			url : urlPath,
			data : {
				'userAdmin' : userAdmin,
				'userPwd' : userPwd
			},
			dataType : "json",
			success : function(data) {
				if (data.status == 1) {
					window.location = "${ctx}/index.do";
				} else {
					alert("账号或密码错误!");
					window.location = "${ctx}/login.jsp";
				}
			},
			error : function(data) {
				alert(data.message);
			}
		});
	}
</script>
</head>
<body onkeypress="javascript:if(event.keyCode==13) ajaxRequest();">
	<div id="loginbox">
		<div class="control-group normal_text">
			<h3>
				<img src="${ctx}/img/logo1.png" alt="Logo" />
			</h3>
		</div>
		<div class="control-group">
			<div class="controls">
				<div class="main_input_box">
					<span class="add-on bg_lg"><i class="icon-user"></i> </span><input
						type="text" placeholder="账号" name="userAdmin" id="userAdmin" 
						  />
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<div class="main_input_box">
					<span class="add-on bg_ly"><i class="icon-lock"></i> </span><input
						type="password" placeholder="密码" name="userPwd" id="userPwd" 
						   />
				</div>
			</div>
		</div>
		<div class="form-actions">
			<span class="pull-right"><input type="button" value="登录"
				onclick="ajaxRequest();" class="btn btn-success btn-large" /> </span>
		</div>
	</div>
</body>

</html>
