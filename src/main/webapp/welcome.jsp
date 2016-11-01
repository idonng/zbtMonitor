<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/fullcalendar.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/matrix-style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/matrix-media.css" />
<link
	href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery.gritter.css" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
<script src="${pageContext.request.contextPath}/js/excanvas.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ui.custom.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.flot.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.flot.resize.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.peity.min.js"></script>
<script src="${pageContext.request.contextPath}/js/fullcalendar.min.js"></script>
<script src="${pageContext.request.contextPath}/js/matrix.js"></script>
<script src="${pageContext.request.contextPath}/js/matrix.dashboard.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.gritter.min.js"></script>
<script src="${pageContext.request.contextPath}/js/matrix.interface.js"></script>
<script src="${pageContext.request.contextPath}/js/matrix.chat.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script
	src="${pageContext.request.contextPath}/js/matrix.form_validation.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.wizard.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.uniform.js"></script>
<script src="${pageContext.request.contextPath}/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/matrix.popover.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/js/matrix.tables.js"></script>
<title>测试</title>
</head>

<body>${user.userName}
</body>
<script type="text/javascript">
  testajax();
  function testajax(){
  alert(1111);
  $.ajax({
  	url:"user/showUser1.do",
  	data:{id:1},
  	datatype:"json",
  	success: function(msg){
  	alert(msg);
  	window.location="user/showUser.do?id=1";
  	}
  });
  
  }
  
  </script>

</html>
