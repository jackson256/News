<%@ page language="java" import="java.util.*,java.text.*,com.hubery.bean.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String currentTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>My JSP 'index.jsp' starting page</title>	    
	<link rel="stylesheet" type="text/css" href="css/style1.css">
	<link rel="stylesheet" href="css/luara.left.css"/>
	<script src="js/jquery-1.8.2.min.js"></script>
	<!--Luara js文件-->
		<script src="js/jquery.luara.0.0.1.min.js"></script>
	<!--Luara图片切换骨架end-->
	<script>
	    $(function(){
	        /* 调用Luara示例 */
	        $("#banner").luara({width:"1000",height:"292",interval:4000,selected:"seleted",deriction:"left"});
	    	 	       
	    });
	</script>    
  </head>
  
  <body>
<!--header-->
<div id="header">

 <!--导航菜单-->
<ul id="nav">
	<li><a href="index.jsp" class="navActive">首 页</a></li>
    <li><a href="getNewsByCategory?categoryName=focus">时事热点</a></li>
	<li><a href="getNewsByCategory?categoryName=entertainment">娱乐</a></li>
	<li><a href="getNewsByCategory?categoryName=finance">财经</a></li>
	<li><a href="getNewsByCategory?categoryName=military">军事</a></li>
	<li><a href="getNewsByCategory?categoryName=sports">体育</a></li>
	<li><a href="getNewsByCategory?categoryName=education">教育</a></li>
	<li><a href="getNewsByCategory?categoryName=politics">政治</a></li>
	<li><a href="getNewsByCategory?categoryName=culture">文化</a></li>
</ul>
</div>
<!--header End-->

<!--banner-->
<div id="banner">
    <ul>
		<li><a class="bannerlogo" href="index.jsp"><img src="img/images/1.jpg" alt="1" /></a></li>
		<li><a class="bannerlogo" href="getNewsById?id=167"><img src="img/images/2.jpg" alt="2" /></a></li>
		<li><a class="bannerlogo" href="getNewsById?id=168"><img src="img/images/3.jpg" alt="3" /></a></li>
		<li><a class="bannerlogo" href="getNewsById?id=169"><img src="img/images/4.png" alt="4" /></a></li>			
	</ul>
	<ol>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ol>
</div>
<!--banner End-->

<!--新闻正文-->
<div id="content" >

    <!-- 文章的路径显示 -->
    <div id="articleUrl" >
        <div class="urlRepresentation"> 您现在的位置：<a href="index.jsp" target="_self">首页</a> > <a href="getNewsByCategory?categoryName=${news.category.name }" target="_self">${news.category.name }新闻</a> ><span>正文</span> 当前时间:<span id="currentTime"><%=currentTime %></span></div>
    </div>

    <!--标题-->
    <h1 id="article_title">${news.title }</h1>
   
    <!--信息-->
    <div id="article_info">       
            <span>来源：新闻网站</span>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <!-- <span>记者：</span><span>于明山,通讯员 潘子璇</span>&nbsp;&nbsp;&nbsp;&nbsp;		 -->			
            <span>编辑：</span><span>${news.user.userName }</span>&nbsp;&nbsp;&nbsp;&nbsp;	
            <%
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            	News news = (News)request.getAttribute("news");					
			%>
            <span>发布时间：<%=sdf.format(news.getCreateTime()) %></span>
     </div>

    <!--正文-->
    <div id="articleContent">
        <pre style="white-space: pre-wrap;word-wrap: break-word;">${news.content }</pre>        
    </div>
	<!--正文结束-->
  	<hr>

<link rel="stylesheet" type="text/css" href="<%=basePath %>css/sinaFaceAndEffec.css" />
<link  rel="stylesheet" href="<%=basePath %>css/main.css" />

<!--评论-->
<%
	if(session.getAttribute("user")!=null){
%>
<div id="articleComments">
<div id="content" style="width: 900px; height: auto;margin-left:60px;margin-top:40px">
	<div class="wrap">
		<!-- 评论输入区-->
		<div class="comment">
			<!-- 显示登录的用户名 ，默认的图像-->
			<div class="head-face">
				<img src="<%=basePath %>img/images/1.jpg" />
				<p id="loginUserName">${sessionScope.user.userName }</p>
				<!-- 隐藏输入域，newsId作为comment的参数 -->
				<input type="hidden" id="NewsId" value="${news.id }"/>
			</div>
			<!-- 评论输入正文 -->
			<div class="content">
				<div class="cont-box">
					<textarea class="text" placeholder="请输入..."></textarea>
				</div>
				<div class="tools-box">
					<div class="operator-box-btn"><span class="face-icon"  >☺</span></div>
					<div class="submit-btn"><input type="button" onClick="out()" value="提交评论" /></div>
				</div>
			</div>
			<!-- 评论输入正文  End-->
		</div>
		<!-- 评论输入区 End-->
				<%
					}else{
				%><a href="login">我有话要说！请先登录</a>
				<%
					}
				%>
				
<div id="info-show">
<h2>热门评论：</h2>
<!-- 新增评论显示 -->
	<ul></ul>
<!-- 已有评论显示 -->
	<div id="submittedComments">				
		<c:forEach var="comment" items="${commentList }">		
		<li>
			<div class="head-face">
				<img src="<%=basePath %>img/images/1.jpg"/>
			</div>
			<div class="reply-cont">
				<p class="username">${comment.user.userName }</p>
				<p class="comment-body">${comment.content }</p>				
				<p class="comment-footer"><fmt:formatDate value="${comment.submitTime }" pattern="yyyy-MM-dd HH:mm:ss"/></p>				
			</div>
		</li>
		</c:forEach>	
	</div>
<!-- 已有评论显示 End -->			
</div>
<!-- 评论显示 End -->
</div>
</div>					

<!-- 插入表情JS -->
<script type="text/javascript" src="<%=basePath%>js/main.js"></script>
<script type="text/javascript" src="<%=basePath%>js/sinaFaceAndEffec.js"></script>
<script type="text/javascript">
		
	// 绑定表情
	$('.face-icon').SinaEmotion($('.text'));
	// 测试本地解析
	function out() {
		var inputText = $('.text').val();		
		$('#info-show ul').prepend(reply(AnalyticEmotion(inputText)));
					
	}
	
	var html;
	function reply(content){
		html  = '<li>';
		html += '<div class="head-face">';
		html += '<img src="<%=basePath %>img/images/1.jpg"/>';
		html += '</div>';
		html += '<div class="reply-cont">';
		html += '<p class="username">'+document.getElementById("loginUserName").innerHTML+'</p>';
		html += '<p class="comment-body">'+content+'</p>';
		html += '<p class="comment-footer"><%=currentTime %></p>';
		html += '</div>';
		html += '</li>';
		return html;
	}
	
	
	$(function(){		
		$("[type='button']").click(function(){	
			//alert($("#NewsId").val());
			$.post("addComment",{
				"content":$(".text").val(),"submitTime":document.getElementById("currentTime").innerHTML,	
				"newsId":$("#NewsId").val()
			},function(data){
				$('.text').val("");
			});
		});
	})
	
	
</script>


</div>
<!--comments End-->
    
</div>
<!--content End-->

<!--footer-->
<div id="footer">
    <p>
    <a href="#">关亍我们</a> | <a href="#">广告服务</a> | <a href="#">提交问题</a> | <a href="#">联系我们</a> | <a href="#">版权声明</a> | <a href="#">关亍隐私</a> | <a href="#">合作伙伴</a>
    </p>

    <p>
    <a href="#">京ICP备10055601号</a>
    All rights(C)2016-2017 Reserved
    </p>
</div>
<!--footer End-->
		
  </body>
</html>
