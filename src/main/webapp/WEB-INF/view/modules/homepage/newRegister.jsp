<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%>
<script type="text/javascript">
var ctx = '${ctx}';
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>用户注册</title>
<link rel="shortcut icon" href="${ctxStaticB}/images/ico.ico" type="image/x-icon" />
<!--用百度的静态资源库的cdn安装bootstrap环境-->
<!-- Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/css/bootstrap.css" type="text/css" /> 
<!--font-awesome 核心我CSS 文件-->
 <link href="//cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet"> 
<!-- 在bootstrap.min.js 之前引入 -->
<script src="${ctxStaticB}/assets/sys_resources/js/jquery.js"></script>   


<!-- Bootstrap 核心 JavaScript 文件 -->
<script src="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/js/bootstrap.js"></script>  
<script src="${ctxStaticB}/assets/sys_resources/plugins/jquery-validation/jquery-validation-1.11.1/jquery.validate.js"> </script><!---新添加--->
<script src="${ctxStaticB}/assets/sys_resources/js/jquery.validate.message_cn.js"></script><!---新添加--->


<style type="text/css">
body {
    overflow-y:hidden;
	font-size: 14px;
}

.con{
	background: url(${ctxStaticB}/images/register/5.jpg) no-repeat;
	background-size: <span style="font-family: 微软雅黑; background-color: rgb(239, 239, 239);">cover</span>;
}

.form {
	/* background: rgba(255, 255, 255, 0.2); */
	background: rgba(255, 255, 255, 1.0);
	width: 400px;
	margin: 50px auto;
}

#login_form {
	display: none;
}

#register_form {
	display: block;
}

.fa {
	display: inline-block;
	top: 27px;
	left: 6px;
	position: relative;
	color: #ccc;
}

input[type="text"], input[type="password"] {
	padding-left: 26px;
}

.checkbox {
	padding-left: 21px;
}
</style>
</head>
<body>
 <iframe  src="${ctx}/homePageCtrl/toHeader.do" height="81" width="100%" scrolling="no" style="border:0px solid red"></iframe>
	<div class="container con" style="width:100%;height:80%;margin:0px 0px 5% 0px">
  
		<div class="form row" style="">
			<form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="register_form" action="">
				<h3 class="form-title">欢迎注册啾唧网</h3>
				<div class="col-sm-9 col-md-9">
					<div class="form-group" style="height:50px;">
						<i class="fa fa-user fa-lg"></i> <input
							class="form-control required" type="text" placeholder="请输入用户名"
							name="username" autofocus="autofocus" />
							<span></span>
					</div>
					<div class="form-group" style="height:50px;">
						<i class="fa fa-lock fa-lg"></i> <input
							class="form-control required" type="password" placeholder="请输入密码" id="register_password" name="password" />
					    <span></span>
					</div>
					<div class="form-group" style="height:50px;">
						<i class="fa fa-check fa-lg"></i> 
						<input
							class="form-control required" type="password"
							placeholder="请重新输入密码" name="rpassword" />
							<span></span>
					</div>
					<div class="form-group" style="height:50px;">
						<i class="fa fa-mobile fa-lg"></i> <input
							class="form-control phone required" type="text" placeholder="请输入手机号"
							name="mobile" />
							<span></span>
					</div>
					
					<div class="form-group" style="height:55
					px;">
						<i class="fa fa-envelope fa-lg"></i> <input
							class="form-control eamil required" type="text" placeholder="请输入邮箱"
							name="email" />
							<span></span>
					</div>
					<div class="form-group">
						<input type="button" id="register_btn" class="btn btn-success pull-right"
							value="注册"  /> 
						<input type="button"
							class="btn btn-info pull-left" id="back_btn" value="返回" />
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="${ctxStaticB}/js/register/main.js"></script>
	<script>
	$("#back_btn").click(function(){
		history.go(-1);
	}); 
	// registValidate();//注册验证 
	 
	</script>
</body>
</html>
