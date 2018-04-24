<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
        <link rel="stylesheet" href="${basePath }css/register-css/style.css">
	
		<style type="text/css">  
.nocode {  	
	display: inline-block;
    width: 80px;  
    height: 25px;  
}   
  
.code {  
	display: inline-block;
    color: #ff0000;  
    font-family: Tahoma, Geneva, sans-serif;  
    font-style: italic;  
    font-weight: bold; 
    text-align: center; 
    width: 120px;  
    height: 30px;  
    line-height: 25px;
    cursor: pointer;  
    border:1px solid #e2b4a2;
    background: #e2b4a2;
}  
  
.input {  
    width: 180px;  
}  
 
 .validationResult{
 	width:10px;
 	height:25px;
 }

</style> 
	
  </head>
  
    <body>

        <div class="page-container">
            <h1>登录</h1>
            <form action="verify" method="post" onsubmit="checkCode()">
                <input type="text" name="userName" class="username" placeholder="请输入您的用户名！">
                <input type="password" name="password" class="password" placeholder="请输入您的用户密码！">
                <input id="validationInput" type="text" class="input" placeholder="请输入验证码！"/> <span id="code" class="nocode">验证码</span><span class="validationResult"></span>

                <button id="formSubmitButton" type="submit" class="submit_button">登录</button>
                <div class="error"><span>+</span></div>
            </form>
            <div class="connect">
                <p>快捷</p>
                <p>
                    <a class="facebook" ></a>
                    <a class="twitter" ></a>
                </p>
            </div>
        </div>
		
        <!-- Javascript -->
        <script src="${basePath }js/jquery-1.8.2.min.js" ></script>
        <script src="${basePath }js/supersized.3.2.7.min.js" ></script>
        <script src="${basePath }js/supersized-init.js" ></script>
        <script src="${basePath }js/scripts.js" ></script>
		<script src="${basePath }js/jquery-1.12.3.min.js"></script>
		<script type="text/javascript" src="${basePath}js/code.js"></script> 
    </body>
</html>


