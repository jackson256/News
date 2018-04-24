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
    
    <title>My JSP 'delete_comment.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/manage-css/add-css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/manage-css/add-css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/manage-css/add-css/style.css" />
    <script type="text/javascript" src="js/jquery2.js"></script>
    <script type="text/javascript" src="js/jquery2.sorted.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/ckform.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript">
	$(function(){
		$(".delete").click(function(){
			
			$.post("delete-comment",{"id":$(this).siblings(".NewsId").val()},function(data){
				if(data){
					alert("删除成功");
					location.reload();
				}else{
					alert("删除失败");
					location.reload();
				}
			});
		});
	});
	
	</script>
    <style type="text/css">
        body {font-size: 20px;
            padding-bottom: 40px;
            background-color:#e9e7ef;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<body>

<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>评论内容</th>
        <th>评论新闻</th>
        <th>评论时间</th>
        <th>操作</th>
       
    </tr>
    </thead>
	    <%
	    	List<Comment> comment=(List)request.getAttribute("comment");
	    	List<String> title=(List)request.getAttribute("title");
	    	SimpleDateFormat bartDateFormat = new SimpleDateFormat
  				("yyyy-MM-dd HH:mm:ss"); 
  				
	    	if(comment.size()!=0){
	    		for(int i=0;i<comment.size();i++){	%>
	    		<tr>
                <td><%=comment.get(i).getContent() %></td>
				<td><%=title.get(i) %></td>
                <td><%=bartDateFormat.format(comment.get(i).getSubmitTime()) %></td>
                <td><button type="button" class="delete">删除</button>
                	<input type="hidden" class="NewsId" value="<%=comment.get(i).getId()%>"/>
                </td>
        		</tr>
	    <% 		}
	    	}else{	%>
	    	<tr><td colspan="2">您没有评论信息</td></tr>
	    <%	}
	    
	     %>
        
           
       
       </table>

</body>
</html>

