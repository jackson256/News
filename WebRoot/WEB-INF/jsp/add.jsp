<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add.jsp' starting page</title>
    
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
    <script type="text/javascript" src="<%=basePath %>js/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jquery.sorted.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/bootstrap.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/ckform.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/common.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/showdate.js"></script>
    <style type="text/css">
        body {font-size: 20px;
             padding-bottom: 40px;
             background-color:#e9e7ef;
             font-size:17px;
        }
      

    </style>
</head>

<table class="table table-bordered table-hover definewidth m10" style="margin-left:3%;margin-top:2%;">
    <tr>
        <td width="10%" class="tableleft">新闻标题</td>
        <td><input type="text" name="title" style="height: 41px; width: 546px"/></td>
     
    </tr>
    <tr>
        <td class="tableleft">新闻内容</td>
        <td><textarea name="content" rows="" cols="" style="height: 200px; width: 546px"></textarea></td>
    </tr> 
  	<tr>
  		<td class="tableleft">新闻类别</td>
  		<td><select name="categoryId">
  			<option value="1">时事热点</option>
  			<option value="2">娱乐</option>
  			<option value="3">财经</option>
  			<option value="4">军事</option>
  			<option value="5">体育</option>
  			<option value="6">教育</option>
  			<option value="7">政治</option>
  			<option value="8">文化</option>
  		</select></td>
  	</tr> 
    <tr>
        <td class="tableleft"></td>
        <td>
            <input name="button" style="margin-left:180px;"type="button"  class="btn btn-primary"  value="保存"/>&nbsp;&nbsp;<a href="12"><button type="button" >返回列表</button></a>
        </td>
    </tr>
</table>
<script type="text/javascript">
	$(function(){
		$("[name=button]").click(function(){
		if($("[name=title]").val()!=""&&$("[name=content]").val()!=""){
			$.post("insertNews",{"title":$("[name=title]").val(),
								"content":$("[name=content]").val(),
								"categoryId":$("[name=categoryId]").val()
			},function(data){
				if(data){
					alert("上传成功");
					location.replace("welcome");   
					
				}else{
					alert("上传失败");
				}
				
			});
		
		}else{
			alert("标题和内容不得为空");
		}
		});
	});
</script>

</body>
</html>