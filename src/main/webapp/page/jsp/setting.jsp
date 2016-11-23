<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}/page"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<title>专题设置 | zbtMonitor</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/fullcalendar.css" />
<link rel="stylesheet" href="${ctx}/css/style.css" />
<link rel="stylesheet" href="${ctx}/css/media.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="${ctx}/css/jquery.gritter.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>

<script src="${ctx}/js/excanvas.min.js"></script> 
<script src="${ctx}/js/jquery.min.js"></script> 
<script src="${ctx}/js/jquery.ui.custom.js"></script> 
<script src="${ctx}/js/bootstrap.min.js"></script> 
<script src="${ctx}/js/jquery.flot.min.js"></script> 
<script src="${ctx}/js/jquery.flot.resize.min.js"></script> 
<script src="${ctx}/js/jquery.peity.min.js"></script> 
<script src="${ctx}/js/fullcalendar.min.js"></script> 
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
<style type="text/css">
	@-moz-document url-prefix() {   /*针对 Firefox 的 hack 代码*/
  fieldset { display: table-cell; }
}
	thead th{padding: 15px !important;}
	thead th:first-child{width: 10%;}
	thead th:nth-child(2){width: 20%;}
	thead th:last-child{width: 20%;}
	tbody td:first-child{text-align: center;}
	tbody td:nth-child(2){text-align: center;}
	tbody td:nth-child(3){margin-left: 15px !important;}
	tbody td:last-child{text-align: center;}
	tbody td{padding: 25px 30px 15px 30px !important;vertical-align: middle;}
	.add{margin: 3px 3px;}
	.keyword{min-width: 95.5%;}
	#themename{margin-bottom: 10px;}
	
	#content{width: 88%;float: right;}
</style>

	</head>
	<body> 
<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">舆情监控平台</a></h1>
</div>
<!--close-Header-part--> 


<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">欢迎  ${user.userName}</span><b class="caret"></b></a>
      <!-- <ul class="dropdown-menu">
        <li><a href="#"><i class="icon-user"></i> My Profile</a></li>
        <li class="divider"></li>
        <li><a href="#"><i class="icon-check"></i> My Tasks</a></li>
        <li class="divider"></li>
        <li><a href="login.jsp"><i class="icon-key"></i> Log Out</a></li>
      </ul> -->
    </li>
  <!--   <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">信息</span> <span class="label label-important">5</span> <b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> new message</a></li>
        <li class="divider"></li>
        <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> inbox</a></li>
        <li class="divider"></li>
        <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> outbox</a></li>
        <li class="divider"></li>
        <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> trash</a></li>
      </ul>
    </li> -->
    <li class=""><a title="" href="${ctx}/jsp/setting.jsp"><i class="icon icon-cog"></i> <span class="text">设置</span></a></li>
    <li class=""><a title="" href="${ctx}/login.jsp"><i class="icon icon-share-alt"></i> <span class="text">退出</span></a></li>
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
  <ul>
    <li class="active"><a href="setting.jsp"> <span>专题设置</span></a> </li>
    <li class="submenu"> <a href="usermsg.jsp"><i class="icon icon-user"></i> <span>用户信息</span></a></li>
    <li> <a href="pwd.jsp"><i class="icon icon-key"></i> <span>密码设置</span></a> </li>
    <li > <a href="sample.jsp"><i class="icon icon-paste"></i> <span>模板设置</span></a> </li>
  </ul>
</div>
<!--sidebar-menu-->
<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.jsp" title="返回首页" class="tip-bottom"><i class="icon-home"></i> 首页</a></div>
  	<h1>专题设置</h1>
  </div>
<!--End-breadcrumbs-->
<!--theme-table-->
	<div class="container-fluid">
		
		<hr />
		
		<div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>专题设置</h5>
            
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-info btn-xs fr add" data-toggle="modal" data-target="#addmyModal" >
				  添加
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
				        <h4 class="modal-title" id="myModalLabel">专题设置</h4>
				      </div>
				      <div class="modal-body">
				        <form class="form-horizontal" role="form">
				        	<label for="themename">专题名称：</label>
				        	<input type="text" id="themename" value="" class="keyword" readOnly="true"/>
				        	
				        	<br />
				        	<label for="keyword">关键词：<span class="label label-warning keytip">关键词用空格隔开</span></label>
				        	<textarea class="form-control keyword tip-top" rows="4" id="keyword" value=""></textarea>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="button" class="btn btn-primary" id="addtr" onclick="update();">保存</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				<!-- Modal -->
				<div class="modal fade" id="addmyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
				        <h4 class="modal-title" id="myModalLabel">专题设置</h4>
				      </div>
				      <div class="modal-body">
				        <form class="form-horizontal" role="form">
				        	<label for="themename">专题名称：</label>
				        	<input type="text" id="addthemename" value="" class="keyword"/>
				        	
				        	<br />
				        	<label for="keyword">关键词：<span class="label label-warning keytip">关键词用空格隔开</span></label>
				        	<textarea class="form-control keyword tip-top" rows="4" id="addkeyword" value=""></textarea>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="button" class="btn btn-primary" id="addtr1" onclick="add();">保存</button>
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
                  <th>专题名称</th>
                  <th>关键词</th>
                  <th>功能</th>
                </tr>
              </thead>
              <tbody id="tbody">
              	
                
                 <div class="modal fade" id="myDel">
			         <div class="modal-dialog">
			            <div class="modal-content">
			               <div class="modal-header">
			                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			                      <h4 class="modal-title">确认操作</h4>
			                  </div>
			                  <div class="modal-body">
			                      <h5 class="text-danger">确定要删除专题?</h5>
			                 </div>
			                 <div class="modal-footer">
			                    <input type="hidden" id="hidd">
			                     <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			                     <button type="button" class="btn btn-danger" value="deleteAlone" onclick="deleteRow()">确认删除</button>
			                 </div>
			             </div><!-- /.modal-content -->
			         </div><!-- /.modal-dialog -->
			 </div><!-- /.modal -->
			 <!--删除操作modal 上-->
              </tbody>
            </table>
          </div>
       </div>
       
</div>
</div>

<!--End-theme-table-->

 <!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2016 &copy; 步长制药. Copyright <a href="index.jsp">电商部</a> </div>
</div>


<!--end-Footer-part-->
 
<script type="text/javascript">
selectKeyword();
function selectKeyword() {
		var urlPath = "${ctx}/selectKeyword.do";
		$.ajax({
			type : "POST",
			url : urlPath,
			dataType : "json",
			async : false,
			success : function(data) {
			var json=eval("("+data+")")
			var str='';
			
			for(var i=0;i<json.length;i++){
			 //alert(json[i].key+"    "+json[i].value);
			 str+="<tr>"
			 +"<td>"+(i+1)+"</td>"
			 +"<td><span class='keyword' onclick='editRow("+(i+1)+")' id=k"+(i+1)+"  name="+json[i].key+">"+json[i].key+"</span></td>"
			 +"<td id=keywords"+(i+1)+" onclick='editRow("+(i+1)+")'><span  id=v"+(i+1)+"  name="+json[i].value+">"+json[i].value+"</span></td>"
             +"<td><a onclick='showMsg("+(i+1)+")' class=\"delmsg btn btn-link\" data-toggle=\"modal\" aria-hidden=\"true\" id=\"delete-row\">删除</a></td>"  
             +"</tr>"
			}
			$('#tbody').html(str);
			},
			error : function(data) {
				//alert(data);
			}
		});
	}
     </script>
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

 function deleteRow(){
 	var key = $("#hidd").val();
    $("#myDel").modal("hide");
    var kname =$("#k"+key).attr("name");   
		var urlPath = "${ctx}/deleteKeyword.do";
		$.ajax({
			type : "POST",
			url : urlPath,
			data : {
				'KeywordFeature' : kname,
			},
			dataType : "json",
			success : function(data) {
				if (data=="1") {
					alert("删除成功!");
				} else {
					alert("删除失败!");
				}
			},
			error : function(data) {
				alert("删除失败!");
			}
		}); 
        location.reload();  
   }      
   
   function showMsg(key){
   	$("#myDel").modal("show");
   	$("#hidd").val(key);
   }  
   
   var  vname;                
	function editRow(key) {
		$("#myModal").modal("show");
	
		var kname =$("#k"+key).attr("name");
		$("#themename").val(kname);
		  vname =$("#keywords"+key).text();
		$("#keyword").val(vname);
		}
		
	function update(){
	$("#myModal").modal("hide");
	  var kname =document.getElementById('themename').value;
	  var keyword=document.getElementById('keyword').value;
	  if(vname==keyword){
	  return;
	  }
	  var urlPath = "${ctx}/updateKeyword.do";
		$.ajax({
			type : "POST",
			url : urlPath,
			data : {
				'KeywordFeature' : kname,
				'KeywordName' : keyword,
			},
			dataType : "json",
			async : false,
			success : function(data) {
				if (data=="0") {
					alert("关键词已存在!");
					location.reload();   
				}
				else if(data=="1"){
					alert("更新成功!");
					location.reload(); 
				} 
				else {
					alert("更新失败!");
					location.reload(); 
				}
			} 
		}); 
	}
	
function add(){
	$("#addmyModal").modal("hide");
	  var kname =document.getElementById('addthemename').value;
	  var keyword=document.getElementById('addkeyword').value;
	  if(vname==keyword){
	  return;
	  }
	  var urlPath = "${ctx}/addKeyword.do";
		$.ajax({
			type : "POST",
			url : urlPath,
			data : {
				'KeywordFeature' : kname,
				'KeywordName' : keyword,
			},
			dataType : "json",
			async : false,
			success : function(data) {
				if (data=="1") {
					alert("主题已存在！");
					location.reload();   
				}
				else if (data=="2") {
					alert("更新成功!");
					location.reload();   
				} else {
					alert("更新失败!");
					location.reload(); 
				}
			} 
		}); 
	}
</script>

	</body>
</html>
