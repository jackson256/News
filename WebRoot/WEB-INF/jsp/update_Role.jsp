<%@page import="com.hubery.bean.User"%>
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
		$(".lift").click(function(){
			$.post("lift_Role",{"id":$(this).siblings(".UserId").val()},function(data){
				if(data){
					alert("提升成功");
					location.reload();
				}else{
					alert("提升失败");
					location.reload();
				}
			});
		});
		
		$(".delete_user").click(function(){
			
			$.post("delete_user",{"id":$(this).siblings(".UserId").val()},function(data){
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
        <th>用户名</th>
        <th>用户权限</th>
        <th>操作</th>
       
    </tr>
    </thead>
	    <%
	    	List<User> userList=(List)request.getAttribute("userList");
	    	
  				
	    	if(userList.size()!=0){
	    		for(int i=0;i<userList.size();i++){	%>
	    		<tr>
                <td><%=userList.get(i).getUserName() %></td>
				<td><%=userList.get(i).getUserRole() %></td>
				<%if(userList.get(i).getUserRole().equals("admin")){%>
					<td>最高权限</td>			
		<% 		}else{	%>
                <td><button type="button" class="lift">提升权限</button>
                	<button type="button" class="delete_user">删除用户</button>
                	<input type="hidden" class="UserId" value="<%=userList.get(i).getId()%>"/>
                	<input type="hidden" class="UserRole" value="<%=userList.get(i).getUserRole()%>"/>
                </td>
		<%} %>
        		</tr>
	    <% 		}
	    	}else{	%>
	    	<tr><td colspan="2">没用户存在</td></tr>
	    <%	}
	    
	     %>
        
           
       
       </table>

</body>
</html>

