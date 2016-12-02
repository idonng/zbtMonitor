<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}/page"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>简报模板 | zbtMonitor</title>
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
#content {
	width: 88%;
	float: right;
}
body{ font-family: helvetica, "微软雅黑"; font-size:12px; color:#666;}
@
-moz-document url-prefix           () { /*针对 Firefox 的 hack 代码*/
	fieldset {
	display: table-cell;
}

}
thead th {
	padding: 15px !important;
}

thead th:first-child {
	width: 10%;
}

thead th:nth-child(2) {
	width: 35%;
}

thead th:last-child {
	width: 25%;
}

tbody td:first-child {
	text-align: center;
}

tbody td:nth-child(2) {
	text-align: center;
}

tbody td:nth-child(3) {
	text-align: center;
}

tbody td:last-child {
	text-align: center;
}

tbody td {
	padding: 25px 30px 15px 30px !important;
	vertical-align: middle;
}

.add {
	margin: 3px 3px;
}

.keyword {
	min-width: 95.5%;
}

#themename {
	margin-bottom: 10px;
}
	h1{padding: 20px;}
</style>
</head>
<body>
	<!--Header-part-->
<div id="header" style="padding-top:10px;">
  <h1><a href=""></a></h1>
</div>
	<!--close-Header-part-->

	<!--top-Header-menu-->
	<div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav">
			<li  id="profile-messages"><a title="" href="#"
				 ><i class="icon icon-user"></i> <span
					class="text">欢迎 ${user.userName}</span> </a> <!-- 	<ul class="dropdown-menu">
					<li><a href="#"><i class="icon-user"></i> My Profile</a></li>
					<li class="divider"></li>
					<li><a href="#"><i class="icon-check"></i> My Tasks</a></li>
					<li class="divider"></li>
					<li><a href="login.jsp"><i class="icon-key"></i> Log Out</a></li>
				</ul> --></li>
			<!-- <li class="dropdown" id="menu-messages"><a href="#"
				data-toggle="dropdown" data-target="#menu-messages"
				class="dropdown-toggle"><i class="icon icon-envelope"></i> <span
					class="text">信息</span> <span class="label label-important">5</span>
					<b class="caret"></b> </a>
				<ul class="dropdown-menu">
					<li><a class="sAdd" title="" href="#"><i class="icon-plus"></i>
							new message</a></li>
					<li class="divider"></li>
					<li><a class="sInbox" title="" href="#"><i
							class="icon-envelope"></i> inbox</a></li>
					<li class="divider"></li>
					<li><a class="sOutbox" title="" href="#"><i
							class="icon-arrow-up"></i> outbox</a></li>
					<li class="divider"></li>
					<li><a class="sTrash" title="" href="#"><i
							class="icon-trash"></i> trash</a></li>
				</ul>
			</li> -->
			<li class=""><a title="" href="${ctx}/jsp/setting.jsp"><i
					class="icon icon-cog"></i> <span class="text">设置</span> </a>
			</li>
			<li class=""><a title="" href="${ctx}/login.jsp"><i
					class="icon icon-share-alt"></i> <span class="text">退出</span> </a>
			</li>
		</ul>
	</div>
	<!--close-top-Header-menu-->
	<!--start-top-serch-->

	<!--close-top-serch-->
	<!--sidebar-menu-->
	<div id="sidebar">
		<ul>
			<li><a href="setting.jsp"><i class="icon icon-cogs"></i> <span>专题设置</span>
			</a></li>
			<li><a href="usermsg.jsp"><i class="icon icon-user"></i> <span>用户信息</span>
			</a>
			</li>
			<li><a href="pwd.jsp"><i class="icon icon-key"></i> <span>密码设置</span>
			</a></li>
			<li class="active"><a onclick="selectAllTemp();"> <span>模板设置</span>
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
			<div class="widget-box">
				<div class="widget-title">
					<span class="icon"><i class="icon-th"></i> </span>
					<h5>简报设置</h5>

					<!-- Button trigger modal -->
					<button type="button" class="btn btn-info btn-xs fr add"
						data-toggle="modal" data-target="#myModal" href="">添加</button>


					<div class="modal fade" id="myModal" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">&times;</span><span class="sr-only"></span>
									</button>
									<h4 class="modal-title">模板设置</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal" role="form">
										<label for="themename">模板名称：</label> <input type="text"
											id="Name" value="" class="keyword" /><br /> <label
											for="keyword">模板内容：</label>
										<textarea id="Body" class="form-control keyword tip-top"
											rows="13"></textarea>
										<br /> <span class="keyword">是否默认：</span><input type="radio"
											name="Default" value="1" checked />是<input type="radio"
											name="Default" value="0" />否
									</form>
								</div>
								<div class="modal-footer" id="add">
									<button type="button" class="btn btn-default"
										onclick="closeTemp();">关闭</button>
									<button type="button" class="btn btn-primary"
										onclick="addTemp();">保存</button>
								</div>
								<div class="modal-footer" style="display:none" id="update">
									<button type="button" class="btn btn-default"
										onclick="closeTemp();">关闭</button>
									<button type="button" class="btn btn-primary" id="update"
										onclick="updateTemp();">更新</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="widget-content nopadding">
					<table class="table table-bordered data-table" id="msg_table">
						<thead>
							<tr>
								<th>序号</th>
								<th>模板名称</th>
								<th>是否默认模板</th>
								<th>功能</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="templist" varStatus="xh"
								items="${sessionScope.templist}">
								<tr id="del">
									<td>${xh.count}</td>
									<td>${templist.tempName}</td>
									<td><a onclick="isDefault('${templist.tempId}');"><c:choose>
												<c:when test="${templist.tempId eq sessionScope.defaltId}">
													<i class="icon icon-check"></i>
												</c:when>
												<c:otherwise>
													<i class="icon icon-minus-sign"></i>
												</c:otherwise>
											</c:choose> </a></td>
									<td><a onclick="showTemp('${templist.tempId}');"
										class="cormsg btn btn-link">修改</a> <c:choose>
											<c:when test="${templist.tempId eq sessionScope.defaltId}">
												<a class="delmsg btn btn-link" style="color:#6f788f;">删除</a>
											</c:when>
											<c:otherwise>
												<a class="delmsg btn btn-link"
													onclick="showMsg('${templist.tempId}','${templist.tempName}');">删除</a>
											</c:otherwise>
										</c:choose>
									</td>
									<div class="modal fade" id="myDel">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
													<h4 class="modal-title">确认操作</h4>
												</div>
												<div class="modal-body">
													<h5 class="text-danger">
														确定要删除模板-<input type="button" class="btn btn-link"
															id="delName" />?
													</h5>
												</div>
												<div class="modal-footer">
													<input type="hidden" id="hidd">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">取消</button>
													<button type="button" class="btn btn-danger"
														value="deleteAlone" onclick="deleteTemp();">确认删除</button>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>

	<!--End-theme-table-->

	<!--Footer-part-->
	<div class="row-fluid">
		  <div id="footer" class="span12"> 2016 &copy; 步长制药. Copyright 电商部  </div>
	</div>
	<!--end-Footer-part-->

	<script src="${ctx}/js/jquery.min.js"></script>
	<script src="${ctx}/js/jquery.ui.custom.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script src="${ctx}/js/jquery.flot.min.js"></script>
	<script src="${ctx}/js/jquery.flot.resize.min.js"></script>
	<script src="${ctx}/js/jquery.peity.min.js"></script>
	<script src="${ctx}/js/fullcalendar.min.js"></script>
	<script src="${ctx}/js/matrix.js"></script>
	<script src="${ctx}/js/dashboard.js"></script>
	<script src="${ctx}/js/jquery.gritter.min.js"></script>
	<script src="${ctx}/js/interface.js"></script>

	<script src="${ctx}/js/jquery.wizard.js"></script>
	<script src="${ctx}/js/jquery.uniform.js"></script>
	<script src="${ctx}/js/select2.min.js"></script>
	<script src="${ctx}/js/popover.js"></script>

	<script src="js/tables.js"></script>

	<script type="text/javascript">
		// This function is called from the pop-up menus to transfer to
		// a different page. Ignore if the value returned is a null string:
		function goPage(newURL) {

			// if url is empty, skip the menu dividers and reset the menu selection to default
			if (newURL != "") {

				// if url is "-", it is this page -- reset the menu:
				if (newURL == "-") {
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

		function addTemp() {
			var defalt = "";
			var name = $("#Name").val();
			var body = $("#Body").val();
			var radio = document.getElementsByName("Default");
			for ( var i = 0; i < radio.length; i++) {
				if (radio[i].checked) {
					defalt = radio[i].value;
				}
			}
			if (name == "") {
				alert("模板名称不能为空！");
			} else if (body == "") {
				alert("模板内容不能为空！");
			} else {
				$.post("${ctx}/insertTemplate.do", {
					isDefault : defalt,
					tempName : name,
					tempBody : body
				}, function(data) {
					closeTemp();
					if (data.result == "sessionfail") {
						location.href = "${ctx}/login.jsp";
					} else if (data.result == "repeat") {
						alert(data.name+'已存在，可直接修改！');
					} else {
						alert("添加成功！");
						location.reload();
					}
				}, "json");
			}
		}
		//删除模块展示
		function showMsg(id, name) {
			$("#myDel").modal("show");
			$("#hidd").val(id);
			$("#delName").val(name);
		}

		function deleteTemp() {
			var id = $("#hidd").val();
			$("#myDel").modal("show");
			$.post("${ctx}/deleteTemplate.do", {
				tempId : id
			}, function(data) {
				if (data == "sessionfail") {
					location.href = "${ctx}/login.jsp";
				} else {
					alert("删除成功！");
					location.reload();
				}
			}, "json");
		}
		//关闭清楚session内容
		function closeTemp() {
			$("#Name").val("");
			$("#Body").val("");
			$("#Name").attr("readOnly", false);
			$("input[name='Default']").eq(0).attr("checked", "checked");
			$("input[name='Default']").eq(1).attr("disabled", false);
			$("#add").css("display", "block");
			$("#update").css("display", "none");
			$("#myModal").modal("hide");

		}
		var tempId;
		//更新内容展示
		function showTemp(id) {
			$.post("${ctx}/tempById.do", {
				tempId : id
			},
					function(data) {
						if (data.result == "ok") {
							$("#myModal").modal("show");
							$("#Name").attr("readOnly", true);
							$("#Name").val(data.Name);
							$("#Body").val(data.Body);
							if (data.Defalt == 0) {
								$("input[name='Default']").eq(1).attr(
										"checked", "checked");
							} else {
								$("input[name='Default']").eq(1).attr(
										"disabled", true);
							}
							$("#add").css("display", "none");
							$("#update").css("display", "block");
							tempId = data.Id;
						} else {
							location.reload();
						}
					}, "json");
		}

		function updateTemp() {
			var defalt = "";
			var body = $("#Body").val();
			var radio = document.getElementsByName("Default");
			for ( var i = 0; i < radio.length; i++) {
				if (radio[i].checked) {
					defalt = radio[i].value;
				}
			}
			$.post("${ctx}/updateTemplate.do", {
				tempId : tempId,
				isDefault : defalt,
				tempBody : body
			}, function(data) {
				$("#myModal").modal("hide");
				if (data == "sessionfail") {
					location.href = "${ctx}/login.jsp";
				} else {
					alert("更新成功！");
					location.reload();
				}
			}, "json");
		}

		function isDefault(id) {
			$.post("${ctx}/isDefaultTemplate.do", {
				tempId : id
			}, function(data) {
				if (data == "sessionfail") {
					location.href = "${ctx}/login.jsp";
				} else {
					location.reload();
				}
			}, "json");
		}

		function selectAllTemp() {
			$.post("${ctx}/selectAllTemplate.do", function(data) {
				if (data == "ok") {
					location.reload();
				} else {
					location.reload();
				}
			}, "json");
		}
	</script>
</body>
</html>