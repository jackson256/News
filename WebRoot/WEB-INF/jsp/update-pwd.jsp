<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/manage-css/add-css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/manage-css/add-css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/manage-css/add-css/style.css" />
 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <style type="text/css">
        body {
        	 margin: auto;
       		 font-size: 20px;
       		 padding-top:50px;
        	 padding-left:200px;
             padding-bottom: 40px;
             background-color:#e9e7ef;
             font-size:17px;
        }
        
    </style>
    <script src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$("input:last").click(function(){
    				if($("[name=rpassword]").val().length>4&&$("[name=rpassword]").val().length<11){
    					$.post("update1",
				{"password":$("input:eq(0)").val(),
				"rpassword":$("input:eq(1)").val(),
				"rrpassword":$("input:eq(2)").val()
				},function(data){
					if(data==true){
						alert("修改成功");
						location.reload();
					}else{
						alert("密码错误或新密码不相同");
					}
				});
    		
    				}else{
    					alert("密码不得低于4位或高于11位");
    				}
				});
    	});
    </script>
  </head>
  
  <body>
  <table style="height: 199px; width: 306px;">
  <tr>
   	<td>原密码:</td><td> <input type="password" name="password" value="~~~~~~~~~~~~"></td>
  </tr>
  <tr>
   	<td>新密码:</td><td><input type="password" name="rpassword"></td>
   	</tr>
   	<tr>
   	<td>确认新密码:</td><td><input type="password" name="rrpassword"></td>
   	</tr>
   	<tr>
   	<td colspan="2" style="text-align: center;"><input type="button" class="btn btn-primary" value="提交"></td>
   	
   	</tr>
   </table>
  </body>
</html>
