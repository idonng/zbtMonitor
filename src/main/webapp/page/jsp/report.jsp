<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}/page"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>舆情报告 | zbtMonitor</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/style.css" />
<link rel="stylesheet" href="${ctx}/css/media.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="${ctx}/css/jquery.gritter.css" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
<style>
.msgdata {
	max-width: 200px;
	padding: 20px 40px 30px 20px;
	margin: 0 auto !important;
}

.echarts {
	width: 100%;
	height: 300px;
}

.msgdata h5 {
	padding-bottom: 20px;
}

.msgdata h5 span {
	margin-left: 50px;
	text-align: center;
	font-size: 40px;
	width: 100px !important;
	height: 50px !important;
	line-height: 47px;
}

textarea {
	min-width: 97%;
	min-height: 100%;
	resize: none;
}

.action3 {
	float: right;
	margin-top: -22px;
}

h1 {
	font-weight: bold;
	font-family: "微软雅黑"
}
</style>
<script src="${ctx}/js/excanvas.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/jquery.ui.custom.js"></script>
<script src="${ctx}/js/bootstrap.min.js"></script>
<script src="${ctx}/js/jquery.flot.min.js"></script>
<script src="${ctx}/js/jquery.flot.resize.min.js"></script>
<script src="${ctx}/js/matrix.js"></script>
<script src="${ctx}/js/interface.js"></script>
<script src="${ctx}/js/jquery.uniform.js"></script>
<script src="${ctx}/js/select2.min.js"></script>
<script src="${ctx}/js/tables.js"></script>
<script src="${ctx}/echarts/echarts.js"></script>
</head>
<body>
	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/jsp/index.jsp" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> 首页</a>
			</div>
			<h1>舆情监测 &nbsp;&nbsp;&nbsp;${sessionScope.title}</h1>
		</div>
		<div class="container-fluid">
			<hr />
			<p class="action3">
				<a href="" class="btn btn-success" data-toggle="modal"
					data-target="#leadOut"><i class="icon-upload-alt"></i>导出</a> <a
					href="" onclick="prints();" class="btn btn-info"><i
					class="icon-print"></i> 打印</a> <a href="" class="btn btn-danger"><i
					class="icon-refresh"></i> 刷新</a>
			</p>
			<div class="row-fluid">
				<div class="span12">

					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-list"></i> </span>
							<h5>舆情概况 &nbsp;&nbsp;&nbsp;</h5>
						</div>
						<div class="widget-content">
							${sessionScope.si}${sessionScope.situation}&nbsp;&nbsp;&nbsp; <a
								href="" class="editSituation" data-toggle="modal"
								data-target="#myModal"><i class="icon-edit"></i>编辑</a>
						</div>
					</div>
				</div>
				<!--row-fluid-end-->

				<!-- Modal -->
				<div class="modal fade" id="leadOut" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only"></span>
								</button>
								<h4 class="modal-title" align="CENTER" id="myModalLabel">导出简报为word文件</h4>
							</div>
							<h5 style="margin-left:10%">导出模板：</h5>
							<div class="modal-body" align="center">
								<c:forEach var="item" items="${sessionScope.templist}">
									<c:choose>
										<c:when test="${item.tempId eq sessionScope.defaltId}">
											<input type="radio" name="muban" value="${item.tempId}"
												checked />${item.tempName}
											</c:when>
										<c:otherwise>
											<input type="radio" name="muban" value="${item.tempId}" />${item.tempName}
											</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
							<div class="modal-footer">
								<form method="post"
									action="${ctx}/exportReport.do?publishedDate=${param.publishedDate}
									&type=${param.type}&endTime=${param.endTime}"
									onsubmit='exported();'>
									<input type="hidden" name="tempId" id="tempId" value="24"></input>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="submit" class="btn btn-primary">导出</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">

							<div class="modal-body" style="text-align:center;">
								<h4 class="modal-title" align="CENTER">舆情概况</h4>
								</br>
								<h5>${sessionScope.si}</h5>
								<textarea name="situation" id="situation" cols="30" rows="10">${sessionScope.situation}</textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button id="situation" type="button"
									onclick="updateSituation();" class="btn btn-primary">保存</button>
							</div>
						</div>
					</div>
				</div>


				<div class="row-fluid">
					<div class="widget-box span12">
						<div class="widget-title">
							<span class="icon"><i class="icon-th"></i> </span>
							<h5>数据概况</h5>
						</div>
						<div class="widget-content nopadding"
							style="overflow: auto; width: 100%;">
							<table class="table table-bordered data-table" id="msg_table">
								<thead>
									<tr>
										<th>采集信息总量</th>
										<th>确认正面信息总量</th>
										<th>确认负面信息总量</th>
										<th>确认中性信息总量</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="span4">
											<div class="msgdata">
												<h5>
													采集信息总量 <span class="badge badge-success">${sessionScope.count}</span>
												</h5>
												<p>占全部采集信息：100%</p>
												<p>每日平均量：${sessionScope.average}</p>
											</div>
										</td>
										<td class="span4">
											<div class="msgdata">
												<h5>
													确认正面信息总量 <span class="badge badge-info">${sessionScope.positiveCount}</span>
												</h5>
												<p>占全部采集信息：${sessionScope.positivePercent}%</p>
												<p>每日平均量：${sessionScope.positiveAverage}</p>
											</div>
										</td>
										<td class="span4">
											<div class="msgdata">
												<h5>
													确认负面信息总量 <span class="badge badge-important">${sessionScope.negativeCount}</span>
												</h5>
												<p>占全部采集信息：${sessionScope.negativePercent}%</p>
												<p>每日平均量：${sessionScope.negativeAverage}</p>
											</div>
										</td>
										<td class="span4">
											<div class="msgdata">
												<h5>
													确认中性信息总量 <span class="badge badge-neutral">${sessionScope.neuterCount}</span>
												</h5>
												<p>占全部采集信息：${sessionScope.neuterPercent}%</p>
												<p>每日平均量：${sessionScope.neuterAverage}</p>
											</div>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!--row-fluid-end-->

				<div class="row-fluid">
					<div class="widget-box span12">
						<div class="widget-title">
							<span class="icon"><i class="icon-th"></i> </span>
							<h5>总体舆情统计</h5>

						</div>
						<div class="widget-content nopadding"
							style="overflow: auto; width: 100%;">
							<table class="table table-bordered data-table">
								<thead>
									<tr>
										<th>采集趋势图</th>
										<th>采集来源媒体类型构成图</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="span6">
											<div class="widget-box">
												<div class="widget-content" align="CENTER">
													<div id='line' class="echarts"></div>
												</div>
											</div>
										</td>
										<td class="span6">
											<div class="widget-box">

												<div class="widget-content" align="CENTER">
													<div id='pie' class="echarts"></div>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!--row-fluid-end-->
					<div class="row-fluid">
						<div class="widget-box span12">
							<div class="widget-title">
								<span class="icon"><i class="icon-th"></i> </span>
								<h5>负面舆情统计</h5>

							</div>
							<div class="widget-content nopadding"
								style="overflow: auto; width: 100%;">
								<table class="table table-bordered data-table">
									<thead>
										<tr>
											<th>采集趋势图</th>
											<th>采集来源媒体类型构成图</th>
										</tr>
									</thead>
									<tbody>

										<tr>
											<td class="span6">
												<div class="widget-box">
													<div class="widget-content" align="CENTER">
														<div id='negativeLine' class="echarts"></div>
													</div>
												</div>
											</td>
											<td class="span6">
												<div class="widget-box">
													<div class="widget-content" align="CENTER">
														<div id='negativePie' class="echarts"></div>
													</div>
												</div>
											</td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
						<!--row-fluid-end-->

					</div>
				</div>

			</div>
			<div class="widget-box">
				<div class="widget-title">
					<span class="icon"> <i class="icon-list"></i> </span>
					<h5>情况说明 &nbsp;&nbsp;&nbsp;</h5>
				</div>
				<div class="widget-content">
					${sessionScope.explain}&nbsp;&nbsp;&nbsp; <a href=""
						class="editSituation" data-toggle="modal"
						data-target="#explainModal"><i class="icon-edit"></i>编辑</a>
				</div>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="explainModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">

						<div class="modal-body">
							<h4 class="modal-title" align="CENTER">情况说明</h4>
							</br>
							<textarea name="explain" id="explain" cols="30" rows="10">${sessionScope.explain}</textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button id="explain" type="button" onclick="updateExplain();"
								class="btn btn-primary">保存</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--container-fluid-end-->
	</div>
	<!--content-header-end-->
	</div>
	<!-- content-end-->
	<!--Footer-part-->
	<div class="row-fluid">
		<div id="footer" class="span12">
			2016 &copy; 步长制药. Copyright <a href="index.jsp">电商部</a>
		</div>
	</div>
	<!--end-Footer-part-->
	<script type="text/javascript">
		function echarts(div, type1, type2, url, emotion) {
			require.config({
				paths : {
					echarts : '${ctx}/echarts',
				}
			});
			require([ 'echarts', 'echarts/chart/' + type1,
					'echarts/chart/' + type2 ], function(ec) {
				var myChart = ec.init(document.getElementById(div));
				//myChart.showLoading({text: '正在努力的读取数据中...'});
				// 为echarts对象加载数据   
				$.post(url, {
					"publishedDate" : "${param.publishedDate}",
					"type" : "${param.type}",
					"endTime" : "${param.endTime}",
					"emotion" : emotion
				}, function(data) {
					var opt = $.parseJSON(data);
					myChart.setOption(opt);
					//myChart.hideLoading();
				},

				"json");

				setTimeout(exportImage, 2000);
				function exportImage() {
					var data = "a="
							+ encodeURIComponent(myChart.getDataURL("png"));
					var xmlhttp;
					if (window.XMLHttpRequest) { // code for IE7+, Firefox, Chrome, Opera, Safari  
						xmlhttp = new XMLHttpRequest();
					} else { // code for IE6, IE5  
						xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
					}
					xmlhttp.open("POST",
							"${ctx}/saveImage.do?imageName=" + div, true);
					xmlhttp.setRequestHeader("Content-type",
							"application/x-www-form-urlencoded");
					xmlhttp.onreadystatechange = function() {
						if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
						}
					}
					xmlhttp.send(data);
				}

			});
		}
		echarts('line', 'line', 'bar', "${ctx}/showLine.do", 0);
		echarts('pie', 'pie', 'funnel', "${ctx}/showPie.do", 0);
		echarts('negativeLine', 'line', 'bar', "${ctx}/showLine.do", 3);
		echarts('negativePie', 'pie', 'funnel', "${ctx}/showPie.do", 3);

		function goPage(newURL) {
			if (newURL != "") {
				if (newURL == "-") {
					resetMenu();
				} else {
					document.location.href = newURL;
				}
			}
		}
		function resetMenu() {
			document.gomenu.selector.selectedIndex = 2;
		}

		function prints() {
			$(".echarts").css("width", "400px");
			$(".action3").css("display", "none");
			$(".editSituation").css("display", "none");
			window.print();
		}

		function updateSituation() {
			$.post("${ctx}/situation.do", {
				'situation' : document.getElementById('situation').value,
			}, function(data) {
				if (data.result == "success") {
					$("#myModal").modal("hide");
					location.reload();
				} else {
					location.reload();
				}
			}, "json");
		}

		function exported() {
			debugger;
			var radio = document.getElementsByName("muban");
			for ( var i = 0; i < radio.length; i++) {
				if (radio[i].checked) {
					document.getElementById('tempId').value = radio[i].value;
				}
			}
			$("#leadOut").modal("hide");
			return true;
		}
		function updateExplain() {
			$.post("${ctx}/explain.do", {
				'explain' : document.getElementById('explain').value,
			}, function(data) {
				if (data.result == "success") {
					$("#explainModal").modal("hide");
					location.reload();
				} else {
					location.reload();
				}
			}, "json");
		}
		
	</script>
</body>
</html>