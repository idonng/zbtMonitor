<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>测试</title>
  </head>
  
  <body>
    ${user.userName}
  </body>
  <script type="text/javascript">
  testajax();
  function testajax(){
  
  $.ajax({
  	url:"user/showUser1",
  	data:{id:1},
  	datatype:"json",
  	success: function(msg){
  	alert(mag);
  	}
  });
  
  }
  
  </script>
  
</html>
