<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title></title>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/neat.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/my_common.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/login/css/login.css"/>
<script src="${ctxStatic}/plugin/jquery/jquery-1.11.3/jquery-1.11.3.min.js"></script>

</head>
<body>
    <header>
        <i class="return-btn"></i>
        <h1 class="header-title ">登录</h1>
    </header>
    <div id="wrapper" class="content">
        <div class="content-padded">
       
            <div class="login-panel">
                <div class="input-row">
                    <i class="person-icon"></i>
                    <input type="text" placeholder="手机号码" class="input-clear user-account"/>
                </div>
                <div class="input-row">
                    <i class="lock-icon"></i>
                    <input type="password" placeholder="登录密码" class="input-clear user-password" id="user-password"/>
                    <i class="eye-hidden-icon" id="toggle-password"></i>
                </div>
            </div>
       
            <button class="primary-gray-btn login-btn">登录</button>
            <div class="fast-enter">
                <span class="fast-reg">快速注册</span>
                <!-- <span class="forget-pdw">忘记密码</span> -->
            </div>
        </div>
    </div>
    <script src="${ctxStaticB}/wapjiuji/public/js/jquery.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/jump.js"></script>
    <script src="${ctxStaticB}/wapjiuji/login/js/login_about.js"></script>
    <script>
	    $(".fast-reg").click(function(){
	        window.location.href="${ctx}/homePageCtrl/toWapRegister.do";
	    });
	    
	    $(".forget-pdw").click(function(){
	        window.location.href="${ctx}/pageController/wapjiuji/login/forget_password.do";
	    });
	    
	   
    	$(".login-btn").click(function(){
    		var username = $(".user-account").val();
    		var password = $(".user-password").val();
    		$.ajax({
 	 		   url: "${ctx}/userCtrl/wapLogin.do",
 	 		   data:{username:username,password:password},
 	 		   type:"Post", 
 	 		   success:function(data){	 
 	 			   var data = eval("("+data+")"); 
 	 			  if(data.iserror){
 	 				  alert(data.message);
 	 			  }else{
 	 				  //alert("${ctx}"+data.data);
 	 				  window.location="${ctx}"+data.data;
 	 			  }
 	 		   }  
 	 	     });
    	}); 
	   
    </script>
    
</body>
</html>