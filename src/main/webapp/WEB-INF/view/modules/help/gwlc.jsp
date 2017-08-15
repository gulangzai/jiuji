<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" /> 
<meta name="description" content="啾唧网 方便快捷，物美价廉，更快送达，诚信服务" />
<meta name="keywords" content="啾唧帮助" />
<title>啾唧-购物流程</title>  

<link rel="stylesheet" href="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/css/bootstrap.css" type="text/css" /> 
<link rel="shortcut icon" href="${ctxStaticB}/images/logo.ico" type="image/x-icon" /> 
<link rel="stylesheet" href="${ctxStaticB}/css/head.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/css/homepage/base.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/css/main.css" type="text/css" />
<link rel="stylesheet" href="${ctxStatic}/plugin/jqueryui/jquery-ui-1.12.1.custom/jquery-ui.css">  

<script src="${ctxStatic}/plugin/jquery/jquery-1.11.3/jquery-1.11.3.min.js"></script>
<script src="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/js/bootstrap.js"></script>
<script src="${ctxStatic}/plugin/jqueryui/jquery-ui-1.12.1.custom/jquery-ui.js"></script>

</head>

<body>
<jsp:include page="/WEB-INF/view/modules/homemain/headerThree.jsp"/>


 <div class="container">
		
		<div class="row">
			 
	   <jsp:include page="/WEB-INF/view/modules/help/left.jsp"/>
			
			
				<div class="col-xs-9">
					<!-- 导航写 -->
					<div class="row">
						<div class="col-xs-12">
							<ol class="breadcrumb">
							  <li><a href="${ctx}">首页</a></li>
							  
							  
							  	  <li><a href="${ctx}/homePageCtrl/help/toIndex.do">帮助中心</a></li>
								  <li class="active">购物流程</li>
							  
							</ol>
						</div>
					</div>
		
					<div class="row">
						<div class="col-xs-12">
							<strong>购物流程</strong>
							<hr>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">    
		                        <p>
									1<span>、点击<a href='${ctx}/homePageCtrl/toRegister.do'>注册</a>,页面如下。</span> 
								</p>
								<p class="p0" style="text-align: justify;">&nbsp;填写用户名,密码,手机号,邮箱</p>
								<p class="p0" style="text-align: justify;">
									<img
										src="${ctxStaticB}/images/help/registerShow.png"
										width="554" height="367" alt="">&nbsp;
								</p>   
								<p class="p0" style="text-align: justify;">
									2、点击顶上角的<a href='${ctx}/homePageCtrl/toLogin.do'>登陆</a>链接登录系统</p>
								<p class="p0" style="text-align: justify;">
									<img
										src="${ctxStaticB}/images/help/loginShow.png"
										width="553" height="258" alt="">&nbsp;
								</p> 
								
								<p class="p0" style="text-align: justify;">	</p>
								<p class="p0" style="text-align: justify;">
									3、选择您想要购买的商品类目.或在新品上市,热门商品,产品特卖模块中点击任何商品</p>
								<p class="p0" style="text-align: justify;">
									<img
										src="${ctxStaticB}/images/help/searchShow.png"
										width="554" height="376" alt="">&nbsp;
								</p>
								<p class="p0" style="text-align: justify;">&nbsp;</p>  
								<p class="p0" style="text-align: justify;">
									4、<span>在单个商品页上点击立即购买,或加入购物车</span>
								</p>
								<p class="p0" style="text-align: justify;">
									<img
										src="${ctxStaticB}/images/help/goodShow.png"
										width="554" height="360" alt="">&nbsp;
								</p> 
								<p class="p0" style="text-align: justify;">&nbsp;</p>
								<p class="p0" style="text-align: justify;">
									5<span>、购物车操作.您可以在提交订单前对购物车中的商品进行任何的增减,收藏操作,或者删除某个商品.确认无误后点击提交订单按钮.</span>
								</p>
								<p class="p0" style="text-align: justify;">&nbsp;</p>
								<p class="p0" style="text-align: justify;">
									<img
										src="${ctxStaticB}/images/help/shopCarShow.png"
										width="554" height="280" alt="">&nbsp;
								</p>
								<p class="p0" style="text-align: justify;">&nbsp;</p>
								<p class="p0" style="text-align: justify;">&nbsp;</p>
								<p class="p0" style="text-align: justify;">&nbsp;</p>
								<p class="p0" style="text-align: justify;">
									6<span>、确认订单页面,点击提交订单则系统会跳转到支付宝网关进行安全支付.同时在此页面也能输入您的附加要求,</span>
								</p>
								<p class="p0" style="text-align: justify;">
									 <span>卖家在处理您的订单时候会和您进行确认.</span>
								</p>
								<p class="p0" style="text-align: justify;">&nbsp;</p>
								<p class="p0" style="text-align: justify;">
									<img
										src="${ctxStaticB}/images/help/zhifubaoShow.png"
										width="554" height="386" alt="">&nbsp;
								</p>
								<p class="p0" style="text-align: justify;">&nbsp;</p>
								<p class="p0" style="text-align: justify;">&nbsp;</p>
								<p class="p0" style="text-align: justify;">&nbsp;</p>
						
						</div>
					</div>
				</div>
			
		</div>
	</div>
	
	
<jsp:include page="/WEB-INF/view/modules/homemain/footer.jsp"/>
</body>
</html>




