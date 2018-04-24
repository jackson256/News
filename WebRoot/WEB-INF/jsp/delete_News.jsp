<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.hubery.bean.News"%>
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
    <script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript">
	/*  function getMyDate(str){  
            var oDate = new Date(str),  
            oYear = oDate.getFullYear(),  
            oMonth = oDate.getMonth()+1,  
            oDay = oDate.getDate(),  
            oHour = oDate.getHours(),  
            oMin = oDate.getMinutes(),  
            oSen = oDate.getSeconds(),  
            oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间  
            return oTime;  
        };  
        //补0操作  
        function getzf(num){  
            if(parseInt(num) < 10){  
                num = '0'+num;  
            }  
            return num;  
        }   */
	
			/* $.post("show_News",{},function(data){
			for(var i=0;i<data.length;i++){
				
			var str ="  <tr> "+
			        "<td>"+data[i].title+"</td>"+
			        "<td>"+data[i].userId+"</td>"+
			        "<td>"+getMyDate(data[i].createTime)+"</td>"+
			        "<td><a class='delete'>删除</a></td>"+
			       	"</tr>";
				$("tr:last").after(str);
			}
			}); */
			
		$(function(){
			
		$(".delete").click(function(){
			
			$.post("delete-news",{"id":$(this).siblings(".NewsId").val()},function(data){
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
<form class="form-inline definewidth m20" action="selectTitle" method="get">
     <font color="#777777"><strong>查询新闻：</strong></font>
    <input type="text" name="title" id="menuname"class="abc input-default" placeholder="" value="">&nbsp;&nbsp; 
    <button type="submit" class="btn btn-primary">查询新闻</button>&nbsp;&nbsp; 
	
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>新闻标题</th>
        <th>发布人</th>
        <th>发布时间</th>
        <th>操作</th>
       
    </tr>
    </thead>
	    <%
	    	List<News> news=(List)request.getAttribute("news");
	    	List<String> nameList=(List)request.getAttribute("nameList");
	    	SimpleDateFormat bartDateFormat = new SimpleDateFormat
  				("yyyy-MM-dd HH:mm:ss"); 
  				
	    	if(news.size()!=0){
	    		for(int i=0;i<news.size();i++){		%>
	    			<tr>
	    				<td><%=news.get(i).getTitle() %></td>
	    				<td><%=nameList.get(i) %></td>
	    				<td><%=bartDateFormat.format(news.get(i).getCreateTime()) %></td>
	    				<td>
	    					<a href="update-News?id=<%=news.get(i).getId()%>"><button class="update">修改</button></a>
	    					<button class="delete">删除</button>
	    					<input type="hidden" class="NewsId" value="<%=news.get(i).getId()%>"/>
	    				</td>
	    				
	    			</tr>
	    			
	    <% 		}
	    	}else{	%>
	    	<tr><td colspan="2">您没有发布新闻</td></tr>
	    <%	}
	     %>
      
           
       
       </table>
	
</body>
</html>

