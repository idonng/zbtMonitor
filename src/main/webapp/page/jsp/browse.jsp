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
	label{display: inline-block !important;margin-left: 1em;width: 5em !important;height: 2em !important;}
	.typeKind{width: 6em !important; height: 2em !important;text-align: center !important;line-height: 2em !important; }
	input[type="checkbox"]{line-height: 1em !important;}
	.container-fluid{margin-top:10px}
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
  </div>
<!--End-breadcrumbs-->
<div class="container-fluid">
    	<span class="label label-info typeKind">媒体类型：</span>
    	<label for="all"><input type="checkbox" name="all" id="all" checked="checked" onClick="if(this.checked==true){checkAll('mediaType');}else{clearAll('mediaType');}"/> 全部</label>
    	<label for="mediaType-4"><input type="checkbox" name="mediaType" id="mediaType-4" value="1" class="each" onclick="ParamType()"/> 微博</label>
    	<label for="mediaType-1"><input type="checkbox" name="mediaType" id="mediaType-1" value="2" class="each" onclick="ParamType()"/> 新闻</label>
    	<label for="mediaType-2"><input type="checkbox" name="mediaType" id="mediaType-2" value="3" class="each" onclick="ParamType()"/> 论坛</label>
    	<label for="mediaType-3"><input type="checkbox" name="mediaType" id="mediaType-3" value="4" class="each" onclick="ParamType()"/> 博客</label>
    	<label for="mediaType-5"><input type="checkbox" name="mediaType" id="mediaType-5" value="5" class="each" onclick="ParamType()"/> 微信</label>
    	<br />
    	<span class="label label-info typeKind">倾向性：</span>
    	<label for="emoType1"><input type="radio" name="emoType" id="emoType1" value="10000" checked="checked" onclick="f_initGrid()" /> 全部</label>
    	<label for="emoType2"><input type="radio" name="emoType" id="emoType2" value="1" onclick="f_initGrid()"/> 正面</label>
    	<label for="emoType4"><input type="radio" name="emoType" id="emoType4" value="2" onclick="f_initGrid()"/> 中性</label>
    	<label for="emoType3"><input type="radio" name="emoType" id="emoType3" value="3" onclick="f_initGrid()"/> 负面</label>
    	<br />
    	<span class="label label-info typeKind">起止时间：</span>
    	<label for="timeType0"><input type="radio" name="timeType" id="timeType0" value="全部" checked="checked" onclick="radioThing()" /> 全部</label>
    	<label for="timeType1"><input type="radio" name="timeType" id="timeType1" value="当天" onclick="radioThing()" /> 当天</label>
    	<label for="timeType2"><input type="radio" name="timeType" id="timeType2" value="一周内" onclick="radioThing()"/> 一周内</label>
    	<label for="custom"><input type="radio" name="timeType" id="custom" value="自定义" data-date="12-02-2016" class="input-append date datepicker" onclick="radioThing()"/>自定义</label>
    	<input type="Date" id="from" style="display: none;" class="kaishi"/> 
    	<input type="Date" id="to"  style="display: none;" class="jieshu" onblur="f_initGrid();"/>
		
		<div class="widget-box">
          	<div id="maingrid4" style="margin-top:0%;" >
          	</div>
        </div>
	</div>
</div>
<!--end-main-container-part-->

<!--Footer-part-->

<div class="row-fluid">
    <div id="footer" class="span12"> 2016 &copy; 步长制药. Copyright 电商部  </div>
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
	var m = "";
	var e = "";
	var t = "";
	$(QueryAna());
	function QueryAna(){
		var Request = new Object();
		Request = GetRequest(); 
		m = Request["m"];
		e = Request["e"];
		t = Request["t"];
		if(m!=""&&m!=null)
		{
			if(m!="99")
			{
				document.getElementsByName("all")[0].checked=false;	
				var mTypes=document.getElementsByName("mediaType");			
				mTypes[m].checked=true;
			}
			if(e!="99")
			{
				var eTypes=document.getElementsByName("emoType");
				eTypes[e].checked=true;
			}		
			if(t=="全部"){
				document.getElementsByName("timeType")[0].checked=true;	
			}	
			if(t=="当天"){
				document.getElementsByName("timeType")[1].checked=true;	
			}
			if(t=="一周内"){
				document.getElementsByName("timeType")[2].checked=true;	
			}
			if(t.length>6){		
				document.getElementsByName("timeType")[3].checked=true;
				$("#from").show();
	    		$("#to").show();    	
	    		$("#from").val(t.split("A")[0]);
	    		$("#to").val(t.split("A")[1]);
			}			
		}	
	}

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
		 var timeType0 = $("#timeType0");
	    var timeType1 = $("#timeType1");
	    var timeType2 = $("#timeType2");
	    var custom = $("#custom");
	    
	    var valueDate = "";
	    for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].type === 'radio' && inputs[i].checked) {
				valueDate = inputs[i].value;
			}
		}
	    
	    if(valueDate == timeType0.val()){
	    	$("#from").hide();
	    	$("#to").hide();	    	
	    	$("#from").val("");
	    	$("#to").val("");
	    	f_initGrid();
	    }else if(valueDate == timeType1.val()){
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
	    
	     //获取感情倾向性
	    var emoTypes=document.getElementsByName("emoType");
	    var emoType = "";
		for(var i=0;i<emoTypes.length;i++){
			if(emoTypes[i].checked){			
				emoType = emoTypes[i].value;		  		
			  break;
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
						$.ligerDialog.warn('请选择开始时间！');
					}else if($("#to").val() == "" || $("#to").val()==null){
						$.ligerDialog.warn('请选择结束时间！');
					}else if($("#from").val() > $("#to").val()){
						$.ligerDialog.warn('系统警告:开始时间大于结束时间！');
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
	    	$.ligerDialog.warn('请选择媒体类型！');
	    }else{
	    	grid= $("#maingrid4").ligerGrid({
		    title:'<font color=green>欢迎查看舆情信息!</font>'
		    +'<img src=\'${ctx}/img/ema.png\' title=\'邮件发送\' onclick=\'emafirm()\' style=\'margin-left:84%;cursor: pointer;\'/>'
		    +'<img src=\'${ctx}/img/pho.png\' title=\'短信发送\' onclick=\'phofirm()\' style=\'margin-left:86%;cursor: pointer;\'/>'
		    +'<img src=\'${ctx}/img/focus.png\' title=\'收藏\' onclick=\'focusfirm()\' style=\'margin-left:88%;cursor: pointer;\'/>'
		    +'<img src=\'${ctx}/img/del.png\' title=\'删除\'  onclick=\'deletefirm()\' style=\'margin-left:90%;cursor: pointer;\'/>'
		    +'<img src=\'${ctx}/img/good.png\' title=\'正面\' onclick=\'goodfirm()\' style=\'margin-left:92%;cursor: pointer;\'/>'
		    +'<img src=\'${ctx}/img/mid.png\' title=\'中立\' onclick=\'midfirm()\' style=\'margin-left:94%;cursor: pointer;\'/>'
		    +'<img src=\'${ctx}/img/bad.png\' title=\'负面\' onclick=\'badfirm()\' style=\'margin-left:96%;cursor: pointer;\'/>',
		    checkbox: true,
		    columns: [
            { display: '编号',name: 'resultKy',width:"7%"},
            { display: '标题', name: 'resultTitle',width:"37%",align:'left'},
            { display: '作者', name: 'resultAuthor' ,width:"12%"},
            { display: '来源分类', name: 'resultType' ,width:"6%",
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
            { display: '数据来源', name: 'resultSource' ,width:"7%"},
            { display: '关键字', name: 'keyword' ,width:"9%"},
           	{ display: '发布时间', name: 'resultBody' ,width:"12%"},
            { display: '情感分类', name: 'resultEmotion' ,width:"8%",align:'left',
            	render: function (row){     //情感分类  0:未分类;(默认为0)  1:正面; 2:中立; 3:负面;
                    var html = null; 
                    if (row.resultEmotion == 0){  
                        html = "<img src='${ctx}/img/none.png' style='margin-left:20px'/> 未分类";  
                    }else if(row.resultEmotion == 1){
                    	html = "<img src='${ctx}/img/good.png' style='margin-left:20px'/> 正面"; 
                    }else if(row.resultEmotion == 2){
                    	html = "<img src='${ctx}/img/mid.png' style='margin-left:20px'/> 中立"; 
                    }else if(row.resultEmotion == 3){
                    	html = "<img src='${ctx}/img/bad.png' style='margin-left:20px'/> 负面"; 
                    }               
                  return html;    
                }    
            },       
            ],            
            parms:[{name:"ParamTypes",value:ParamTypes},{name:"emoType",value:emoType},{name:"beginToEnd",value:beginToEnd},{name:"keywordFeature",value:keywordFeature}], 
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
	
	//邮件发送的对话框？
 	function emafirm(){	
 	
	 	var key = "";
			
		for(var i=0;i<grid.getSelecteds().length;i++){
			if(i==0){
				key = grid.getSelecteds()[i].resultKy;
			}else{
				key = key +"、"+grid.getSelecteds()[i].resultKy;
			}	
		}
	    if(key == ""){
			$.ligerDialog.warn('系统警告:请选择舆情记录！');
		}else{
			$.ligerDialog.prompt('发送邮件', '', false, function (yes, value){
        		if (yes){
        			emaSend(value);
        		}
    		});
		}
 	 
 	}
 	
 	//邮件发送
 	function emaSend(obj){
 		var email = obj;
 		var myreg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
 		var key = "";
		
		for(var i=0;i<grid.getSelecteds().length;i++){
			if(i==0){
				key = grid.getSelecteds()[i].resultKy;
			}else{
				key = key +"、"+grid.getSelecteds()[i].resultKy;
			}	
		}
	    if(!myreg.test(email)){
			$.ligerDialog.warn('提示:请输入有效的E_mail！');
		}else{
		    var urlPath = "${ctx}/emaPublic.do";
		       $.ajax({
				type : "POST",
				url : urlPath,
				data :{'keys' : key,'email':email},
				success : function(data) {
					if(data == 1){
						$.ligerDialog.success("恭喜你，邮件已发送成功!");
						grid.reload();
					}else{
						$.ligerDialog.warn("对不起，邮件发送失败！请刷新再试");
					}
				}
			}); 
	    }
 	}
 	
 	//短信发送的对话框？
 	function phofirm(){	
 		var key = "";
 		
		for(var i=0;i<grid.getSelecteds().length;i++){
			if(i==0){
				key = grid.getSelecteds()[i].resultKy;
			}else{
				key = key +"、"+grid.getSelecteds()[i].resultKy;
			}	
		}
	    if(key == ""){
			$.ligerDialog.warn('系统警告:请选择舆情记录！');
		}else{
			 $.ligerDialog.prompt('发送短信', '', false, function (yes, value){
       		 	if (yes){
        			phoSend(value);
        		}
   			 });
		}
 	}
 	
 	//短信发送
 	function phoSend(obj){
 		var phone = obj;
 		var re =  /^1([38]\d|4[57]|5[0-35-9]|7[06-8]|8[89])\d{8}$/;
 		var key = "";
 		
		for(var i=0;i<grid.getSelecteds().length;i++){
			if(i==0){
				key = grid.getSelecteds()[i].resultKy;
			}else{
				key = key +"、"+grid.getSelecteds()[i].resultKy;
			}	
		}
	    if(!re.test(phone)){
			$.ligerDialog.warn('手机号码有误，请重新填写');
		}else{
			var urlPath = "${ctx}/phoPublic.do";
		       $.ajax({
				type : "POST",
				url : urlPath,
				data :{'keys' : key,'phone':phone},
				success : function(data) {
					if(data == 1){
						$.ligerDialog.success("恭喜你，短信已发送成功！");
						grid.reload();
					}else{
						$.ligerDialog.warn("对不起，短信发送失败！请刷新再试");
					}
				}
			});
		
		}
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
			$.ligerDialog.warn('系统警告:请选择舆情记录！');
		}else{
		
			$.ligerDialog.confirm('你确认要删除编号为: '+key+'记录吗？', function (yes)
	        {
		        if(yes){
		        	var urlPath = "${ctx}/delPublic.do";
			        $.ajax({
						type : "POST",
						url : urlPath,
						data :{'keys' : key},
						success : function(data) {
							if(data == 1){
								$.ligerDialog.success("恭喜你，已删除成功！");
								grid.reload();
							}else{
								$.ligerDialog.warn("对不起，删除失败！请刷新再试");
							}
						}
					}); 
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
			$.ligerDialog.warn('系统警告:请选择舆情记录！');
		}else{
			 $.ligerDialog.confirm('你确认要收藏编号为: '+key+'记录吗？', function (yes)
	        {
	        	if(yes){
	        		var urlPath = "${ctx}/focusPublic.do";
		      		$.ajax({
						type : "POST",
						url : urlPath,
						data :{'keys' : key},
						success : function(data) {
							if(data == 1){
								$.ligerDialog.success("恭喜你，已收藏成功！");
								grid.reload();
							}else{
								$.ligerDialog.warn("对不起，收藏失败！请刷新再试");
							}
						}
					}); 
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
			$.ligerDialog.warn('系统警告:请选择舆情记录！');
		}else{		
			$.ligerDialog.confirm('你确认要将编号为: '+key+'的记录编辑为正面分类吗？', function (yes)
	        {
	        	if(yes){
		        	var urlPath = "${ctx}/goodPublic.do";
			        $.ajax({
						type : "POST",
						url : urlPath,
						data :{'keys' : key},
						success : function(data) {
							if(data == 1){
								$.ligerDialog.success("恭喜你，已修改成功！");
								grid.reload();
							}else{
								$.ligerDialog.warn("对不起，修改失败！请刷新再试");
							}
						}
					}); 
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
			$.ligerDialog.warn('系统警告:请选择舆情记录！');
		}else{		
			$.ligerDialog.confirm('你确认要将编号为: '+key+' 的记录编辑为中立分类吗？', function (yes)
	        {
		        if(yes){
		        	var urlPath = "${ctx}/midPublic.do";
			       	$.ajax({
						type : "POST",
						url : urlPath,
						data :{'keys' : key},
						success : function(data) {
							if(data == 1){
								$.ligerDialog.success("恭喜你，已修改成功！");
								grid.reload();
							}else{
								$.ligerDialog.warn("对不起，修改失败！请刷新再试");
							}
						}
					}); 
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
			$.ligerDialog.warn('系统警告:请选择舆情记录！');
		}else{		
			$.ligerDialog.confirm('你确认要将编号为: '+key+' 的记录编辑为负面分类吗？', function (yes)
	        {
		        if(yes){
			        var urlPath = "${ctx}/badPublic.do";
				    $.ajax({
						type : "POST",
						url : urlPath,
						data :{'keys' : key},
						success : function(data) {
							if(data == 1){
								$.ligerDialog.success("恭喜你，已修改成功！");
								grid.reload();
							}else{
								$.ligerDialog.warn("对不起，修改失败！请刷新再试");
							}
						}
					}); 
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