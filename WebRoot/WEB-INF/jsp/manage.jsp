<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'manage.jsp' starting page</title>
    <link type="text/css" rel="stylesheet" href="<%=basePath %>css/manage-css/style.css" />
	<script type="text/javascript" src="<%=basePath %>js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/menu.js"></script>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	a{
		cursor: pointer;
	}
	*{
		
	}
	</style>

  </head>
  
<body>
<div class="top"></div>
<div id="header">
	<div class="logo">新闻后台管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li><a>${sessionScope.user.userName }</a></li>
			<li><a href="">回到首页</a></li>
			<li><a onClick="openurl('update-pwd');">修改密码</a></li>
			
			<li><a href="exit">退出</a></li>
		</ul>
	</div>
</div>
<div id="content">
	<div class="left_menu">
				<ul id="nav_dot">
     <!--  <li>
          <h4 class="M1"><span></span>系统公告</h4>
          <div class="list-item none">
            <a >系统公告1</a>
            <a href=''>系统公告2</a>
            <a href=''>系统公告3</a>
            <a href=''>系统公告4</a>
          </div>
        </li> -->
        <li>
          <h4 class="M2"><span></span>个人信息</h4>
          <div class="list-item none">
            <a onClick="openurl('show-inf');">基本信息</a>
            <a onClick="openurl('update-inf');">修改基本信息</a>
            <a onClick="openurl('update-pwd');">修改密码</a>      
           </div>
        </li>
        <li>
          <h4 class="M3"><span></span>新闻管理</h4>
          <div class="list-item none">
            <a onClick="openurl('show_News');">查看新闻</a>
            <a onClick="openurl('add');">上传新闻</a>
          </div>
        </li>
				<li>
          <h4 class="M4"><span></span>评论管理</h4>
          <div class="list-item none">
            <a onClick="openurl('delete_comment');">查看评论</a>
            
          </div>
        </li>
       
		<li>
          <h4 class="M5"><span></span>用户管理</h4>
          <div class="list-item none">
            <a onClick="openurl('update_Role');">用户权限</a>
            
          </div>
        </li> 
			
  </ul>
		</div>
		<script type="text/javascript">
			$(function(){
				$("h4").click(function(){
					$("#hh").text($(this).text());
					$("#jj").text("");
					$("a").click(function(){
						$("#jj").text($(this).text());
					});
				});
			});
		</script>
		<div class="m-right">
			<div class="right-nav">
					<ul>
							<li><img src="<%=basePath %>img/manage-img/home.png"></li>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a id="hh">首页</a></li>
								<li></li>
								<li><a id="jj"></a></li>
						</ul>
			</div>
			<script type="text/javascript">
			function openurl(url) {
			var rframe = parent.document.getElementById("rightFrame");
			rframe.src = url;
			}
			</script>
			<div class="main">
				<iframe id="rightFrame" name="rightFrame" width="100%" height="90%"
				scrolling="auto" marginheight="0" marginwidth="0" 
				style="border: 0px solid #CCC; margin: 0; padding: 0;" src="welcome"></iframe>
			</div>
		</div>
</div>
<div class="bottom"></div>
<div id="footer"><a href="" target="_blank">菜鸟联盟</a></div>
<script>navList(12);</script>
</body>
</html>
