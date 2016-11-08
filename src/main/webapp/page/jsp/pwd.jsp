<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}/page"></c:set>
<!DOCTYPE html>
<html>
<head>
<title>密码设置 | zbtMonitor</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/fullcalendar.css" />
<link rel="stylesheet" href="${ctx}/css/style.css" />
<link rel="stylesheet" href="${ctx}/css/media.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="${ctx}/css/jquery.gritter.css" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
<style type="text/css">
h1 {
	padding: 20px;
}

#content {
	width: 88%;
	float: right;
}

html,body {
	min-height: 100% !important;
}

.modify {
	width: 20% !important;
	margin: auto !important;
}
</style>
</head>
<body>
	<!--Header-part-->
	<div id="header">
		<h1>
			<a href="index.jsp">舆情监控平台</a>
		</h1>
	</div>
	<!--close-Header-part-->

	<!--top-Header-menu-->
	<div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav">
			<li class="dropdown" id="profile-messages"><a title="" href="#"
				data-toggle="dropdown" data-target="#profile-messages"
				class="dropdown-toggle"><i class="icon icon-user"></i> <span
					class="text">欢迎 ${user.userName}</span><b class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li><a href="#"><i class="icon-user"></i> My Profile</a>
					</li>
					<li class="divider"></li>
					<li><a href="#"><i class="icon-check"></i> My Tasks</a>
					</li>
					<li class="divider"></li>
					<li><a href="login.jsp"><i class="icon-key"></i> Log Out</a>
					</li>
				</ul></li>
			<li class="dropdown" id="menu-messages"><a href="#"
				data-toggle="dropdown" data-target="#menu-messages"
				class="dropdown-toggle"><i class="icon icon-envelope"></i> <span
					class="text">信息</span> <span class="label label-important">5</span>
					<b class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li><a class="sAdd" title="" href="#"><i class="icon-plus"></i>
							new message</a>
					</li>
					<li class="divider"></li>
					<li><a class="sInbox" title="" href="#"><i
							class="icon-envelope"></i> inbox</a>
					</li>
					<li class="divider"></li>
					<li><a class="sOutbox" title="" href="#"><i
							class="icon-arrow-up"></i> outbox</a>
					</li>
					<li class="divider"></li>
					<li><a class="sTrash" title="" href="#"><i
							class="icon-trash"></i> trash</a>
					</li>
				</ul></li>
			<li class=""><a title="" href="${ctx}/jsp/setting.jsp"><i
					class="icon icon-cog"></i> <span class="text">设置</span>
			</a>
			</li>
			<li class=""><a title="" href="${ctx}/login.jsp"><i
					class="icon icon-share-alt"></i> <span class="text">退出</span>
			</a>
			</li>
		</ul>
	</div>
	<!--close-top-Header-menu-->
	<!--start-top-serch-->
	<!-- <div id="search">
  <input type="text" placeholder="搜索"/>
  <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div> -->
	<!--close-top-serch-->
	<!--sidebar-menu-->
	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>
			密码设置</a>
		<ul>
			<li><a href="setting.jsp"><i class="icon icon-cogs"></i> <span>专题设置</span>
			</a></li>
			<li><a href="usermsg.jsp"><i class="icon icon-user"></i> <span>用户信息</span>
			</a>
			</li>
			<li class="active"><a href="pwd.jsp"> <span>密码设置</span>
			</a></li>
		</ul>
	</div>
	<!--sidebar-menu-->
	<!--main-container-part-->
	<div id="content">
		<!--breadcrumbs-->
		<div id="content-header">
			<div id="breadcrumb">
				<a href="index.jsp" title="返回首页" class="tip-bottom"><i
					class="icon-home"></i> 首页</a>
			</div>
		</div>
		<!--End-breadcrumbs-->
		<!--theme-table-->

		<div class="container-fluid">
			<h1>密码设置</h1>


			<hr>
			<div class="row-fluid">
				<div class="span6">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-key"></i> </span>
							<h5>修改密码</h5>
						</div>
						<div class="widget-content nopadding">
							<form action="#" method="get" class="form-horizontal">
								<div class="control-group">
									<label class="control-label">用户名 :</label>
									<div class="controls">
										<input type="text" class="span11" placeholder="请输入您的用户名"
											required="required" value="${user.userName}" readonly="ture"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">原始密码 :</label>
									<div class="controls">
										<input type="text" class="span11" placeholder="请输入您的原始密码"
											required="required" id="userpwd" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">新密码 :</label>
									<div class="controls">
										<input type="text" class="span11" placeholder="请输入您的新密码"
											required="required" id="pwd" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">确认密码 :</label>
									<div class="controls">
										<input type="text" class="span11" placeholder="请再次输入您的密码"
											required="required" id="rpwd" />
									</div>
								</div>
								<div class="form-actions">
									<button type="submit" class="btn btn-success btn-block modify"
										onclick="updatepwd();">修改</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--Footer-part-->
	<div class="row-fluid">
		<div id="footer" class="span12">
			2016 &copy; 步长制药. Copyright <a href="index.jsp">电商部</a>
		</div>
	</div>

	<!--end-Footer-part-->


	<script src="${ctx}/js/jquery.min.js"></script>
	<script src="${ctx}/js/jquery.ui.custom.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script src="${ctx}/js/calendar.js"></script>
	<script src="${ctx}/js/matrix.js"></script>
	<script src="${ctx}/js/dashboard.js"></script>
	<script src="${ctx}/js/jquery.gritter.min.js"></script>
	<script src="${ctx}/js/interface.js"></script>
	<script src="${ctx}/js/chat.js"></script>
	<script src="${ctx}/js/jquery.validate.js"></script>
	<script src="${ctx}/js/form_validation.js"></script>
	<script src="${ctx}/js/jquery.wizard.js"></script>
	<script src="${ctx}/js/jquery.uniform.js"></script>
	<script src="${ctx}/js/select2.min.js"></script>
	<script src="${ctx}/js/popover.js"></script>
	<script src="${ctx}/js/jquery.dataTables.min.js"></script>
	<script src="${ctx}/js/tables.js"></script>

	<script type="text/javascript">
  // This function is called from the pop-up menus to transfer to
  // a different page. Ignore if the value returned is a null string:
  function goPage (newURL) {

      // if url is empty, skip the menu dividers and reset the menu selection to default
      if (newURL != "") {
      
          // if url is "-", it is this page -- reset the menu:
          if (newURL == "-" ) {
              resetMenu();            
          } 
          // else, send page to designated URL            
          else {  
            document.location.href = newURL;
          }
      }
  }

// resets the menu selection upon entry to this page:
function resetMenu() {
   document.gomenu.selector.selectedIndex = 2;
}

</script>


	<script type="text/javascript">
 function updatepwd(){
  var userid="${user.userId}";
	var userpwd =document.getElementById('userpwd').value;
	  var pwd=document.getElementById('pwd').value;
	  var rpwd=document.getElementById('rpwd').value;
	  
	 if(pwd!=rpwd){
	  alert("两次新密码不一致！")
	  }
	  else
	  {
      var urlPath = "${ctx}/updatepwd.do";
		$.ajax({
			type : "POST",
			url : urlPath,
			data : {
			'uid' : userid,
			'userpwd' : userpwd,
			'newpwd' : pwd
				
			},
			dataType : "json",
			success : function(data) {
				if (data=="0") {
					alert("原始密碼不正確！");
					location.reload();   
				}
				else if (data=="1") {
					alert("更新成功!");
					location.reload();   
				} else {
					alert("更新失败!");
					location.reload(); 
				}
			} 
		});  
	} 
	}
     </script>
</body>
</html>
