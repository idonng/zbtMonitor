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
<link href="${ctx}/libs/ligerUI/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet" type="text/css" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
<style>
.msgdata {
	max-width: 200px;
	padding: 20px 20px 30px 20px;
	margin: 0 auto !important;
}
.tablediv {
	width: 100%;
	height: 300px;
}

.tablediv>table {
	align: center
}

.print {
	width: 90%;
	height: 200px;
	display: none
}

.echarts {
	max-width: 700px;
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
<script src="${ctx}/libs/ligerUI/js/core/base.js" type="text/javascript"></script>
<script src="${ctx}/libs/ligerUI/js/plugins/ligerDialog.js"
	type="text/javascript"></script>
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
				<a class="btn btn-success" onclick="showMaodel();"> <i
					class="icon-upload-alt"></i>导出</a> <a onclick="prints();"
					class="btn btn-info"><i class="icon-print"></i> 打印</a> <a href=""
					class="btn btn-danger"><i class="icon-refresh"></i> 刷新</a>
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
											<label><input type="radio" name="muban" value="${item.tempId}"
												checked />${item.tempName}</label>
											</c:when>
										<c:otherwise>
											<label><input type="radio" name="muban" value="${item.tempId}" />${item.tempName}</label>
											</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
							<div class="modal-footer">
								<form method="post"
									action="${ctx}/exportReport.do?publishedDate=${param.publishedDate}
									&type=${param.type}&endTime=${param.endTime}"
									onsubmit='return exported();'>
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
											</div></td>
										<td class="span4">
											<div class="msgdata">
												<h5>
													确认正面信息总量 <span class="badge badge-info">${sessionScope.positiveCount}</span>
												</h5>
												<p>占全部采集信息：${sessionScope.positivePercent}%</p>
												<p>每日平均量：${sessionScope.positiveAverage}</p>
											</div></td>
										<td class="span4">
											<div class="msgdata">
												<h5>
													确认负面信息总量 <span class="badge btn-danger">${sessionScope.negativeCount}</span>
												</h5>
												<p>占全部采集信息：${sessionScope.negativePercent}%</p>
												<p>每日平均量：${sessionScope.negativeAverage}</p>
											</div></td>
										<td class="span4">
											<div class="msgdata">
												<h5>
													确认中性信息总量 <span class="badge">${sessionScope.neuterCount}</span>
												</h5>
												<p>占全部采集信息：${sessionScope.neuterPercent}%</p>
												<p>每日平均量：${sessionScope.neuterAverage}</p>
											</div></td>
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
													<div id='imgLine' class="print"></div>
													<div id='line' class="echarts"></div>
												</div>
											</div></td>
										<td class="span6">
											<div class="widget-box">
												<div class="widget-content" align="CENTER">
													<div id='imgPie' class="print"></div>
													<div id='pie' class="echarts"></div>
												</div>
											</div></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!--设置打印分页-->
					<div id="print" style="display:none;page-break-after: always"></div>
					<!--row-fluid-end-->
					<div class="row-fluid">
						<div class="widget-box span12">
							<div class="widget-title">
								<span class="icon"><i class="icon-th"></i> </span>
								<h5>舆情信息统计</h5>

							</div>
							<div class="widget-content nopadding" style="overflow: auto;">
								<table class="table table-bordered data-table"style="font-weight:bold;text-align:center">
									<tr class="widget-title" style="font-weight:bold;">
											<td style="text-align:center">情感分类占比图</td>
											<td style="text-align:center">舆情信息统计表</td>
									</tr>
										<tr>
											<td class="span6">
												<div class="widget-box">
													<div class="widget-content" align="CENTER">
														<div id='emotionPie' class="echarts"></div>
														<div id='imgEmotionPie' class="print"></div>
													</div>
												</div></td>
											<td class="span6">
												<div class="widget-box">
													<div class="widget-content" align="CENTER">
														<div class="tablediv">
															<table border="1" bordercolor="#cccccc">
																<thead bgcolor="#006600">
																	<tr style="font-size:15px">
																		<th>来源</th>
																		<th>正面</th>
																		<th>中性</th>
																		<th>负面</th>
																		<th>未分类</th>
																		<th>总计</th>
																	</tr>
																</thead>
																<tbody style="font-size:10px ;">
																	<c:forEach var="templist" items="${sessionScope.table}">
																		<tr>
																			<td class="span4"
																				style="height:45px;text-align:center">${templist.type}</td>
																			<td class="span4" style="text-align:center">${templist.zm}</td>
																			<td class="span4" style="text-align:center">${templist.zx}</td>
																			<c:choose>
																				<c:when test="${templist.fm ne '0' }">
																					<td class="span4"
																						style="text-align:center;color:red">${templist.fm}</td>
																				</c:when>
																				<c:otherwise>
																					<td class="span4" style="text-align:center">${templist.fm}</td>
																				</c:otherwise>
																			</c:choose>
																			<td class="span4" style="text-align:center">${templist.wfl}</td>
																			<td class="span4"
																				style="text-align:center ;font-weight:bold">${templist.num}</td>
																		</tr>
																	</c:forEach>
																	<tr style="font-weight:bold">
																		<td class="span4" style="text-align:center">总计</td>
																		<td class="span4" style="text-align:center">${sessionScope.positiveCount}</td>
																		<td class="span4" style="text-align:center">${sessionScope.neuterCount}</td>
																		<c:choose>
																			<c:when test="${sessionScope.negativeCount ne '0' }">
																				<td class="span4"
																					style="text-align:center;color:red">${sessionScope.negativeCount}</td>
																			</c:when>
																			<c:otherwise>
																				<td class="span4" style="text-align:center">${sessionScope.negativeCount}</td>
																			</c:otherwise>
																		</c:choose>
																		<td class="span4" style="text-align:center">${sessionScope.wfl}</td>
																		<td class="span4"
																			style="text-align:center ;color:#468847">${sessionScope.count}</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div></td>
										</tr>
								</table>
							</div>
						</div>
						<!--row-fluid-end-->

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
									<tr class="widget-title" style="font-weight:bold;">
											<td style="text-align:center">采集趋势图</td>
											<td style="text-align:center">采集来源媒体类型构成图</td>
									</tr>
										<tr>
											<td class="span6">
												<div class="widget-box">
													<div class="widget-content" align="CENTER">
														<div id='negativeLine' class="echarts"></div>
														<div id='imgNegativeLine' class="print"></div>
													</div>
												</div></td>
											<td class="span6">
												<div class="widget-box">
													<div class="widget-content" align="CENTER">
														<div id='negativePie' class="echarts"></div>
														<div id='imgNegativePie' class="print"></div>
													</div>
												</div></td>
										</tr>

								</table>
							</div>
						</div>
						<!--row-fluid-end-->

					</div>

				</div>
			</div>
			<!--container-fluid-end-->
		</div>
	</div>
	<!--content-header-end-->
	</div>
	<!-- content-end-->
	<!--Footer-part-->
	<div class="row-fluid">
		<div id="footer" class="span12">2016 &copy; 步长制药. Copyright 电商部
		</div>
	</div>
	<!--end-Footer-part-->
	<script type="text/javascript">
		function echarts(div, divImg, type1, type2, url, emotion) {
			require.config({
				paths : {
					echarts : '${ctx}/echarts',
				}
			});
			require([ 'echarts', 'echarts/chart/' + type1,
					'echarts/chart/' + type2 ], function(ec) {
				var myChart = ec.init(document.getElementById(div));
				myChart.showLoading({
						effect :'whirling',
                        text : '图片加载中...',
                        textStyle : {fontSize : 20 }
                        
                    }); 
				// 为echarts对象加载数据   
				$.post(url, {
					"publishedDate" : "${param.publishedDate}",
					"type" : "${param.type}",
					"endTime" : "${param.endTime}",
					"emotion" : emotion
				}, function(data) {
					var opt = $.parseJSON(data);
					myChart.setOption(opt);
					myChart.hideLoading();
				},

				"json");
				//图表加载缓慢时隔6s保存一次图片
				//定义定时器的id
				var id= window.setInterval(exportImage, 6000);
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
							//图片保存成功后取消定时              
							window.clearInterval(id);
							//生成打印图片
							debugger;
							var imgNode = document.createElement('img');
							imgNode.setAttribute('src', '${ctx}/tempImages/'
									+ div + '.png');
							if (document.getElementById(divImg)
									.getElementsByTagName("img").length == 0) {
								document.getElementById(divImg).appendChild(
										imgNode);
							}

						}
					}
					xmlhttp.send(data);
				}
			});
		}
		echarts('line', 'imgLine', 'line', 'bar', "${ctx}/showLine.do", 0);
		echarts('pie', 'imgPie', 'pie', 'funnel', "${ctx}/showPie.do", 0);
		echarts('negativeLine', 'imgNegativeLine', 'line', 'bar',
				"${ctx}/showLine.do", 3);
		echarts('negativePie', 'imgNegativePie', 'pie', 'funnel',
				"${ctx}/showPie.do", 3);
		echarts('emotionPie', 'imgEmotionPie', 'pie', 'funnel',
				"${ctx}/showPie.do", 4);

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
			var img1 = document.getElementById("imgLine").getElementsByTagName(
					"img");
			var img2 = document.getElementById("imgPie").getElementsByTagName(
					"img");
			var img3 = document.getElementById("imgNegativeLine")
					.getElementsByTagName("img");
			var img4 = document.getElementById("imgNegativePie")
					.getElementsByTagName("img");
			var img5 = document.getElementById("imgEmotionPie")
					.getElementsByTagName("img");

			if (!(img1.length <= 0 || img2.length <= 0 || img3.length <= 0
					|| img4.length <= 0 || img5.length <= 0)) {
				$("body").css("width", "90%");
				$(".span6").css("height", "300px");
				$(".badge").removeClass("badge");
				$(".tablediv").removeClass("tablediv");
				$("#print").css("display", "block");
				$(".msgdata").removeClass("msgdata");
				$(".echarts").css("display", "none");
				$("#footer").css("display", "none");
				$(".print").css("display", "block");
				$(".action3").css("display", "none");
				$("#msg_table >thead").css("display", "none");
				$(".editSituation").css("display", "none");
				window.print();
				location.reload();
			} else {
				$.ligerDialog.waitting('正在加载图片,请稍候...');
				setTimeout(function() {
					$.ligerDialog.closeWaitting();
				}, 2000);
			}
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

		function showMaodel() {
			var img1 = document.getElementById("imgLine").getElementsByTagName(
					"img");
			var img2 = document.getElementById("imgPie").getElementsByTagName(
					"img");
			var img3 = document.getElementById("imgNegativeLine")
					.getElementsByTagName("img");
			var img4 = document.getElementById("imgNegativePie")
					.getElementsByTagName("img");
			var img5 = document.getElementById("imgEmotionPie")
					.getElementsByTagName("img");

			if (!(img1.length <= 0 || img2.length <= 0 || img3.length <= 0
					|| img4.length <= 0 || img5.length <= 0)) {
				$("#leadOut").modal("show");
			} else {
				$.ligerDialog.waitting('正在加载图片,请稍候...');
				setTimeout(function() {
					$.ligerDialog.closeWaitting();
				}, 2000);
			}
		}
		function exported() {
			var radio = document.getElementsByName("muban");
			for ( var i = 0; i < radio.length; i++) {
				if (radio[i].checked) {
					document.getElementById('tempId').value = radio[i].value;
				}
			}
			$("#leadOut").modal("hide");
			return true;
		}
	</script>
	<script>
		$('#myModal').on('shown.bs.modal', function(e) {
		}).modal('toggle');
		$('#myModal').modal("hide");
	</script>
</body>
</html>