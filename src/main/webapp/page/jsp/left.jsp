<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}/page"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>left page</title>
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
<link href="${ctx}/libs/ligerUI/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet" type="text/css" />
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/libs/ligerUI/js/core/base.js" type="text/javascript"></script>
<script src="${ctx}/libs/ligerUI/js/plugins/ligerDialog.js"
	type="text/javascript"></script>
<style>
.reportDate {
	display: none
}

.detail {
	margin-left: 25%;
	padding: 5px !important;
}

input {
	background: #ffffff; /* browsers that don't support rgba */
	background: rgba(45, 45, 45, .15);
	border-radius: 10px;
	width: 100px;
	height: 20px;
	text-align: center;
	margin: 0 10%
}
</style>
<script src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script>
	$(function() {
		$("ul li").click(function() {
			$(this).addClass("active").siblings().removeClass("active");
		});
		//导航栏三级菜单光标设置
		$(".report").click(function() {
			$(".report").removeClass("active");
			$(".reportDate").css("display", "none");
			$(this).next().slideToggle("fast");
			return false;
		});
	});
</script>

</head>

<script type="text/javascript">
	window.onload = loadKeyword_Feature();

	//加载获取专题名称并添加到页面   (wangjing)
	function loadKeyword_Feature() {
		var urlPath = "${ctx}/loadKeyword_Feature.do";
		$
				.ajax({
					type : "POST",
					url : urlPath,
					dataType : "json",
					success : function(data) {
						var json = eval("(" + data + ")");
						var left_ul = $('#left_ul');
						var appendBody = "";
						left_ul
								.append("<li><a onclick=\"loadBrowse('all')\">全部</a></li>");
						for ( var i = 0; i <json.length ; i++) {
							appendBody = appendBody
									+ "<li><a onclick=\"loadBrowse('" + json[i]
									+ "')\">" + json[i] + "</a></li>";
						}
						left_ul.append(appendBody);
					},
					error : function(data) {
						alert(data);
					}
				});
	}

	//点击导航栏获取对应页面以及值
	function loadBrowse(obj) {
		window.parent.framemain.location.href = "browse.jsp?keywordFeature="
				+ obj;
	}
</script>
<body>
	<!--sidebar-menu-->
	<div id="sidebar">
		<ul>
			<li class="active"><a href="${ctx}/jsp/main.jsp"
				target="framemain"><i class="icon icon-home"></i> <span>首页</span>
			</a></li>
			<li class="submenu"><a href="#" target="framemain"><i
					class="icon icon-th-list"></i> <span>舆情浏览</span> </a>
				<ul id="left_ul">
				</ul></li>

			<li><a href="${ctx}/jsp/analyse.jsp" target="framemain"><i
					class="icon icon-inbox"></i> <span>统计分析</span> </a></li>
			<li class="submenu"><a href="#" id="threeMenu"><i
					class="icon icon-th"></i> <span>舆情报告</span> </a>
				<ul>
					<li class="report"><a>日报</a></li>
					<ul class="reportDate">
						<li><a href="javascript:void(0)" onclick='day("today")'
							class="detail">今天</a>
						</li>
						<li><a href="javascript:void(0)" onclick='day("dayBefore1")'
							class="detail">昨天</a></li>
						<li><a href="javascript:void(0)" onclick='day("dayBefore2")'
							class="detail">前天</a></li>
					</ul>

					<li class="report"><a>周报</a>
					</li>
					<ul class="reportDate">
						<li><a href="javascript:void(0)" onclick='day("week")'
							class="detail">本周</a></li>
						<li><a href="javascript:void(0)" onclick='day("weekBefore")'
							class="detail">上周</a></li>
					</ul>
					<li class="report"><a>月报</a>
					</li>
					<ul class="reportDate">
						<li><a href="javascript:void(0)" onclick='day("month")'
							class="detail">本月</a></li>
						<li><a href="javascript:void(0)" onclick='day("monthBefore")'
							class="detail">上月</a></li>
					</ul>
					<li class="report"><a>自定义时间</a></li>
					<li class="reportDate"><input placeholder="开始时间" id="begin"
						onclick="new Calendar().show(this);" readonly="readonly"
						style="float:left" /> <input placeholder="结束时间" id="end"
						onclick="new Calendar().show(this);" readonly="readonly" /> <a
						onclick='day("self")' style="margin:0 0 0 30%">确定</a>
					</li>
				</ul>
			<li><a href="${ctx}/jsp/concern.jsp" target="framemain"><i
					class="icon icon-fullscreen"></i> <span>我的关注</span> </a>
			</li>
		</ul>
	</div>
	<!--sidebar-menu-->

	<script src="${ctx}/js/calendars.js"></script>
	<script src="${ctx}/js/excanvas.min.js"></script>
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
	<script src="${ctx}/js/chat.js"></script>
	<script src="${ctx}/js/jquery.validate.js"></script>
	<script src="${ctx}/js/form_validation.js"></script>
	<script src="${ctx}/js/jquery.wizard.js"></script>
	<script src="${ctx}/js/jquery.uniform.js"></script>
	<script src="${ctx}/js/select2.min.js"></script>
	<script src="${ctx}/js/popover.js"></script>
	<script src="${ctx}/js/jquery.dataTables.min.js"></script>
	<script src="${ctx}/js/tables.js"></script>

</body>
<script>
	//比较日期大小
	function toDate(str) {
		var sd = str.split("-");
		return new Date(sd[0], sd[1], sd[2]);
	}
	function GetDateStr(AddDayCount) {
		var dd = new Date();
		dd.setDate(dd.getDate() + AddDayCount);//获取AddDayCount天后的日期 
		var y = dd.getFullYear();
		var m = dd.getMonth() + 1;//获取当前月份的日期 
		var d = dd.getDate();
		return y + "-" + m + "-" + d;
	}
	function judge(now, endTime) {
		var flag = true;
		var nowDate = GetDateStr(0);
		if (toDate(now) > toDate(nowDate) || toDate(endTime) > toDate(nowDate)) {
			parent.frames["framemain"].$.ligerDialog.warn('选择日期不能大于当前日期！');
			flag = false;
		} else if (toDate(endTime) < toDate(now)) {
			parent.frames["framemain"].$.ligerDialog.warn('结束日期不能小于开始日期！');
			flag = false;
		}
		return flag;
	}
	function day(type) {
		var now = null;
		var endTime = GetDateStr(0);
		if ("today" == type) {
			now = GetDateStr(0);
			type = "day";
			$("#begin").val("");
			$("#end").val("");
		} else if ("dayBefore1" == type) {
			now = GetDateStr(-1);
			type = "day";
			$("#begin").val("");
			$("#end").val("");
		} else if ("dayBefore2" == type) {
			now = GetDateStr(-2);
			type = "day";
			$("#begin").val("");
			$("#end").val("");
		} else if ("week" == type) {
			now = GetDateStr(0);
			type = "week";
			$("#begin").val("");
			$("#end").val("");
		} else if ("weekBefore" == type) {
			now = GetDateStr(-7);
			type = "week";
			$("#begin").val("");
			$("#end").val("");
		} else if ("month" == type) {
			now = GetDateStr(0);
			type = "month";
			$("#begin").val("");
			$("#end").val("");
		} else if ("monthBefore" == type) {
			var n = GetDateStr(0);
			var dd = n.substr(n.lastIndexOf("-") + 1, n.length);
			now = GetDateStr(-dd);
			type = "month";
			$("#begin").val("");
			$("#end").val("");
		} else if ("self" == type) {
			now = $("#begin").val();
			end = $("#end").val();
			if (now == "" || now == null) {
				now = endTime;
			}
			if (end != "" && end != null) {
				endTime = end;
			}
			type = "self";
		}
		if (judge(now, endTime)) {
			$
					.post(
							"${ctx}/show.do",
							{
								"publishedDate" : now,
								"endTime" : endTime,
								"type" : type
							},
							function(data) {
								if (data.result == "ok") {
									parent.frames["framemain"].location.href = "${ctx}/jsp/report.jsp?publishedDate="
											+ now
											+ "&endTime="
											+ endTime
											+ "&type=" + type;
								} else {
									location.reload();
								}
							}, "json");
		}
	}
</script>
</html>