<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}/page"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<title>舆情浏览 | zbtMonitor</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="http://apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<link rel="stylesheet" href="${ctx}/css/uniform.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/select2.css"/>
<link rel="stylesheet" href="${ctx}/css/fullcalendar.css" />
<link rel="stylesheet" href="${ctx}/css/style.css" />
<link rel="stylesheet" href="${ctx}/css/media.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="${ctx}/css/jquery.gritter.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
<style>
	label{display: inline-block !important;margin-left: 1em;width: 5em !important;height: 2em !important;line-height: 2em !important;}
	.typeKind{width: 6em !important; height: 2em !important;text-align: center !important;line-height: 2em !important; }
	input.checkbox{line-height: 2em !important;}
	#footer{background:#2e363f;}
</style>
<script src="${ctx}/js/jquery.js"></script> 
<!-- 表格查询  -->
	<script type="text/javascript" src="${ctx}/libs/ligerUI/js/ligerui.all.js"></script>
	<script type="text/javascript" src="${ctx}/libs/jquery.cookie.js"></script>
    <script src="${ctx}/libs/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
	
	<link rel="stylesheet" type="text/css" href="${ctx}/libs/ligerUI/skins/Aqua/css/ligerui-all.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/libs/ligerUI/skins/Gray2014/css/all.css" />
</head>
<body>

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="${ctx}/jsp/index.jsp" title="返回首页" class="tip-bottom"><i class="icon-home"></i> 首页</a></div>
  <h1>舆情浏览</h1>
  </div>
<!--End-breadcrumbs-->
<div class="container-fluid">

      	<hr />
    	<span class="label label-info typeKind">媒体类型：</span>
    	<label for="all"><input type="checkbox" name="all" id="all" checked="checked" onClick="if(this.checked==true){checkAll('mediaType');}else{clearAll('mediaType');}"/> 全部</label>
    	<label for="mediaType-1"><input type="checkbox" name="mediaType" id="mediaType-1" value="2" class="each" onclick="ParamType()"/> 新闻</label>
    	<label for="mediaType-2"><input type="checkbox" name="mediaType" id="mediaType-2" value="3" class="each" onclick="ParamType()"/> 论坛</label>
    	<label for="mediaType-3"><input type="checkbox" name="mediaType" id="mediaType-3" value="4" class="each" onclick="ParamType()"/> 博客</label>
    	<label for="mediaType-4"><input type="checkbox" name="mediaType" id="mediaType-4" value="1" class="each" onclick="ParamType()"/> 微博</label>
    	<label for="mediaType-5"><input type="checkbox" name="mediaType" id="mediaType-5" value="5" class="each" onclick="ParamType()"/> 微信</label>
    	<br /><br />
    	<span class="label label-info typeKind">起止时间：</span>
    	<label for="timeType1"><input type="radio" name="timeType" id="timeType1" value="当天" checked="checked" onclick="radioThing()" /> 当天</label>
    	<label for="timeType2"><input type="radio" name="timeType" id="timeType2" value="一周内" onclick="radioThing()"/> 一周内</label>
    	<label for="custom"><input type="radio" name="timeType" id="custom" value="自定义" data-date="12-02-2016" class="input-append date datepicker" onclick="radioThing()"/>自定义</label>
    	<input type="Date" id="from" style="display: none;" class="kaishi"/> 
    	<input type="Date" id="to"  style="display: none;" class="jieshu" onblur="f_initGrid();"/>
		<a data-toggle="modal" data-target="#send" ><img src="${ctx}/img/ema.png" style="margin-left: 200px;" title="邮件发送"/></a>
		<img src="${ctx}/img/pho.png" style="margin-left: 10px;" title="短信发送"/>
		<img src="${ctx}/img/focus.png" style="margin-left: 10px;" title="收藏" onclick="focusfirm()"/>
		<img src="${ctx}/img/del.png" style="margin-left: 10px;" title="删除" onclick="deletefirm();"/>
		<img src="${ctx}/img/good.png" style="margin-left: 10px;" title="正面" onclick="goodfirm();"/>
		<img src="${ctx}/img/mid.png" style="margin-left: 10px;" title="中立" onclick="midfirm();"/>
		<img src="${ctx}/img/bad.png" style="margin-left: 10px;" title="负面" onclick="badfirm();"/>
		
		<div class="widget-box">
          	<div id="maingrid4" style="margin-top:0%;" >
          	
          	</div>
        </div>
</div>



<div class="modal fade" id="send" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">邮件转发</h4>
      </div>
      <div class="modal-body">
        <input type="email" id="email" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary">转发</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="text" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">短信转发</h4>
      </div>
      <div class="modal-body">
        <input type="text" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary">转发</button>
      </div>
    </div>
  </div>
</div>
</div>
<!--end-main-container-part-->

<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12"> 2016 &copy; 步长制药. Copyright <a href="index.jsp">电商部</a> </div>
</div>

<!--end-Footer-part-->
</body>
<script src="${ctx}/js/jquery.ui.custom.js"></script> 
<script src="${ctx}/js/bootstrap.min.js"></script> 
<script src="${ctx}/js/jquery.uniform.js"></script> 
<script src="${ctx}/js/select2.min.js"></script> 
<script src="${ctx}/js/jquery.dataTables.min.js"></script> 
<script src="${ctx}/js/matrix.js"></script> 
<script src="${ctx}/js/tables.js"></script>
<script src="http://apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script>
	function checkAll(name) { 
		var el = document.getElementsByTagName('input'); 
		var len = el.length; 
		for(var i=0; i<len; i++){ 
			if((el[i].type=="checkbox") && (el[i].name==name)){ 
				el[i].checked = true; 
			} 
		} 
		f_initGrid();
	} 
	
	function clearAll(name) { 
		var el = document.getElementsByTagName('input'); 
		var len = el.length; 
		for(var i=0; i<len; i++){ 
			if((el[i].type=="checkbox") && (el[i].name==name)){ 
				el[i].checked = false; 
			} 
		} 
		f_initGrid();	
	} 
	
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
	    	$("#from").hide();
	    	$("#to").hide();	    	
	    	$("#from").val("");
	    	$("#to").val("");
	    	f_initGrid();
	    }else if(valueDate == timeType2.val()){
	    	$("#from").hide(); 
	    	$("#to").hide();  	    	    	
	    	$("#from").val("");
	    	$("#to").val("");
	    	f_initGrid();
	    }else if(valueDate == custom.val()){
	    	$("#from").show();
	    	$("#to").show();	     	
	    	$("#from").val("");
	    	$("#to").val("");
	    } 
	};
	
	//获取专题名称，拼装url
	var Request = new Object();
	Request = GetRequest(); 
	var keywordFeature = Request["keywordFeature"];
	var urlPath = "${ctx}/keywordFeature.do";
	var grid;
	
	$(f_initGrid());
    function f_initGrid(){
    	
    	//获取数据来源分类  1：微博  2：新闻   3：论坛  4：博客  5：微信 
    	var ParamTypes =""; 
	    if(document.getElementsByName("all")[0].checked){	    
	    	ParamTypes = "1#2#3#4#5";
	    }else{
	    	var aa = document.getElementsByName("mediaType");
            for (var i = 0; i < aa.length; i++) {
                if (aa[i].checked) {
                	if(ParamTypes == ""){
                		ParamTypes = aa[i].value;
                	}else{
                		ParamTypes = ParamTypes+"#"+aa[i].value;
                	}   
                }
            }
	    } 
	    
	    //获取时间
	    var radio=document.getElementsByName("timeType");
	    var beginToEnd = "";
		for(var i=0;i<radio.length;i++){
			if(radio[i].checked){
				beginToEnd = "";
				if(radio[i].value == "自定义"){
					if($("#from").val() == "" || $("#from").val()==null){
						alert('请选择开始时间！');
					}else if($("#to").val() == "" || $("#to").val()==null){
						alert('请选择结束时间！');
					}else if($("#from").val() > $("#to").val()){
						alert('系统警告:开始时间大于结束时间！');
					}else{					
						beginToEnd = $("#from").val()+"#"+$("#to").val();
					}
				}else{
					beginToEnd = radio[i].value;
				}			  		
			  break;
			}
		}
 
 		//当没有选择分类时，不执行查询！
	    if(ParamTypes=="" || ParamTypes==null){
	    	alert('请选择媒体类型！');
	    }else{
	    	grid= $("#maingrid4").ligerGrid({
		    title:'<font color=green>欢迎查看舆情信息!</font>',
		    checkbox: true,
		    columns: [
		   	
            { display: '编号',name: 'resultKy',width:85},
            { display: '标题', name: 'resultTitle',width:525,align: 'left'},
            { display: '作者', name: 'resultAuthor' ,width:160},
            { display: '来源分类', name: 'resultType' ,width:90,
            	 render: function (row)   
                {     //数据来源分类  1：微博  2：新闻   3：论坛  4：博客  5：微信
                    var html = null; 
                    if (row.resultType == 1){  
                        html = "微博";  
                    }else if(row.resultType == 2){
                    	html = "新闻"; 
                    }else if(row.resultType == 3){
                    	html = "论坛"; 
                    }else if(row.resultType == 4){
                    	html = "博客"; 
                    }else if(row.resultType == 5){
                    	html = "微信"; 
                    }else {
                    	html = "未知来源"; 
                    }  
                  return html;    
                }    
            },
            { display: '数据来源', name: 'resultSource' ,width:100},
            { display: '关键字', name: 'keyword' ,width:90},
           	{ display: '发布时间', name: 'resultBody' ,width:160},
            { display: '情感分类', name: 'resultEmotion' ,width:100,
            	render: function (row){     //情感分类  0:未分类;(默认为0)  1:正面; 2:中立; 3:负面;
                    var html = null; 
                    if (row.resultEmotion == 0){  
                        html = "<img src='${ctx}/img/none.png'/> 未分类";  
                    }else if(row.resultEmotion == 1){
                    	html = "<img src='${ctx}/img/good.png'/> 正面"; 
                    }else if(row.resultEmotion == 2){
                    	html = "<img src='${ctx}/img/mid.png'/> 中立"; 
                    }else if(row.resultEmotion == 3){
                    	html = "<img src='${ctx}/img/bad.png'/> 负面"; 
                    }               
                  return html;    
                }    
            },       
            ],            
            parms:[{name:"ParamTypes",value:ParamTypes},{name:"beginToEnd",value:beginToEnd},{name:"keywordFeature",value:keywordFeature}], 
            url : urlPath,
            pageParmName :"currentPage",
            pagesizeParmName:"rowSize",
            pageSize:10,
            record : "total",
            root :"list",
            width:"100%",
            height:"85%",
        });
	    
	    }  		
   }
    
	function ParamType(){	
		$("#all").attr("checked",false);	
		f_initGrid();      
	}
	
	//删除选择对话框？
	function deletefirm(){
	 	var key = "";
		for(var i=0;i<grid.getSelecteds().length;i++){
			if(i==0){
				key = grid.getSelecteds()[i].resultKy;
			}else{
				key = key +"、"+grid.getSelecteds()[i].resultKy;
			}	
		}
	    if(key == ""){
			alert('系统警告:请选择舆情记录！');
		}else if(confirm("你确认要删除编号为: "+key+" 记录吗？")){
		    var urlPath = "${ctx}/delPublic.do";
		       $.ajax({
				type : "POST",
				url : urlPath,
				data :{'keys' : key},
				success : function(data) {
					if(data == 1){
						alert("恭喜你，已删除成功！");
						location.reload();
					}else{
						alert("对不起，删除失败！请刷新再试");
					}
				}
			}); 
	    }
 	}
 	
 	//选择收藏的对话框？
 	function focusfirm(){
 		var key = "";
		for(var i=0;i<grid.getSelecteds().length;i++){
			if(i==0){
				key = grid.getSelecteds()[i].resultKy;
			}else{
				key = key +"、"+grid.getSelecteds()[i].resultKy;
			}	
		}
	    if(key == ""){
			alert('系统警告:请选择舆情记录！');
		}else if(confirm("你确认要收藏编号为: "+key+" 记录吗？")){
		    var urlPath = "${ctx}/focusPublic.do";
		       $.ajax({
				type : "POST",
				url : urlPath,
				data :{'keys' : key},
				success : function(data) {
					if(data == 1){
						alert("恭喜你，已收藏成功！");
						location.reload();
					}else{
						alert("对不起，收藏失败！请刷新再试");
					}
				}
			}); 
	    }
 	}
 	
 	//选择正面对话框？
	function goodfirm(){
	 	var key = "";
		for(var i=0;i<grid.getSelecteds().length;i++){
			if(i==0){
				key = grid.getSelecteds()[i].resultKy;
			}else{
				key = key +"、"+grid.getSelecteds()[i].resultKy;
			}	
		}
		if(key == ""){
			alert('系统警告:请选择舆情记录！');
		}else if(confirm("你确认要将编号为: "+key+" 的记录编辑为正面分类吗？")){
		    var urlPath = "${ctx}/goodPublic.do";
		       $.ajax({
				type : "POST",
				url : urlPath,
				data :{'keys' : key},
				success : function(data) {
					if(data == 1){
						alert("恭喜你，已修改成功！");
						location.reload();
					}else{
						alert("对不起，修改失败！请刷新再试");
					}
				}
			}); 
	    }
 	}
 	
 	//选择中立对话框？
	function midfirm(){
	 	var key = "";
		for(var i=0;i<grid.getSelecteds().length;i++){
			if(i==0){
				key = grid.getSelecteds()[i].resultKy;
			}else{
				key = key +"、"+grid.getSelecteds()[i].resultKy;
			}	
		}
		if(key == ""){
			alert('系统警告:请选择舆情记录！');
		}else if(confirm("你确认要将编号为: "+key+" 的记录编辑为中立分类吗？")){
		    var urlPath = "${ctx}/midPublic.do";
		       $.ajax({
				type : "POST",
				url : urlPath,
				data :{'keys' : key},
				success : function(data) {
					if(data == 1){
						alert("恭喜你，已修改成功！");
						location.reload();
					}else{
						alert("对不起，修改失败！请刷新再试");
					}
				}
			}); 
	    }
 	}
 	
 	//选择负面对话框？
	function badfirm(){
	 	var key = "";
		for(var i=0;i<grid.getSelecteds().length;i++){
			if(i==0){
				key = grid.getSelecteds()[i].resultKy;
			}else{
				key = key +"、"+grid.getSelecteds()[i].resultKy;
			}	
		}
		
		if(key == ""){
			alert('系统警告:请选择舆情记录！');
		}else if(confirm("你确认要将编号为: "+key+" 的记录编辑为负面分类吗")){
		    var urlPath = "${ctx}/badPublic.do";
		       $.ajax({
				type : "POST",
				url : urlPath,
				data :{'keys' : key},
				success : function(data) {
					if(data == 1){
						alert("恭喜你，已修改成功！");
						location.reload();
					}else{
						alert("对不起，修改失败！请刷新再试");
					}
				}
			}); 
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
</html>