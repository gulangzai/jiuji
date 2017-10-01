<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" /> 
<meta name="description" content="啾唧网 方便快捷，物美价廉，更快送达，诚信服务" />
<meta name="keywords" content="啾唧帮助" />
<title>啾唧-支付宝支付</title>  


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
			
			
	   <jsp:include page="/WEB-INF/view/modules/help/left.jsp"/>
			


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
						<strong>支付宝支付</strong>
						<hr>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">


						<p class="p0" style="text-align: justify;"></p>
						<p class="p0" style="text-align: justify;">
							1.点击我的购物车，勾选要买的商品提交订单。</p>
						<p class="p0" style="text-align: justify;">
							<img
								src="${ctxStaticB}/images/help/shopCarShow.png"
								width="553" height="258" alt="">&nbsp;
						</p>
						<p class="p0" style="text-align: justify;">&nbsp;</p>
						<p class="p0" style="text-align: justify;">
							<span>2.提交订单后,扫描二维码支付。</span>
						</p>
						<p class="p0" style="text-align: justify;">
							<img
								src="${ctxStaticB}/images/help/zhifubaoShow.png"
								width="554" height="367" alt="">&nbsp;
						</p>
						<p class="p0" style="text-align: justify;">&nbsp;</p>
						 
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




