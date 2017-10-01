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
<title>通行证-用户绑定</title>
<link rel="shortcut icon" href="${ctxStaticB}/images/ico.ico" type="image/x-icon" />
<!--用百度的静态资源库的cdn安装bootstrap环境-->
<!-- Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/css/bootstrap.css" type="text/css" />  
<!-- 在bootstrap.min.js 之前引入 -->
<script src="${ctxStaticB}/assets/sys_resources/js/jquery.js"></script>   


<!-- Bootstrap 核心 JavaScript 文件 -->
<script src="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/js/bootstrap.js"></script>  
<script src="${ctxStaticB}/assets/sys_resources/plugins/jquery-validation/jquery-validation-1.11.1/jquery.validate.js"> </script><!---新添加--->
<script src="${ctxStaticB}/assets/sys_resources/js/jquery.validate.message_cn.js"></script><!---新添加--->
<style>
a:hover{
   text-decoration:none; 
   color:green;
   font-size:14px;
 }
</style>
 
</head>
<body>


 <iframe  src="${ctx}/homePageCtrl/toHeader.do" height="81" width="100%" scrolling="no" style="border:0px solid red"></iframe>
 
	<div class="container">
	
         <h3 class="form-title">绑定账号 您已成功验证了QQ账号!马上绑定啾唧账号，下次登录更便捷哦</h3> 
		
		
		<ul id="myTab" class="nav nav-tabs">
			<li class="active">
				<a href="#home" data-toggle="tab">
					您已有啾唧账号
				</a>
			</li>
			<li><a href="#ios" data-toggle="tab">您没有啾唧账号</a></li> 
        </ul>

		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="home">
			    <input type="hidden" value="${openID}" name="F_OPEN_ID" id="F_OPEN_ID"/>
				 <div class="form" style="">
				 
							<form class="form-horizontal" id="haveAccountUserQQbingForm" action="">
								
								<div class="col-xs-12 col-sm-12 col-md-12">
									 
									<div class="form-group">
									     <div class="col-xs-12 col-sm-6 col-md-3">
											<i class="fa fa-mobile fa-lg"></i> 
											<input
												class="form-control phone required" 
												type="text" 
												placeholder="请输入已注册的手机号"
												name="mobile" />
												<span></span>
										 </div>
									</div>
									
								 
									
									<div class="form-group">
									    <div class="col-xs-12 col-sm-6 col-md-3">
									          <input type="text" 
                                               name="code" 
                                               class="form-control required" 
                                               placeholder="动态密码"/>
									    </div>
									   <div class="col-sm-6">
									      <button type="button" class="btn btn-sm btn-success" id="haveAccountSendCode">获取手机动态密码</button>
									   </div>
									 
									</div>
									
									<div class="form-group">
									    <div class="col-xs-12 col-sm-12 col-md-12">
									       <input type="text" id="have_account_btn" class="btn btn-success"  value="立即绑定"  />  
									    </div> 
									</div>
									
								</div>
							</form>
		        </div>
			</div>
			
			
			<div class="tab-pane fade" id="ios">
			
					<div class="form" style="">
						 
									<form class="form-horizontal" id="have_no_account_form" action="">
										
										<div class="col-xs-12 col-sm-12 col-md-12">
											 
											 <div class="form-group" style="height:50px;">
												   <div class="col-xs-12 col-sm-12 col-md-3">
													<i class="fa fa-user fa-lg"></i> 
													<input
														class="form-control required" type="text" placeholder="请输入用户名"
														name="username" autofocus="autofocus" />
														<span></span>
													 </div>
											</div>
					
										 <div class="form-group">
												<div class="col-xs-12 col-sm-12 col-md-3">
												    <i class="fa fa-envelope fa-lg"></i> 
													<input
														class="form-control eamil required" type="text" placeholder="请输入邮箱"
														name="email" />
														<span></span>
												</div> 
									     </div>
											
											<div class="form-group" style="height:50px;">
											   <div class="col-xs-12 col-sm-12 col-md-3">
												<i class="fa fa-mobile fa-lg"></i> 
												<input
													class="form-control phone required" type="text" placeholder="请输入手机号"
													name="mobile" />
													<span></span>
											    </div>
											</div>
					
											<div class="form-group">
												<div class="col-xs-12 col-sm-12 col-md-3">
												    <i class="fa fa-envelope fa-lg"></i> 
													<input
														class="form-control code required" 
														type="text" placeholder="短信校验码"
														name="code" />
														<span></span>
												</div>
												<div>
												    <button class="btn btn-sm btn-success" id="haveNoAccountSendCode">获取短信校验码</button>
												</div> 
											</div>
											
										    <div class="form-group" style="height:50px;">
										         <div class="col-xs-12 col-sm-12 col-md-3">
										             <i class="fa fa-lock fa-lg"></i> 
										             <input class="form-control required" type="password" placeholder="请输入密码" id="register_password" name="password" />
											        <span></span>
										         </div> 
											</div>
											
											<div class="form-group" style="height:50px;">
												    <div class="col-xs-12 col-sm-12 col-md-3">
													<i class="fa fa-check fa-lg"></i> 
													<input
														class="form-control required" type="password"
														placeholder="请重新输入密码" name="rpassword" />
														<span></span>
													</div>
											</div>
											
											<div class="form-group">
											    <div class="col-sm-12">
											       <input type="text" id="have_no_account_btn" class="btn btn-success"  value="立即注册并绑定"  />  
											    </div> 
											</div>
											
											<div class="form-group">
											    <div class="col-sm-12">
											       <span><a href="${ctx}/homePageCtrl/help/toZcxy.do" target="_blank">《啾唧网用户协议》</a></span> 
											    </div> 
											</div>
											
											
										</div>
									</form>
				        </div>
		        
				   
			</div>
			 
			 
		</div>


		
		
		
		
	</div>
	<script type="text/javascript" src="${ctxStaticB}/module/homepage/js/bingUser.js"></script>

	<script>
	$("#back_btn").click(function(){
		history.go(-1);
	}); 
	// registValidate();//注册验证 
	 
	</script>
</body>
</html>
