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
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
		<style>
		.msgdata{padding: 20px 40px 30px 20px;margin: 0 auto !important;}
		.msgdata h5{padding-bottom: 20px;}
		.msgdata h5 span{margin-left: 50px;font-size: 40px;width: 47px !important; height: 50px !important;line-height: 47px;}
		textarea{min-width: 97%;min-height:100%;resize:none;}
		.action3{float: right;margin-top: -22px;}
		</style>	
    
    </head>
		
    <body>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="${ctx}/jsp/index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 首页</a> </div>
    <h1>舆情报告</h1>
</div>

  
<div class="container-fluid">
  	<hr />
  <p class="action3">
  <a href="" class="btn btn-success"><i class="icon-upload-alt"></i> 导出</a>
  <a href="" class="btn btn-info"><i class="icon-print"></i> 打印</a>
  <a href="" class="btn btn-danger"><i class="icon-refresh"></i> 刷新</a>
  </p>
  <div class="row-fluid">
      <div class="span12">
      
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-list"></i> </span>
            <h5>舆情概况 &nbsp;&nbsp;&nbsp;</h5>
          </div>
          <div class="widget-content"> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&nbsp;&nbsp;&nbsp; <a href="" class="" data-toggle="modal" data-target="#myModal"><i class="icon-edit"></i>编辑</a> </div>
        </div>
      </div>
  </div> <!--row-fluid-end-->
  
  <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      
      <div class="modal-body">
        <textarea name="" id="" cols="30" rows="10"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</div>
  
  	
  	<div class="row-fluid">
		<div class="widget-box span12">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>数据概况</h5>

          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table" id="msg_table">
              <thead>
                <tr>
                  <th>采集信息总量</th>
                  <th>确认正面信息总量</th>
                  <th>确认负面信息总量</th>
                </tr>
              </thead>
              <tbody>
              	
                <tr >
                	<td class="span4">
	                	<div class="msgdata">
		                	<h5>采集信息总量 <span class="badge badge-success">50</span></h5>
		                	<p>占全部采集信息：100%</p>
		                	<p>每日平均量：46</p>
	                	</div>
                	</td>
                	<td class="span4">
                		<div class="msgdata">
		                	<h5>确认正面信息总量 <span class="badge badge-info">50</span></h5>
		                	<p>占全部采集信息：100%</p>
		                	<p>每日平均量：46</p>
	                	</div>
                	</td>
                	<td class="span4">
                		<div class="msgdata">
		                	<h5>确认负面信息总量 <span class="badge badge-important">50</span></h5>
		                	<p>占全部采集信息：100%</p>
		                	<p>每日平均量：46</p>
	                	</div>
                	</td>
                </tr>
                
              </tbody>
            </table>
          </div>
       	</div> <!--row-fluid-end-->
  	
  <div class="row-fluid">
		<div class="widget-box span12">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>总体舆情统计</h5>

          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>采集趋势图</th>
                  <th>采集来源媒体类型构成图</th>
                </tr>
              </thead>
              <tbody>
              	
                <tr >
                	<td class="span6">
	                	<div class="widget-box">
				         
				          <div class="widget-content">
				            <div class="pie"></div>
				          </div>
				        </div>
                	</td>
                	<td class="span6">
                		<div class="widget-box">
				          
				          <div class="widget-content">
				            <div class="pie"></div>
				          </div>
				        </div>
                	</td>
                	
                </tr>
                
              </tbody>
            </table>
          </div>
       	</div> <!--row-fluid-end-->
       	
       	<div class="row-fluid">
		<div class="widget-box span12">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>负面舆情统计</h5>

          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>采集趋势图</th>
                  <th>采集来源媒体类型构成图</th>
                </tr>
              </thead>
              <tbody>
              	
                <tr >
                	<td class="span6">
	                	<div class="widget-box">
				          
				          <div class="widget-content">
				            <div class="pie"></div>
				          </div>
				        </div>
                	</td>
                	<td class="span6">
                		<div class="widget-box">
				          
				          <div class="widget-content">
				            <div class="pie"></div>
				          </div>
				        </div>
                	</td>
                	
                </tr>
                
              </tbody>
            </table>
          </div>
       	</div> <!--row-fluid-end-->
  </div></div>  
</div> <!--container-fluid-end-->
</div> <!--content-header-end-->
</div> <!-- content-end-->
<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2016 &copy; 步长制药. Copyright <a href="index.jsp">电商部</a> </div>
</div>
<!--end-Footer-part-->
 	
 
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

<script type="text/javascript">
  function goPage (newURL) {
      if (newURL != "") {
          if (newURL == "-" ) {
              resetMenu();            
          }            
          else {  
            document.location.href = newURL;
          }
      }
  }
function resetMenu() {
   document.gomenu.selector.selectedIndex = 2;
}</script>
</body>
</html>