<%@page import="com.hubery.bean.News"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.hubery.bean.Comment"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'show-inf.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

 <link rel="stylesheet" type="text/css" href="<%=basePath%>css/manage-css/show-inf-css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/manage-css/show-inf-css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/manage-css/show-inf-css/style.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery.sorted.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/ckform.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/common.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/showdate.js"></script>
    <style type="text/css">
        body {font-size: 20px;
        	 padding-top:0px;
             padding-bottom: 40px;
             padding-left:5px;
             background-color:#e9e7ef;
             font-size:17px;
             transform: scale(0.95);
        }
        .sidebar-nav {
            padding: 9px 0;
        }

      	
    </style>
</head>
<body>
<h3><strong>基本信息：</strong></h3>
   <table class="table table-condensed">
               <tr>              
	              <td width="18%" height="30" align="center">用 户 名：</td>
	              <td width="82%" class="word_grey">${sessionScope.user.userName }</td>
	            </tr>
				<tr>              
	              <td width="18%" height="30" align="center">真实姓名：</td>
	              <td width="82%" class="word_grey">${sessionScope.user.userName }</td>
	            </tr>
	            <tr>
	              <td height="28" align="center">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
	              <td height="28">******</td>
	            </tr>
				<tr>
	              <td height="28" align="center">用户类型：</td>
	              <td height="28">${sessionScope.user.userRole }</td>
	            </tr> 
	            <tr>
	              <td height="28" align="center">E-mail：</td>
	              <td height="28">${sessionScope.user.email }</td>
	            </tr> 
			   
	            <tr>
	              <td height="28" align="center">手机</td>
	              <td height="28">${sessionScope.user.telephone}</td>
	            </tr> 
	        </table>				
      
			<!--/////////////////////////////////////-->  
	 &nbsp;&nbsp;&nbsp;&nbsp; <strong>评论记录：</strong>        
		
	<table class="table table-condensed" style="margin-left: 5px"  >
		<tr>
	              <td class="word_grey">序号</td>
				  <td class="word_grey">评论对象</td>
				  <td class="word_grey">评论时间</td>
	            </tr> 
	             <%
	             	List<Comment> comment=(List)request.getAttribute("comment");
	             	List<String> lis=(List)request.getAttribute("lis");
	             	SimpleDateFormat bartDateFormat = new SimpleDateFormat
  				("yyyy-MM-dd HH:mm:ss"); 
	             	if(comment!=null&&lis.size()!=0){
	             	for(int i=0;i<comment.size();i++){		%>
				<tr>
			  
	              <td class="word_grey"><%=i+1 %></td>
	              <td class="word_grey"><%=lis.get(i) %></td>
				  <td class="word_grey"><%=bartDateFormat.format(comment.get(i).getSubmitTime()) %></td>
	            </tr> 
	           <% 	} 
	           }else{%>
	           <tr><td colspan="2" style="text-align: center;">您没有评论记录</td></tr>
	           
	          <% }
	           %>
				
				</table>
				<!--/////////////////////////////////////-->
		&nbsp;&nbsp;&nbsp;&nbsp;	
		<strong>上传记录：</strong>
				
			<table  class="table table-condensed">
	           <tr>
	             
	              <td class="word_grey">序号</td>
				  <td class="word_grey">上传对象</td>
				  <td class="word_grey">上传时间</td>
	            </tr>               
	             <%
	             	List<News> news=(List)request.getAttribute("news");
	             	
	             	if(news!=null&&news.size()!=0){
	             	for(int i=0;i<news.size();i++){		%>
				<tr>
			  
	              <td class="word_grey"><%=i+1 %></td>
	              <td class="word_grey"><%=news.get(i).getTitle() %></td>
				  <td class="word_grey"><%=bartDateFormat.format(news.get(i).getCreateTime()) %></td>
	            </tr> 
	           <% 	} 
	           }else{%>
	           <tr><td colspan="2" style="text-align: center;">您没有上传记录</td></tr>
	           
	          <% }
	           %>
            </table> 
</body>
</html>
