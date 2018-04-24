<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>Sign Up Login</title>

  <link rel="stylesheet" href="css/register-css/style2.css">
</head>

<body>

<div class="cotn_principal">
  <div class="cont_centrar">
    <div class="cont_login">
      <div class="cont_info_log_sign_up">
      <!-- <div class="col_md_login">
          <div class="cont_ba_opcitiy">
            <h2>登录</h2>
            <p>Lorem ipsum dolor sit amet, consectetur.</p>
            <button class="btn_login" onClick="cambiar_login()">登录</button>
          </div>
        </div> -->
        
        
        <div class="col_md_sign_up">
          <div class="cont_ba_opcitiy">
            <h2>注册</h2>
            <p>欢迎注册</p>
            <button class="btn_sign_up" onClick="cambiar_sign_up()">注册</button>
          </div>
        </div>
        
      </div>
      <div class="cont_back_info">
        <div class="cont_img_back_grey"> <img src="img/register-img/po.jpg" alt="" /> </div>
      </div>
      <div class="cont_forms" >
        <div class="cont_img_back_"> <img src="img/register-img/po.jpg" alt="" /> </div>
           <div class="cont_form_login"> <a href="#" onClick="ocultar_login_sign_up()" ><i class="material-icons">&#xE5C4;</i></a>
          <h2>登录</h2>
          <input type="text" placeholder="Email" />
          <input type="password" placeholder="Password" />
          <button class="btn_login" onClick="cambiar_login()">登录</button>
        </div>
      
        <div class="cont_form_sign_up"> <a href="#" onClick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
          <h2>注册</h2>
          <input type="text" placeholder="邮箱" name="email"/>
          <input type="text" placeholder="用户名" name="userName"/>
          <input type="password" placeholder="密码" name="password"/>
          <input type="password" placeholder="再次输入密码" name="rePassword"/>
        <button id="d" class="btn_sign_up" >注册</button>
         <script src="${basePath }js/jquery-1.8.2.min.js" ></script>
         <script type="text/javascript">
         	$(function(){
         		var reg_email=/[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/;
         		$("[name=email]").blur(function(){
         			if(reg_email.test($("[name=email]").val())){
         				
         			}else{
         			  alert("邮箱格式不正确");
         			}
         		});
         		 
         			var reg_password=/^[a-zA-Z0-9]{6,10}$/;
         		$("[name=password]").blur(function(){
         		if(reg_password.test($("[name=password]").val())){
         			                                 				
         			 }else{
         			 alert("密码不正确");
         			 }               
         		}); 
         		
         		$("#d").click(function(){                           			
         			if($("[name=password]").val()==$("[name=rePassword]").val()&&reg_email.test($("[name=email]").val())&&reg_password.test($("[name=password]").val())){
         			location.href="addUser?email="+$("[name=email]").val()+"&userName="+$("[name=userName]").val()+"&password="+$("[name=password]").val();	
         			}else{
         				alert("信息错误");
         			}
         		});
         	});
         </script>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="js/index.js"></script>
<div style="text-align:center;">
<p>来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
</div>
</body>
</html>



