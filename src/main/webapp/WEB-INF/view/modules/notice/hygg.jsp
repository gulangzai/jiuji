<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" /> 
<meta name="description" content="啾唧网 方便快捷，物美价廉，更快送达，诚信服务" />
<meta name="keywords" content="啾唧帮助" />
<title>啾唧-新手帮助</title>  

<link rel="stylesheet" href="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/css/bootstrap.css" type="text/css" /> 
<link rel="shortcut icon" href="${ctxStaticB}/images/logo.ico" type="image/x-icon" /> 
<link rel="stylesheet" href="${ctxStaticB}/module/head/css/head.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/module/homepage/css/base.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctxStaticB}/module/main/css/main.css"/> 
<link rel="stylesheet" href="${ctxStatic}/plugin/jqueryui/jquery-ui-1.12.1.custom/jquery-ui.css">  

<script src="${ctxStatic}/plugin/jquery/jquery-1.11.3/jquery-1.11.3.min.js"></script>
<script src="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/js/bootstrap.js"></script>
<script src="${ctxStatic}/plugin/jqueryui/jquery-ui-1.12.1.custom/jquery-ui.js"></script>


</head>

<body>
<jsp:include page="/WEB-INF/view/modules/homemain/headerThree.jsp"/>


	<div class="container">

		<div class="row">
			
			
  <jsp:include page="/WEB-INF/view/modules/notice/left.jsp"/>
			


			<div class="col-xs-9">
				<!-- 导航写 -->
				<div class="row">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="${ctx}">首页</a></li>


							<li><a href="${ctx}/homePageCtrl/help/toIndex.do">帮助中心</a></li>
							<li class="active">新手帮助</li>

						</ol>
					</div>
				</div>

				<div class="row">
					<div class="col-xs-12">
						<strong>新手帮助</strong>
						<hr>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">


						<p class="p0" style="text-align: justify;">1、登陆</p>
						<p class="p0" style="text-align: justify;">
							可以点击顶上角的登陆链接,转到登陆页面.如果没有账号则需要注册.或者使用第三方信任登陆.</p>
						<p class="p0" style="text-align: justify;">
							<img
								src="${ctxStaticB}/images/help/loginShow.png"
								width="553" height="258" alt="">&nbsp;
						</p>
						<p class="p0" style="text-align: justify;">&nbsp;</p>
						<p class="p0" style="text-align: justify;">
							2<span>、用户注册页面如下.</span>
						</p>
						<p class="p0" style="text-align: justify;">
							<img
								src="${ctxStaticB}/images/help/registerShow.png"
								width="554" height="367" alt="">&nbsp;
						</p> 
						<p class="p0" style="text-align: justify;">3、查找商品</p>
						<p class="p0" style="text-align: justify;">
							您可以将鼠标移动到左侧的吸附菜单上,选择您想要购买的商品类目.或在收索栏里收索商品</p>
						<p class="p0" style="text-align: justify;">
							<img
								src="${ctxStaticB}/images/help/searchShow.png"
								width="554" height="376" alt="">&nbsp;
						</p>
						<p class="p0" style="text-align: justify;">&nbsp;</p> 
						<p class="p0" style="text-align: justify;">&nbsp;</p>
						<p class="p0" style="text-align: justify;">
							4<span>、咨询卖家（店小二）.同样的,如果您在购买的过程中对商品有任何的疑问,
						</p>
						<p class="p0" style="text-align: justify;">
							您也可以咨询卖家,点击QQ图标将弹出卖家的</span><span>QQ</span><span>临时会话框，您可以方便的和卖家进行沟通。</span>
						</p>
						
						<p class="p0" style="text-align: justify;">
							<img
								src="${ctxStaticB}/images/help/helpShow.png"
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
						<p class="p0" style="text-align: justify;">
							6<span>、确认订单页面,点击提交订单则系统会跳转到支付宝网关进行安全支付.同时在此页面也能输入您的附加要求,</span>
						</p>
						<p class="p0" style="text-align: justify;">
							 卖家在处理您的订单时候会和您进行确认.</span>
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




