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
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
		<script src="${ctx}/js/jquery.min.js"></script>
		</head>
		<style>
		.detail{margin-left: 15%;padding: 5px !important;}	
		</style>
    </head>
    
    <script type="text/javascript">  	
		window.onload = loadKeyword_Feature();
    	
    	//加载获取专题名称并添加到页面   (wangjing)
    	function loadKeyword_Feature(){	
    		var urlPath = "${ctx}/loadKeyword_Feature.do";
			$.ajax({
	         	type: "POST",
	          	url: urlPath,
			    dataType : "json",
	          	success: function(data){
	          		var json = eval("("+data+")");
					var left_ul = $('#left_ul');
					var appendBody ="";
					for(var i = 0;i<json.length;i++){
						appendBody = appendBody + 
		           		"<li><a onclick=\"loadBrowse('"+json[i]
		           		+"')\">"+json[i]+"</a></li>";
					}		 	
	          		left_ul.append(appendBody);
	            },
	            error: function(data){
	            	alert(data);             	
	            }
	      	});
    	}
    	
    	//点击导航栏获取对应页面以及值
    	function loadBrowse(obj){
    		 window.parent.framemain.location.href="browse.jsp?keywordFeature="+obj;
    	}
    </script>
    <body>
    	<!--sidebar-menu-->
<div id="sidebar">
  <ul >
    <li class="active"><a href="${ctx}/jsp/main.jsp" target="framemain"><i class="icon icon-home"></i> <span>首页</span></a> </li>
    <li class="submenu"> <a href="#" target="framemain"><i class="icon icon-th-list"></i> <span>舆情浏览</span></a>
      <ul id="left_ul">
      </ul>
    </li>

    <li> <a href="${ctx}/jsp/analyse.jsp" target="framemain"><i class="icon icon-inbox"></i> <span>统计分析</span></a> </li>
    <li class="submenu"><a href="" target="framemain"><i class="icon icon-th"></i> <span>舆情报告</span></a>
    	<ul>
        <li><a href="${ctx}/jsp/report.jsp" target="framemain">日报</a>
        		
        		<a href="" class="detail">今天</a>
        	  <a href="" class="detail">昨天</a>
        	  <a href="" class="detail">前天</a>
        		
        </li>	
        <li><a href="">周报</a>
        	<a href="" class="detail">本周</a>
        	  <a href="" class="detail">上周</a>
        </li>
        <li><a href="">月报</a>
        	<a href="" class="detail">本月</a>
        	  <a href="" class="detail">上月</a>
        </li>
        <li><a href="">自定义时间</a></li>
      </ul>
    </li>
    <li><a href="${ctx}/jsp/concern.jsp" target="framemain"><i class="icon icon-fullscreen"></i> <span>我的关注</span></a></li>
  </ul>
</div>
<!--sidebar-menu-->


<script src="${ctx}/js/excanvas.min.js"></script> 
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
</html>