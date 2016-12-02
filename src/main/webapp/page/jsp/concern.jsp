<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}/page"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<title>我的关注 | zbtMonitor</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/jquery.ui.custom.js"></script>
<script src="${ctx}/js/bootstrap.min.js"></script>
<script src="${ctx}/js/jquery.uniform.js"></script>
<script src="${ctx}/js/select2.min.js"></script>
<script src="${ctx}/js/jquery.dataTables.min.js"></script>
<script src="${ctx}/js/matrix.js"></script>
<script src="${ctx}/js/tables.js"></script>
<script src="${ctx}/js/jquery.js"></script>
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/uniform.css" />
<link rel="stylesheet" href="${ctx}/css/select2.css" />
<link rel="stylesheet" href="${ctx}/css/style.css" />
<link rel="stylesheet" href="${ctx}/css/media.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
<style>
.leading-out a {
	color: #fff !important;
}

.check-all {
	text-align: left !important;
}

tbody tr td:first-child {
	vertical-align: middle !important;
}

.cc {
	cursor: pointer !important;
}
</style>
<!-- 表格查询  -->
<script type="text/javascript"
	src="${ctx}/libs/ligerUI/js/ligerui.all.js"></script>
<script type="text/javascript" src="${ctx}/libs/jquery.cookie.js"></script>
<script src="${ctx}/libs/ligerUI/js/plugins/ligerGrid.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="${ctx}/libs/ligerUI/skins/Aqua/css/ligerui-all.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/libs/ligerUI/skins/Gray2014/css/all.css" />
</head>
<body>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> 主页</a>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">

					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-th"></i> </span>
							<form method="post" action="${ctx}/exportFocus.do" onsubmit='return getCheckedIds();'>
								<input type="hidden" id="resultKeys" name="resultKeys" value="" />
								<button class="label label-info leading-out cc" type="submit">批量导出</button>
							</form>
							<button class="label label-info leading-out cc"
								onclick="ajaxCancelRequest();">取消关注</button>
						</div>
						<div id="maingrid4" style="margin-top:0%;"></div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!--Footer-part-->
	<div class="row-fluid">
		<div id="footer" class="span12">
    	<div id="footer" class="span12"> 2016 &copy; 步长制药. Copyright 电商部  </div>
		</div>
	</div>
	<!--end-Footer-part-->

	<script>
		var grid;
		var urlPath = "${ctx}/getPublicOpinionFocus.do";

		$(f_initGrid());
		function f_initGrid() {
		grid = $("#maingrid4").ligerGrid({
			title : '<font color=green>欢迎查看舆情信息!</font>',
			checkbox : true,
			columns : [
					{
						display : '编号',
						name : 'resultKy',
						width : "7%"
					},
					{
						display : '标题',
						name : 'resultTitle',
						width : "37%",
						align : 'left'
					},
					{
						display : '作者',
						name : 'resultAuthor',
						width : "12%"
					},
					{
						display : '来源分类',
						name : 'resultType',
						width : "6%",
						render : function(row) { //数据来源分类  1：微博  2：新闻   3：论坛  4：博客  5：微信
							var html = null;
							if (row.resultType == 1) {
								html = "微博";
							} else if (row.resultType == 2) {
								html = "新闻";
							} else if (row.resultType == 3) {
								html = "论坛";
							} else if (row.resultType == 4) {
								html = "博客";
							} else if (row.resultType == 5) {
								html = "微信";
							} else {
								html = "未知来源";
							}
							return html;
						}
					},
					{
						display : '数据来源',
						name : 'resultSource',
						width : "7%"
					},
					{
						display : '关键字',
						name : 'keyword',
						width : "9%"
					},
					{
						display : '发布时间',
						name : 'resultBody',
						width : "12%"
					},
					{
						display : '情感分类',
						name : 'resultEmotion',
						width : "8%",
						align : 'left',
						render : function(row) { //情感分类  0:未分类;(默认为0)  1:正面; 2:中立; 3:负面;
							var html = null;
							if (row.resultEmotion == 0) {
								html = "<img src='${ctx}/img/none.png' style='margin-left:20px'/> 未分类";
							} else if (row.resultEmotion == 1) {
								html = "<img src='${ctx}/img/good.png' style='margin-left:20px'/> 正面";
							} else if (row.resultEmotion == 2) {
								html = "<img src='${ctx}/img/mid.png' style='margin-left:20px'/> 中立";
							} else if (row.resultEmotion == 3) {
								html = "<img src='${ctx}/img/bad.png' style='margin-left:20px'/> 负面";
							}
							return html;
						}
					}, ],

			url : urlPath,
			pageParmName : "currentPage",
			pagesizeParmName : "rowSize",
			pageSize : 10,
			record : "total",
			root : "list",
			width : "100%",
			height : "80%",
		});
		}

		var id;
		function getCheckedIds() {
			id = "";
			if (grid.getSelecteds().length < 1) {
				//alert("请先进行选择！");
				$.ligerDialog.warn('系统警告: 请选择舆情记录！');
				return false;
			} else {
				for ( var i = 0; i < grid.getSelecteds().length; i++) {
					id = id + grid.getSelecteds()[i].resultKy + ",";
				}
				$("#resultKeys").val(id);
				return true;
			}
		}
		function ajaxCancelRequest() {
			if(getCheckedIds()){
				var resultKeys = id;
				var urlPath = "${ctx}/cancelFocus.do";
				$.ajax({
					type : "POST",
					url : urlPath,
					data : {
						'resultKeys' : resultKeys
					},
					dataType : "json",
					async : false,
					success : function(data) {
						//alert(data);
						$.ligerDialog.success(data);
						$(f_initGrid());
					},
					error : function(data) {
						//alert("失败！");
						$.ligerDialog.warn("对不起，取消关注失败！请刷新再试");
					}
				});
			}
		}
	</script>

</body>
</html>
