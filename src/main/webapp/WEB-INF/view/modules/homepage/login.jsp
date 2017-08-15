<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%> 
<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
    <meta name="viewport" content="width=device-width" /> 
    <link rel="shortcut icon" href="${ctxStaticB}/images/logo.ico" type="image/x-icon" />
   
    <meta name="description" content="啾唧网 方便快捷，物美价廉，更快送达，诚信服务" /> 
    <meta name="keywords" content="用户登录" />
<title>啾唧-用户登录</title>
<style>
.passwordSpan{ 
    display: inline;
    float: left;
    font-size: 14px;
    color: red; 
}
.usernameSpan{
    display: inline;
    float: left;
    font-size: 14px;
    color: red; 
}
.login-msg.error {
    border-color: #ffb4a8;
    background-color: #fef2f2;
    color: #6C6C6C;
}
.login-msg {
    font-size: 14px;
    position: absolute; 
    line-height: 16px;
    padding: 6px 10px;
    overflow: hidden;
    width: 278px;
    background: #fef2f2;
    border: 1px solid;
    margin: 4px 35px;
}
.iconfont {
    color: #f40;
    padding-right: 10px;
    float: left;
    font-size: 16px;
        font-family: iconfont!important; 
    font-style: normal;
    -webkit-font-smoothing: antialiased;
    -webkit-text-stroke-width: .2px;
        
}
</style>
<link rel="stylesheet" type="text/css" href="${ctxStaticB}/css/base.css">
<link rel="stylesheet" href="${ctxStaticB}/css/login/login.css"/> 
<script src="${ctxStatic}/plugin/jquery/jquery-1.11.3/jquery-1.11.3.min.js"></script>
<script src="${ctxStaticB}/assets/sys_resources/plugins/jquery-validation/jquery-validation-1.11.1/jquery.validate.js"> </script><!---新添加--->
<script src="${ctxStaticB}/assets/sys_resources/js/jquery.validate.message_cn.js"></script><!---新添加--->
<script>

function redirectPage() { 
	var url="${ctx}/homePageCtrl/toWapLogin.do";
	var winWidth = window.innerWidth; 
	var winHeight = window.innerHeight;  
	if(!IsPC()){
		window.location.href = url;  
	} 
}

function IsPC()  
{  
           var userAgentInfo = navigator.userAgent;  
           var Agents = new Array("Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod");  
           var flag = true;  
           for (var v = 0; v < Agents.length; v++) {  
               if (userAgentInfo.indexOf(Agents[v]) > 0) { flag = false; break; }  
           }  
           return flag;  
}

redirectPage(); 
</script>
</head>

<body>
<div class="container">  
 <iframe  src="${ctx}/homePageCtrl/toHeader.do" height="81" width="100%" scrolling="no" style="border:0px solid red"></iframe>
 <div id="main">
<div class="content">
<!--<div class="content-img"><img src="image/content.jpg"  alt=""/></div>-->
<div class="login">
 <c:if test="${result.iserror}">
      <div id="J_Message" class="login-msg error">
				<i class="iconfont">x</i>
				<p class="error">${result.message}</p> 
	 </div>
		     
       <!--   <div class="bao" style="color:yellow;text-align:center;">${result.message}</div>-->
  </c:if>
 <form method="post" action="${ctx}/userCtrl/login.do" id="loginForm" name="loginForm">
      <h4 style="color:red;"><a href="${ctx}/homePageCtrl/toRegister.do" target="_self" title="立即注册" tabindex="7">立即注册 &gt;</a>用户登录</h4>
         <p class="logininput">
         <input id="username" name="username" size="15" tabindex="1" maxlength="50" type="text" 
             placeholder="用户名/手机号/邮箱" value="${cookie.userName.value}" />
             <span class="usernameSpan"></span>
             </p>
             
             <p class="logininput">
		          <input id="password" name="password" size="15" tabindex="2" maxlength="16" type="password" placeholder="请输入密码" value="${cookie.pass.value}" />
		          <span class="passwordSpan"></span>
		     </p>
               <p class="logincheckbox">
               <label> <input id="check" type="checkbox"  name="checkbox" 	 onChange="change()"/>记住我</label>
              <input type="hidden" name="checkboxmark" value="${cookie.checkboxmark.value}">
              <!-- <a href="javascript:alert('功能暂未开放')">忘记密码</a> --></p> 
         <span class="button-login" id="submit">登&nbsp;录</span>  
         </form>
    </div> 
</div>
</div> 

  <iframe src="${ctx}/homePageCtrl/toFooter.do" height="120px" width="100%"  scrolling="no" style="border:0px solid red"></iframe>  
  
 </div> 
 
</body>

  <script type="text/javascript">
    var ctx = '${ctx}';
    function init(){  
    	if(loginForm.checkboxmark.value=='1'){
    		loginForm.checkbox.checked=true; 
    		loginForm.checkboxmark.value=1;
    	}else{
    		loginForm.checkbox.checked=false; 
    		loginForm.checkboxmark.value=0;
    	} 
    	var password = '${cookie.pass.value}';
    	if(password!=''&&password!='DELETEPASSWORD'){
    		$("#password").val(password);
    	}else if(password=='DELETEPASSWORD'){
    		$("#password").val("");
    		//alert('密码至空');
    	}else{
    		$("#password").val("");
    		//alert('密码至空');
    	}
    	//alert(password);
    }
    init();
    function change(){ 
    	if(loginForm.checkbox.checked){ 
    		loginForm.checkboxmark.value=1;
    	}else{ 
    		loginForm.checkboxmark.value=0;
    	}
    	console.info(loginForm.checkboxmark.value);
    }
  </script>
  <script src="${ctxStaticB}/js/login/login.js"></script>
</html>