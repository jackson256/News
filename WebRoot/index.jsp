<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'index.jsp' starting page</title>
<link rel="stylesheet" type="text/css" href="css/style1.css">
<link rel="stylesheet" href="css/luara.left.css"/>
<script src="js/jquery-1.8.3.min.js"></script>
<!--Luara js文件-->
<script src="js/jquery.luara.0.0.1.min.js"></script>
<!--Luara图片切换骨架end-->

<style>
a {
	text-decoration: none;
}

a:link {
	color: #000
} /* 未访问的链接 */
a:visited {
	color: red
} /* 已访问的链接 */
a:hover {
	color: #FFF
} /* 鼠标移动到链接上 */
a:active {
	color: #0000FF
} /* 选定的链接 */
.cle {
	clear: both;
}

/*logo 部分的div*/
.header {
	width: 100%;
}

.header div {
	text-align: center;
	float: left;
	height: 60px;
	line-height: 50px;
	padding: 5px 60px;
}

.header a {
	padding: 15px;
}
</style>

<!--Luara图片切换骨架end-->

<script>
$(function(){
    /* 调用Luara示例 */
    $("#banner").luara({width:"1000",height:"292",interval:4000,selected:"seleted",deriction:"left"});
		/* 将各类新闻标题显示 在页面上 */
		$.getJSON("getLatestFiveNewsByCategory", {}, function(data) {
			for ( var key in data) {
				var str = "";
				var news = data[key];
				for (var i = 0; i < data[key].length; i++) {
					str += "<dd><a href='getNewsById?id=" + data[key][i].id
							+ "'>" + data[key][i].title + "</a></dd>";
				}

				if ("focus" == key) {
					$("#focus").replaceWith(str);
				}
				if ("entertainment" == key) {
					$("#entertainment").replaceWith(str);
				}
				if ("finance" == key) {
					$("#finance").replaceWith(str);
				}
				if ("military" == key) {
					$("#military").replaceWith(str);
				}
				if ("sports" == key) {
					$("#sports").replaceWith(str);
				}
				if ("education" == key) {
					$("#education").replaceWith(str);
				}
				if ("politics" == key) {
					$("#politics").replaceWith(str);
				}
				if ("culture" == key) {
					$("#culture").replaceWith(str);
				}

			}

		});

		/* 最新的前6条新闻，将新闻标题显示在首页->新闻零距离 	*/
		$.getJSON("getLatestNews", {}, function(data) {
			var str = "";
			for (var i = 0; i < data.length; i++) {
				str += "<dd><a href='getNewsById?id=" + data[i].id + "'>"
						+ data[i].title + "</a></dd>";
			}
			$("#latestNews").replaceWith(str);
		});

		/* 查询访问量最高的18条新闻，将新闻标题显示在首页->特别关注 	*/
		$.getJSON("getPopularNews", {}, function(data) {
			var str = "";
			for (var i = 0; i < data.length; i++) {
				str += "<dd><a href='getNewsById?id=" + data[i].id + "'>"
						+ data[i].title + "</a></dd>";
			}
			$("#popularNews").replaceWith(str);
		});

	});
</script>

</head>

<body>
	<div id="pageHeader">
		<!--嵌套三个div-->
		<div class="header">
			<div>
				<img src="img/images/tubiao.jpg" height="40px" />
			</div>

			<div>
				<span id=localtime></span>
				<script type="text/javascript">
					function showLocale(objD) {
						var str, colorhead, colorfoot;
						var yy = objD.getYear();
						if (yy < 1900)
							yy = yy + 1900;
						var MM = objD.getMonth() + 1;
						if (MM < 10)
							MM = '0' + MM;
						var dd = objD.getDate();
						if (dd < 10)
							dd = '0' + dd;
						var hh = objD.getHours();
						if (hh < 10)
							hh = '0' + hh;
						var mm = objD.getMinutes();
						if (mm < 10)
							mm = '0' + mm;
						var ss = objD.getSeconds();
						if (ss < 10)
							ss = '0' + ss;
						var ww = objD.getDay();
						if (ww == 0)
							colorhead = "<font color=\"#FF0000\">";
						if (ww > 0 && ww < 6)
							colorhead = "<font color=\"#373737\">";
						if (ww == 6)
							colorhead = "<font color=\"#008000\">";
						if (ww == 0)
							ww = "星期日";
						if (ww == 1)
							ww = "星期一";
						if (ww == 2)
							ww = "星期二";
						if (ww == 3)
							ww = "星期三";
						if (ww == 4)
							ww = "星期四";
						if (ww == 5)
							ww = "星期五";
						if (ww == 6)
							ww = "星期六";
						colorfoot = "</font>"
						str = colorhead + yy + "-" + MM + "-" + dd + " " + hh
								+ ":" + mm + ":" + ss + "  " + ww + colorfoot;
						return (str);
					}

					function tick() {
						var today;
						today = new Date();
						document.getElementById("localtime").innerHTML = showLocale(today);
						window.setTimeout("tick()", 1000);
					}
					tick();
				</script>
			</div>
			<div>
			<span> <%
			 	if (session.getAttribute("user") != null) {
			 %> <a>${sessionScope.user.userName }</a><a
							href="manage">管理</a> <%
			 	} else {
			 %> <a href="login" name="register">登录</a>
							<a href="reg">注册</a> <%
			 	}
			 %>
 		
         <script type="text/javascript">
         	$(function(){
         		/* event = event || window.event; */
         		$("#d").click(function(){
         			
         			location.href="search1?keywords="+$("[name=keywords]").val();	
         			
         		});
         		$(document).keydown(function(event){
         			if(event.keyCode==13){
         				if($("#id").val()==""){
         					return false;
         				}
         				location.href="search1?keywords="+$("[name=keywords]").val();
         			}
         		});
         	});
         </script>
		
					<input name="keywords" type="text" value="请输入关键字" onblur="javascript:if(this.value==''){this.value='请输入关键字'}"
						onfocus="javascript:if(this.value=='请输入关键字')this.value='';" />
					<input id="d" type="button" class="button" value="搜索" />
			</span>

		</div>
	</div>

	<!--header-->
	<div id="header">

		<!--导航菜单-->
		<ul id="nav">
			<li><a href="" class="navActive">首 页</a></li>
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

	<!--content-->
	<div id="content">

		<!--content left-->
		<div id="leftArticle">
			<dl>
				<dt>时事热点</dt>
				<dd id="focus" />
			</dl>

			<dl>
				<dt>娱乐</dt>
				<dd id="entertainment" />
			</dl>

			<dl>
				<dt>财经</dt>
				<dd id="finance" />
			</dl>

			<dl>
				<dt>军事</dt>
				<dd id="military" />
			</dl>

		</div>

		<div id="centerArticle">
			<dl>
				<dt>体育</dt>
				<dd id="sports" />

			</dl>

			<dl>
				<dt>教育</dt>
				<dd id="education" />
			</dl>

			<dl>
				<dt>政治</dt>
				<dd id="politics" />
			</dl>

			<dl>
				<dt>文化</dt>
				<dd id="culture" />
			</dl>
		</div>

		<!--content left End-->

		<!--content right-->
		<div id="rightInfo">
			<dl>
				<dt>新闻零距离（以更新时间）</dt>
				<dd id="latestNews" />
			</dl>
			<dl>
				<dt>特别关注（按访问量）</dt>
				<dd id="popularNews" />
			</dl>
		</div>
		<!--content right End-->
	</div>
	<!--content End-->

	<!--footer-->
	<div id="footer">
		<p>
			<a href="#">关亍我们</a> | <a href="#">广告服务</a> | <a href="#">提交问题</a> |
			<a href="#">联系我们</a> | <a href="#">版权声明</a> | <a href="#">关亍隐私</a> |
			<a href="#">合作伙伴</a>
		</p>

		<p>
			<a href="#">沪ICP备10055601号</a> All rights(C)2016-2017 Reserved
		</p>
	</div>
	<!--footer End-->

	<a id="linkstudy1" href="http://www.cssstudy.com/apply.aspx"></a>


</body>
</html>
