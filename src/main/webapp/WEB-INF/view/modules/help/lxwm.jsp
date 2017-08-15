<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" /> 
<meta name="description" content="啾唧网 方便快捷，物美价廉，更快送达，诚信服务" />
<meta name="keywords" content="啾唧帮助" />
<title>啾唧-联系我们</title>  


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
							<li class="active">联系我们</li>

						</ol>
					</div>
				</div>

				<div class="row">
					<div class="col-xs-12">
						<strong>联系我们</strong>
						<hr>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">

<span style="color:#333333;font-family:Ubuntu, Tahoma, 'Helvetica Neue', Helvetica, Arial, sans-serif;line-height:2;background-color:#FFFFFF;font-size:14px;">联系方式</span><br>
<span style="color:#333333;font-family:Ubuntu, Tahoma, 'Helvetica Neue', Helvetica, Arial, sans-serif;line-height:2;background-color:#FFFFFF;font-size:14px;">啾唧在线电子商务有限公司</span><br>
<span style="color:#333333;font-family:Ubuntu, Tahoma, 'Helvetica Neue', Helvetica, Arial, sans-serif;line-height:2;background-color:#FFFFFF;font-size:14px;">电话：15021274597</span><br>
<span style="color:#333333;font-family:Ubuntu, Tahoma, 'Helvetica Neue', Helvetica, Arial, sans-serif;line-height:2;background-color:#FFFFFF;font-size:14px;">邮箱：gulangzai@foxmal</span><br>
 
					 
					</div>
				</div>
			</div>

		</div>
	</div>

<jsp:include page="/WEB-INF/view/modules/homemain/footer.jsp"/>

</body>
</html>




