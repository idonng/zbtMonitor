<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}/page"></c:set>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="${ctx}/css/fullcalendar.css" />
	<link rel="stylesheet" href="${ctx}/css/style.css" />
	<link rel="stylesheet" href="${ctx}/css/media.css" />
	<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<link rel="stylesheet" href="${ctx}/css/jquery.gritter.css" />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
	</head>
	<style>
	#tab1,#tab2,#tab3{height: 300px;max-width: 100%;}
	h1{padding-right:25px;padding-left:20px;}
	.more{background: none !important;}
	body{ font-family: helvetica, "微软雅黑"; font-size:12px; color:#666;}
	.text:hover{cursor:pointer;}
	</style>
    </head>
    <body>
    	<!--Header-part-->
		<div id="header">
		  <h1><a href="#"></a></h1>
		</div>
		<!--close-Header-part--> 
    	<!--top-Header-menu-->
		<div id="user-nav" class="navbar navbar-inverse">
		  <ul class="nav">
		    <li  id="profile-messages" ><a title="" href="#"  ><i class="icon icon-user"></i>  <span class="text">欢迎     ${user.userName}</span></a>
		     <%--  <ul class="dropdown-menu">
		        <li><a href="#"><i class="icon-user"></i> My Profile</a></li>
		        <li class="divider"></li>
		        <li><a href="#"><i class="icon-check"></i> My Tasks</a></li>
		        <li class="divider"></li>
		        <li><a href="${ctx}/login.jsp"><i class="icon-key"></i> Log Out</a></li>
		      </ul> --%>
		    </li>
		   <!--  <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">信息</span> <span class="label label-important">5</span> <b class="caret"></b></a>
		      <ul class="dropdown-menu">
		        <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> new message</a></li>
		        <li class="divider"></li>
		        <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> inbox</a></li>
		        <li class="divider"></li>
		        <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> outbox</a></li>
		        <li class="divider"></li>
		        <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> trash</a></li>
		      </ul>
		    </li> -->
		    <li class=""><a title="" onclick="selectAllTemp();" target="framebottom"><i class="icon icon-cog"></i> <span class="text">设置</span></a></li>
		    <li class=""><a title="" href="${ctx}/login.jsp" target="_blank"><i class="icon icon-share-alt"></i> <span class="text">退出</span></a></li>
		  </ul>
		</div>
		<!--close-top-Header-menu-->
		<!--start-top-serch-->
		<!-- <div id="search">
		  <input type="text" placeholder="搜索"/>
		  <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
		</div> -->
		<!--close-top-serch-->
 	</body>
 		<script src="${ctx}/js/jquery.min.js"></script>
 	<script type="text/javascript">
 		function selectAllTemp() {
			$.post("${ctx}/selectAllTemplate.do", function(data) {
				if (data == "ok") {
					top.location.href ="${ctx}/jsp/setting.jsp";
				} else {
					location.reload();
				}
			}, "json");
			}
			
 	</script>
</html>