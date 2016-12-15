<%@ page language="java" import="java.util.*,com.zbt.yqjk.pojo.PublicOpinion" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}/page"></c:set>
<!DOCTYPE html>
<%
	String sJson =request.getParameter("para");
	if(null==sJson) sJson="";
%>

<html>
 <head>
    <title>������Ϣ</title>
	<meta charset="UTF-8" />
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
	<style type="text/css">
		.align-center{margin:0 auto;width:80%;text-align:center;}
		body{
			font-size: 14px;
			font-family: "΢���ź�";
			color: #666;
		}
		table{
			border-collapse: collapse;
			table-layout: fixed;
		}
		.td{
			padding: 10px;
			overflow: hidden;
			white-space: nowrap;
			text-overflow: ellipsis;
		}
		.content{
			margin: 30px auto;
			width: 85%;
		}
		h5{
			padding: 0px 20px;
			color: cornflowerblue;
			border-bottom:solid 1px #aaa;
		}
		span{
			border-radius: 5px 5px 0 0;
			border-top:solid #aaa 1px;
			border-left:solid #aaa 1px;
			border-right:solid #aaa 1px;
			padding: 10px 20px;
			width: 5%;
			height: 30px;
			display: inline-block;
			margin-bottom: -1px;
			text-align:center; 
		}
	</style>
	<script src="${ctx}/js/jquery.js"></script>
<!-- �����ѯ  -->
	<script type="text/javascript" src="${ctx}/libs/ligerUI/js/ligerui.all.js"></script>
	<script type="text/javascript" src="${ctx}/libs/jquery.cookie.js"></script>
    <script src="${ctx}/libs/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
	<link rel="stylesheet" type="text/css" href="${ctx}/libs/ligerUI/skins/Aqua/css/ligerui-all.css" />
</head>
<body>
	<!--main-container-part-->
	<div id="content">
		<!--breadcrumbs-->
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/jsp/index.jsp" title="������ҳ" class="tip-bottom"><i
					class="icon-home"></i> ��ҳ</a>
			</div>
		</div>
		<!--End-breadcrumbs-->
		<div>
			<table align='center' width='85%' border='0' cellpadding='0' cellspacing= '0' bordercolor='#aaa'>
				<tr align="center">
					<td  class="td" id="resultTitle"></td>
				</tr>
				<tr>
					<td style="padding: 10px;" align="right"><input type="button" value="����" onclick="location.href='javascript:history.go(-1);'">
						<img src='${ctx}/img/ema.png' title='�ʼ�����'
						onclick='emafirm()' style='cursor: pointer;' /> <img
						src='${ctx}/img/pho.png' title='���ŷ���' onclick='phofirm()'
						style='cursor: pointer;' /> <img src='${ctx}/img/focus.png'
						title='�ղ�' onclick='focusfirm()' style='cursor: pointer;' /> <img
						src='${ctx}/img/del.png' title='ɾ��' onclick='deletefirm()'
						style='cursor: pointer;' /> <img src='${ctx}/img/good.png'
						title='����' onclick='goodfirm()' style='cursor: pointer;' /> <img
						src='${ctx}/img/mid.png' title='����' onclick='midfirm()'
						style='cursor: pointer;' /> <img src='${ctx}/img/bad.png'
						title='����' onclick='badfirm()' style='cursor: pointer;' /></td>
				</tr>
			</table>
		</div>
		<!-- ƴ�ӵ�HTML���� Start -->
		<div>
		<table align='center' width='85%' border='1' cellpadding='0' cellspacing= '0' bordercolor='#aaa'>
			<tr>
				<td  class="td" colspan=1 width='20%'>
					<b >��Դ��</b>
				</td>
				<td  class="td" colspan=1 width='30%' id="resultSource"></td>
				<td  class="td" colspan=1 width='20%'>
					<b >ʱ�䣺</b>
				</td>
				<td  class="td" colspan=1 width='30%' id="publishedDate"></td>
			</tr>
			
			<tr>
				<td  class="td" colspan=1 width='20%'>
				<b >���ԣ�</b>
				</td>
				<td  class="td" colspan=1 width='30%' id="keyword"></td>
				<td  class="td" colspan=1 width='20%'>
				<b >���ߣ�</b>
				</td>
				<td  class="td" colspan=1 width='30%' id="resultAuthor"></td>
			</tr>
			<tr>
				<td  class="td" colspan=1 width='20%'>
				<b >��з��ࣺ</b>
				</td>
				<td  class="td" colspan=1 width='30%' id="resultEmotion"></td>
				<td  class="td" colspan=1 width='20%'>
				<b >ԭ�����ӣ�</b>
				</td>
				<td  class="td" colspan=1 width='30%' id="resultUrl" style="WORD-WRAP: break-word">
				</td>
			</tr>
		</table>
		</div>
		
		<div class="content">
			<table align='center' width='85%' border='1' cellpadding='0' cellspacing= '0' bordercolor='#aaa'>
				<h5><span>����</span></h5>
				<p id="resultBody" style="WORD-WRAP: break-word"></p>
			</table>
		</div>
	</div>
	<!--end-main-container-part-->

	<!--Footer-part-->
	<div class="row-fluid">
		<div id="footer" class="span12">2016 &copy; ������ҩ. Copyright ���̲�
		</div>
	</div>
	<!--end-Footer-part-->
</body>
<script>
  	$(f_initGrid());
    function f_initGrid(){
		//����key��ѯ���ݿⲢ���ؽ�������
		    var resultKey = "<%=sJson%>";
		 	 //��ѯ  
		 	var urlPath="${ctx}/getPublicOpinion.do";
		        $.ajax({
					type : "POST",
					url : urlPath,
					data : {'resultKey':resultKey},
					dataType : "json",
					async : false,
					success : function(data) {
					var json = eval(data);
						document.getElementById('resultTitle').innerHTML="<h3><b>"+json.resultTitle+"</b></h3>"; 
						document.getElementById('resultSource').innerHTML=json.resultSource; 
						document.getElementById('keyword').innerHTML=json.keyword; 
						document.getElementById('resultAuthor').innerHTML=json.resultAuthor; 
						document.getElementById('resultUrl').innerHTML="<a href='"+json.resultUrl+"' target='_blank'><font  color='#162def'>"+json.resultUrl+"</font></a>"; 
						document.getElementById('resultBody').innerHTML=json.resultBody; 
						document.getElementById('publishedDate').innerHTML=json.resultRemarks1; 
						var html="";
						if (json.resultEmotion == 0){  
	                        html = "<img src='${ctx}/img/none.png' style='margin-left:20px'/> δ����";  
	                    }else if(json.resultEmotion == 1){
	                    	html = "<img src='${ctx}/img/good.png' style='margin-left:20px'/> ����"; 
	                    }else if(json.resultEmotion == 2){
	                    	html = "<img src='${ctx}/img/mid.png' style='margin-left:20px'/> ����"; 
	                    }else if(json.resultEmotion == 3){
	                    	html = "<img src='${ctx}/img/bad.png' style='margin-left:20px'/> ����"; 
	                    }  
                    						document.getElementById('resultEmotion').innerHTML=html; 
                                 
					},
					error : function(data) {
						alert("ҳ�����ʧ�ܣ�����ϵϵͳ����Ա��");
					}
				});
	}
	
	
	//��ȡ������Ϣ��Key������
	var key ="<%=sJson%>";
	//�ʼ����͵ĶԻ���
 	function emafirm(){	
	    if(key == ""){
			$.ligerDialog.warn('ϵͳ����:��ѡ�������¼��');
		}else{
			$.ligerDialog.prompt('�����ʼ�', '', false, function (yes, value){
        		if (yes){
        			emaSend(value);
        		}
    		});
		}
 	}
 	
 	//�ʼ�����
 	function emaSend(obj){
 		var email = obj;
 		var myreg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	    if(!myreg.test(email)){
			$.ligerDialog.warn('��ʾ:��������Ч��E_mail��');
		}else{
		    var urlPath = "${ctx}/emaPublic.do";
		       $.ajax({
				type : "POST",
				url : urlPath,
				data :{'keys' : key,'email':email},
				success : function(data) {
					if(data == 1){
						$.ligerDialog.success("��ϲ�㣬�ʼ��ѷ��ͳɹ�!");
						location.reload();
					}else{
						$.ligerDialog.warn("�Բ����ʼ�����ʧ�ܣ���ˢ������");
					}
				}
			}); 
	    }
 	}
 	
 	//���ŷ��͵ĶԻ���
 	function phofirm(){	
	    if(key == ""){
			$.ligerDialog.warn('ϵͳ����:��ѡ�������¼��');
		}else{
			 $.ligerDialog.prompt('���Ͷ���', '', false, function (yes, value){
       		 	if (yes){
        			phoSend(value);
        		}
   			 });
		}
 	}
 	
 	//���ŷ���
 	function phoSend(obj){
 		var phone = obj;
 		var re =  /^1([38]\d|4[57]|5[0-35-9]|7[06-8]|8[89])\d{8}$/;
	    if(!re.test(phone)){
			$.ligerDialog.warn('�ֻ�����������������д');
		}else{
			var urlPath = "${ctx}/phoPublic.do";
		       $.ajax({
				type : "POST",
				url : urlPath,
				data :{'keys' : key,'phone':phone},
				success : function(data) {
					if(data == 1){
						$.ligerDialog.success("��ϲ�㣬�����ѷ��ͳɹ���");
						location.reload();
					}else{
						$.ligerDialog.warn("�Բ��𣬶��ŷ���ʧ�ܣ���ˢ������");
					}
				}
			});
		
		}
 	}
 	
	//ɾ��ѡ��Ի���
	function deletefirm(){
	    if(key == ""){
			$.ligerDialog.warn('ϵͳ����:��ѡ�������¼��');
		}else{
		
			$.ligerDialog.confirm('��ȷ��Ҫɾ�����Ϊ: '+key+'��¼��', function (yes)
	        {
		        if(yes){
		        	var urlPath = "${ctx}/delPublic.do";
			        $.ajax({
						type : "POST",
						url : urlPath,
						data :{'keys' : key},
						success : function(data) {
							if(data == 1){
								$.ligerDialog.success("��ϲ�㣬��ɾ���ɹ���");
								location.reload();
							}else{
								$.ligerDialog.warn("�Բ���ɾ��ʧ�ܣ���ˢ������");
							}
						}
					}); 
		        }
	       	 });
	    }
 	}
 	
 	//ѡ���ղصĶԻ���
 	function focusfirm(){
	    if(key == ""){
			$.ligerDialog.warn('ϵͳ����:��ѡ�������¼��');
		}else{
			 $.ligerDialog.confirm('��ȷ��Ҫ�ղر��Ϊ: '+key+'��¼��', function (yes)
	        {
	        	if(yes){
	        		var urlPath = "${ctx}/focusPublic.do";
		      		$.ajax({
						type : "POST",
						url : urlPath,
						data :{'keys' : key},
						success : function(data) {
							if(data == 1){
								$.ligerDialog.success("��ϲ�㣬���ղسɹ���");
								location.reload();
							}else{
								$.ligerDialog.warn("�Բ����ղ�ʧ�ܣ���ˢ������");
							}
						}
					}); 
	        	}
	        	
	       });	 
	    }
 	}
 	
 	//ѡ������Ի���
	function goodfirm(){
		if(key == ""){
			$.ligerDialog.warn('ϵͳ����:��ѡ�������¼��');
		}else{		
			$.ligerDialog.confirm('��ȷ��Ҫ�����Ϊ: '+key+'�ļ�¼�༭Ϊ���������', function (yes)
	        {
	        	if(yes){
		        	var urlPath = "${ctx}/goodPublic.do";
			        $.ajax({
						type : "POST",
						url : urlPath,
						data :{'keys' : key},
						success : function(data) {
							if(data == 1){
								$.ligerDialog.success("��ϲ�㣬���޸ĳɹ���");
								location.reload();
							}else{
								$.ligerDialog.warn("�Բ����޸�ʧ�ܣ���ˢ������");
							}
						}
					}); 
			    }
	        }); 
	    }
 	}
 	
 	//ѡ�������Ի���
	function midfirm(){
		if(key == ""){
			$.ligerDialog.warn('ϵͳ����:��ѡ�������¼��');
		}else{		
			$.ligerDialog.confirm('��ȷ��Ҫ�����Ϊ: '+key+' �ļ�¼�༭Ϊ����������', function (yes)
	        {
		        if(yes){
		        	var urlPath = "${ctx}/midPublic.do";
			       	$.ajax({
						type : "POST",
						url : urlPath,
						data :{'keys' : key},
						success : function(data) {
							if(data == 1){
								$.ligerDialog.success("��ϲ�㣬���޸ĳɹ���");
								location.reload();
							}else{
								$.ligerDialog.warn("�Բ����޸�ʧ�ܣ���ˢ������");
							}
						}
					}); 
		        }
	        });
	    }
 	}
 	
 	//ѡ����Ի���
	function badfirm(){
		if(key == ""){
			$.ligerDialog.warn('ϵͳ����:��ѡ�������¼��');
		}else{		
			$.ligerDialog.confirm('��ȷ��Ҫ�����Ϊ: '+key+' �ļ�¼�༭Ϊ���������', function (yes)
	        {
		        if(yes){
			        var urlPath = "${ctx}/badPublic.do";
				    $.ajax({
						type : "POST",
						url : urlPath,
						data :{'keys' : key},
						success : function(data) {
							if(data == 1){
								$.ligerDialog.success("��ϲ�㣬���޸ĳɹ���");
								location.reload();
							}else{
								$.ligerDialog.warn("�Բ����޸�ʧ�ܣ���ˢ������");
							}
						}
					}); 
				}
	        });
	    }
 	}
 
	</script>
</html>