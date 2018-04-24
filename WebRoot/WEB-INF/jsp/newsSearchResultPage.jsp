<%@ page language="java" import="java.util.*,java.text.*,com.hubery.bean.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<style type="text/css">
		div.pageSplit{
			display:none;			
		}
		/* a:link {color: #000000} */ 	/* 未访问的链接 */
		/* a:visited {color: #00FF00}	已访问的链接 */
		a:hover {color: #FF00FF}	/* 鼠标移动到链接上 */
		a:active {color: #0000FF}	/* 选定的链接 */
		
	</style>
	<script>
	    $(function(){
	        /* 调用Luara示例 */
	        $("#banner").luara({width:"1000",height:"292",interval:4000,selected:"seleted",deriction:"left"});
	    	/*查看更多显示*/
	    	
	    	/*加载页面，显示第一页*/
	    	$("div.pageSplit:first").show();
	    	/*新闻总页数*/
	    	var totalPage = "<%=request.getAttribute("totalPage")%>";
	    	/*点击显示更多，显示下一页*/
	    	var pageNum = 0;
	        $("#showMoreNews").click(function(){	        	
	        	pageNum++;
	        	if(pageNum<totalPage){
	        		$("div.pageSplit:eq("+pageNum+")").show();	        		
	        	}else{
	        		$("#showMoreNews").html("没有更多了。。。")
	        	}
	        });
	    
	    
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

    <div id="articleUrl" >
        <!-- 文章的路径显示 -->
        <div class="urlRepresentation"> 您现在的位置：<a href="index.jsp" target="_self">首页</a> > <a id="categoryName" href="#" target="_self">${categoryName }</a></div>
    </div>
	
	<div id="showArticles">
	<%
		/* count用来计算遍历的个数，vs.count没法取出 */
		int count = 0;
	%>
    <c:forEach var="news" items="${newsList }" varStatus="vs">
    
    <%
    	count++;
    	if(count%5==1){
    %>    
    		<!-- <p>这是分界线头</p> -->
    		<div class="pageSplit">
    <%
    	}
    %>
    <!--标题-->
    <h1 id="article_title"><a href="getNewsById?id=${news.id }">${news.title }</a></h1>
   
    <!--信息-->
    <div id="article_info">       
            <span>来源：新闻网站</span>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <!-- <span>记者：</span><span>于明山,通讯员 潘子璇</span>&nbsp;&nbsp;&nbsp;&nbsp;				 -->	
            <span>编辑：</span><span>${news.user.userName }</span>&nbsp;&nbsp;&nbsp;&nbsp;
            <span>发布时间：<fmt:formatDate value="${news.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
     </div>

    <!--正文-->
    <div id="articleContent">
        <pre style="white-space: pre-wrap;word-wrap: break-word;">
        	${news.content }>><a href="getNewsById?id=${news.id }">查看详情</a>        	
        </pre>      
    </div>
	<!--正文结束-->
  	<hr> 
  	<%
  		if(count%5==0){
  	%>  			
  			</div>
  			<!-- <p>这是分界线尾</p> -->
  	<%
  		}
  	%> 	
    </c:forEach>        
	</div>
	<!-- 显示更多 -->
    <br><center><button id="showMoreNews">>>点击查看更多<<</button></center><br>
    
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
