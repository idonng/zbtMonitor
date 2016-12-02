<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}/page"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<title>统计分析 | zbtMonitor</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/style.css" />
<link rel="stylesheet" href="${ctx}/css/media.css" />
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/jquery.ui.custom.js" type="text/javascript"
	charset="utf-8"></script>
<script src="${ctx}/js/bootstrap.min.js"></script>
<script src="${ctx}/js/jquery.flot.min.js"></script>
<script src="${ctx}/js/jquery.flot.pie.min.js"></script>
<script src="${ctx}/js/jquery.flot.resize.min.js"></script>
<script src="${ctx}/js/matrix.js"></script>
<script src="${ctx}/js/jquery.peity.min.js"></script>
<script src="${ctx}/js/bootstrap-datepicker.js" type="text/javascript"
	charset="utf-8"></script>
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
<style>
label{display: inline-block !important;margin-left: 1em;width: 5em !important;height: 2em !important;line-height: 2em !important;}
.typeKind{width: 6em !important; height: 2em !important;text-align: center !important;line-height: 2em !important; }
input.checkbox{line-height: 2em !important;}
input[type="button"]{float:right;font-size:12px !important;}
body{font-family: helvetica, "微软雅黑"; font-size:12px; color:#666;}
.container-fluid{margin-top:10px}
</style>
<script type="text/javascript" src="${ctx}/libs/ligerUI/js/ligerui.all.js"></script>
<script type="text/javascript" src="${ctx}/libs/jquery.cookie.js"></script>
<script src="${ctx}/libs/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/libs/ligerUI/skins/Aqua/css/ligerui-all.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/libs/ligerUI/skins/Gray2014/css/all.css" />
</head>
<script src="${ctx}/echarts/echarts-gkl.js"></script>
<body>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"><a href="${ctx}/jsp/index.jsp" title="返回首页" class="tip-bottom"><i class="icon-home"></i> 首页</a> </div>
  </div>
  <div class="container-fluid">
    <input type="button" name="restore" id="restore" onclick="loadData()" value="重新生成" class="btn btn-primary"/>
    <form action="">
    	<span class="label label-info typeKind">媒体类型：</span>    	
    	<label for="mediaType4"><input type="checkbox" name="mediaType" id="mediaType4" checked="checked" value="1" /> 微博</label>
    	<label for="mediaType1"><input type="checkbox" name="mediaType" id="mediaType1" checked="checked" value="2" /> 新闻</label>
    	<label for="mediaType2"><input type="checkbox" name="mediaType" id="mediaType2" checked="checked" value="3" /> 论坛</label>
    	<label for="mediaType3"><input type="checkbox" name="mediaType" id="mediaType3" checked="checked" value="4" /> 博客</label>
    	<label for="mediaType5"><input type="checkbox" name="mediaType" id="mediaType5" checked="checked" value="5" /> 微信</label>
    	
    </form>
    	
    <form action="" class="controls">
    	<span class="label label-info typeKind">起止时间：</span>
    	<label for="timeType1"><input type="radio" name="timeType" id="timeType1" checked="checked" value="当天" onclick="radioThing()"/> 当天</label>
    	<label for="timeType2"><input type="radio" name="timeType" id="timeType2" value="一周内" onclick="radioThing()"/> 一周内</label>
        <label for="custom"><input type="radio" name="timeType" id="custom" value="自定义" data-date="12-02-2016" class="input-append date datepicker" onclick="radioThing()"/>自定义</label>
    	<input type="Date" id="startDate" style="display: none;" class="kaishi"/> 
    	<input type="Date" id="endDate"  style="display: none;" class="jieshu" onblur="f_initGrid();"/>
    </form>    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-signal"></i> </span>
            <h5>总体舆情走势</h5>
          </div>
          <div class="widget-content">
            <div id="placeholder" class="echarts" ></div>            
          </div>
        </div>
      </div>
    </div>
    
    <div class="row-fluid">
      <div class="span6">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-signal"></i> </span>
            <h5>不同属性信息走势</h5>
          </div>
          <div class="widget-content">
             <div id="emoLine" style="width:100%;height:300px;"></div>         
          </div>
        </div>
      </div>
      <div class="span6">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-signal"></i> </span>
            <h5>正负面情感占比</h5>
          </div>
          <div class="widget-content">
            <div id="emoPercent" style="width:100%;height:300px;"></div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="row-fluid">
      <div class="span6">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-signal"></i> </span>
            <h5>媒体覆盖占比</h5>
          </div>
          <div class="widget-content">
            <div id="medPercent" style="width:100%;height:300px;"></div>
          </div>
        </div>
      </div>
      <div class="span6">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-signal"></i> </span>
            <h5>媒体类型分析</h5>
          </div>
          <div class="widget-content">
            <div id="mType" style="width:100%;height:300px;" ></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--Footer-part-->
<div class="row-fluid">
    <div id="footer" class="span12"> 2016 &copy; 步长制药. Copyright 电商部  </div>
</div>
	<!--end-Footer-part-->

	<!--Turning-series-chart-js-->
<script>
	var tim;
	$(CheckRedio());	
	function CheckRedio(){
		if(document.getElementsByName("timeType")[2].checked){
			$("#startDate").show();
	    	$("#endDate").show();	
	    	$("#startDate").tim(t.split("A")[0]);
	    	$("#endDate").tim(t.split("A")[1]);
		}
	}
	var t = "";	
	$(QueryAna());
	function QueryAna(){	
		var Request = new Object();
		Request = GetRequest(); 
		t = Request["t"];
		if(t!=""&&t!=null)
		{	
			if(t=="1"){
				document.getElementsByName("timeType")[1].checked=true;
			}
		}	
	}
	
	function GetRequest(){	
		var url = location.search; 
		var theRequest = new Object();
	
		if (url.indexOf("?") != -1) {
	 
			var str = url.substr(1);
			strs = str.split("&");
	  
			for(var i = 0; i < strs.length; i ++) {
				theRequest[strs[i].split("=")[0]]=decodeURI(strs[i].split("=")[1]);
	       	}
	 	}
  		return theRequest;
}
</script>
<script type="text/javascript">	
	$(loadData());
	function loadData(){
		//定义媒体类型
		var ParamTypes="";
	    var aa = document.getElementsByName("mediaType");
	    //循环判断被选中的媒体类型
        for (var i = 0; i < aa.length; i++) {
            if (aa[i].checked) {
            	if(ParamTypes == ""){
               		ParamTypes = aa[i].value;
               	}else{
               		ParamTypes = ParamTypes+"#"+aa[i].value;
               	}   
               }
        }
        //没有媒体类型被选中
        if(ParamTypes=="" || ParamTypes==null){
	    	$.ligerDialog.warn('请选择媒体类型！');
	    }	    
	    else{
		//获取时间
	    var radio=document.getElementsByName("timeType");
	    var beginToEnd = "";
	    //判断所选的时间区间
		for(var i=0;i<radio.length;i++)
		{
			if(radio[i].checked){
				beginToEnd = "";				
				if(radio[i].value == "自定义"){
					if($("#startDate").val() == "" || $("#startDate").val()==null){
						$.ligerDialog.warn('请选择开始时间！');
					}else if($("#endDate").val() == "" || $("#endDate").val()==null){
						$.ligerDialog.warn('请选择结束时间！');
					}else if($("#startDate").val() > $("#endDate").val()){
						$.ligerDialog.warn('系统警告:开始时间大于结束时间！');
					}else{					
						beginToEnd = $("#startDate").val()+"A"+$("#endDate").val();
						tim = beginToEnd;						
					}
				}else{
					beginToEnd = radio[i].value;
				}			  		
			  break;
			}
		}
		//初始化总体舆情走势echarts
		var psLineChar = echarts.init(document.getElementById('placeholder'));
 		 //查询  
		var urlPath="${ctx}/overall.do";  
		psLineChar.clear();
        //psLineChar.showLoading({text: '正在努力的读取数据中...'});
        var time = $("input[name='timeType']:checked").val();
        var value1 = ParamTypes.split("#")[0];
        var value2 = ParamTypes.split("#")[1];
        var value3 = ParamTypes.split("#")[2];
        var value4 = ParamTypes.split("#")[3];
        var value5 = ParamTypes.split("#")[4];
        //查询数据并设置折线图
        $.ajax({
			type : "POST",
			url : urlPath,
			data : {
				'timeType' : beginToEnd,				
				'mediaType1':value1,
				'mediaType2':value2,
				'mediaType3':value3,
				'mediaType4':value4,
				'mediaType5':value5				
			},			
			dataType : "json",
			success : function(data) {			
				var opt= $.parseJSON(data);
                psLineChar.setOption(opt);
                psLineChar.hideLoading();
			},
			error : function(data) {
				psLineChar.clear();
			}
		});
		//正负面折线图
 	    var emoLineChar = echarts.init(document.getElementById('emoLine'));  
 		urlPath="${ctx}/overemoline.do";    
 	 	emoLineChar.clear();
 	 	      
        var time = $("input[name='timeType']:checked").val();
        $.ajax({
			type : "POST",
			url : urlPath,
			data : {
				'timeType' : beginToEnd,				
				'mediaType1':value1,
				'mediaType2':value2,
				'mediaType3':value3,
				'mediaType4':value4,
				'mediaType5':value5				
			},
			dataType : "json",
			success : function(data) {
				var opt= $.parseJSON(data);
                emoLineChar.setOption(opt);
                emoLineChar.hideLoading();
			},
			error : function(data) {
				emoLineChar.clear();
			}
		});
		//柱状图
		var psBarChar = echarts.init(document.getElementById('mType')); 	
 	 	//查询  
 	 	urlPath="${ctx}/overbar.do";
 		 psBarChar.clear();
        //psBarChar.showLoading({text: '正在努力的读取数据中...'});
        var time = $("input[name='timeType']:checked").val();
        $.ajax({
			type : "POST",
			url : urlPath,
			data : {
				'timeType' : beginToEnd,				
				'mediaType1':value1,
				'mediaType2':value2,
				'mediaType3':value3,
				'mediaType4':value4,
				'mediaType5':value5				
			},
			dataType : "json",
			success : function(data) {
				var opt= $.parseJSON(data);
                psBarChar.setOption(opt);
                psBarChar.hideLoading();
			},
			error : function(data) {
				 psBarChar.clear();
			}
		});
		//媒体比例饼图
		var psMedPieChar = echarts.init(document.getElementById('medPercent'));
 	 	//查询  
 	    urlPath="${ctx}/overmedpie.do";
 	    psMedPieChar.clear();
        //psMedPieChar.showLoading({text: '正在努力的读取数据中...'});
        var time = $("input[name='timeType']:checked").val();
        $.ajax({
			type : "POST",
			url : urlPath,
			data : {
				'timeType' : beginToEnd,			
				'mediaType1':value1,
				'mediaType2':value2,
				'mediaType3':value3,
				'mediaType4':value4,
				'mediaType5':value5				
			},
			dataType : "json",
			success : function(data) {			
				var opt= $.parseJSON(data);
                psMedPieChar.setOption(opt);   
                             
                psMedPieChar.hideLoading();

			},
			error : function(data) {
				psMedPieChar.clear();
			}
		});
		//饼图点击事件
		psMedPieChar.on('click', function (param) {
		switch(param.dataIndex)
		{            
			case 0:   //饼1
                window.location.href = "${ctx}/jsp/browse.jsp?keywordFeature=all&m=0&e=99&t="+beginToEnd;
                break;
            case 1:  //饼2            	
                window.location.href = "${ctx}/jsp/browse.jsp?keywordFeature=all&m=1&e=99&t="+beginToEnd;
                break;
            case 2:  //饼3            	
                window.location.href = "${ctx}/jsp/browse.jsp?keywordFeature=all&m=2&e=99&t="+beginToEnd;
                break;     
			case 3:  //饼4            	
                window.location.href = "${ctx}/jsp/browse.jsp?keywordFeature=all&m=3&e=99&t="+beginToEnd;
                break;
            case 4:  //饼5            	
                window.location.href = "${ctx}/jsp/browse.jsp?keywordFeature=all&m=4&e=99&t="+beginToEnd;
                break;
            default:
                break;				
		}	
		});
		//情感比例饼图
		var psPieChar = echarts.init(document.getElementById('emoPercent'));
 	 	//查询  
 	 	urlPath="${ctx}/overpie.do";
 	 	psPieChar.clear();
        //psPieChar.showLoading({text: '正在努力的读取数据中...'});
        var time = $("input[name='timeType']:checked").val();
        $.ajax({
			type : "POST",
			url : urlPath,
			data : {
				'timeType' : beginToEnd,
				'mediaType1':value1,
				'mediaType2':value2,
				'mediaType3':value3,
				'mediaType4':value4,
				'mediaType5':value5				
			},			
			dataType : "json",			
			success : function(data) {			
				var opt= $.parseJSON(data);				
                psPieChar.setOption(opt);
                psPieChar.hideLoading();
			},
			error : function(data) {
				 psPieChar.clear();
			}
		});
		//饼图点击事件
		psPieChar.on('click', function (param)
		{
			switch(param.dataIndex)
			{ 
			/*           
				case 0:   //饼1
        	        window.location.href = "${ctx}/jsp/browse.jsp?keywordFeature=all";
       	         break;
      	          */
       	     case 1:  //饼2            	
        	    window.location.href = "${ctx}/jsp/browse.jsp?keywordFeature=all&m=99&e=1&t="+beginToEnd;
                break;
           	 case 2:  //饼3            	
                window.location.href = "${ctx}/jsp/browse.jsp?keywordFeature=all&m=99&e=2&t="+beginToEnd;
                break;     
			 case 3:  //饼4            	
                window.location.href = "${ctx}/jsp/browse.jsp?keywordFeature=all&m=99&e=3&t="+beginToEnd;
                break;
             default:
                break;				
			}	
		});
		}
}	

</script>

<script type="text/javascript">	
		function radioThing(){
		var inputs = document.getElementsByTagName('input');
	    var timeType1 = $("#timeType1");
	    var timeType2 = $("#timeType2");
	    var custom = $("#custom");
	    
	    var valueDate = "";
	    for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].type === 'radio' && inputs[i].checked) {
				valueDate = inputs[i].value;
			}
		}
	    
	   if(valueDate == timeType1.val()){
	    	$("#startDate").hide();
	    	$("#endDate").hide();	    	
	    	$("#startDate").val("");
	    	$("#endDate").val("");	    	
	    }else if(valueDate == timeType2.val()){
	    	$("#startDate").hide(); 
	    	$("#endDate").hide();  	    	    	
	    	$("#startDate").val("");
	    	$("#endDate").val("");	    	
	    }else if(valueDate == custom.val()){
	    	$("#startDate").show();
	    	$("#endDate").show();	     	
	    	$("#startDate").val("");
	    	$("#endDate").val("");
	    } 
	};	

</script>
</body>
</html>


