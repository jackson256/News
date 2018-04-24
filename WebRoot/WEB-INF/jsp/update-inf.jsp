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
    	var reg_email=/[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/;
    	var reg_tel=/^[0-9]{11}$/;
    		$("input:last").click(function(){
    		if(reg_email.test($("input:eq(0)").val())&&(reg_tel.test($("input:eq(1)").val())||$("input:eq(1)").val()=="")){
    				$.post("update_inf",
				{"email":$("input:eq(0)").val(),
				"telephone":$("input:eq(1)").val()
				},function(data){
					if(data==true){
						alert("修改成功");
						location.replace("welcome");
					}else{
						alert("修改失败");
						location.reload();
					}
				});
    		
    		}else{
    			alert("格式错误,请检查后提交");
    		}
			});
    	});
    </script>
  </head>
  
  <body>
  <table style="height: 199px; width: 306px;">
  <tr>
   	<td>邮箱:</td><td> <input type="text" name="email" value="${user.email }"></td>
  </tr>
  <tr>
   	<td>手机:</td><td><input type="text" name="telephone" value="${user.telephone }"></td>
   	</tr>
   	
   	<tr>
   	<td colspan="2" style="text-align: center;"><input type="button" class="btn btn-primary" value="提交"></td>
   	
   	</tr>
   </table>
  </body>
</html>
