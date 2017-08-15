<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ page  import="org.jasig.cas.client.util.AbstractCasFilter"%>
<%@ page  import="org.jasig.cas.client.validation.Assertion"%>
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" />

<link rel="stylesheet" href="${ctxStaticB}/css/head.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/css/homepage/base.css" type="text/css" />
<link rel="shortcut icon" href="${ctxStaticB}/images/logo.ico" type="image/x-icon" /> 
<% 
String rootFileApp = request.getScheme()+"://"+request.getServerName()+":8088/app";  
String rootFile = "https://www.jiujichina.com/fileSystem";
String appSystem = "https://www.jiujichina.com/appSystem";
%>
 
 <nav class = "navbar navbar-default" role = "navigation">  
     <div class="container">
        <div class="navbar-header">  
            <button type="button" class="navbar-toggle" data-toggle = "collapse"  data-target = "#target-menu">  
                <span class="sr-only">qieh</span>  
                <span class="icon-bar"></span>  
                <span class="icon-bar"></span>  
                <span class="icon-bar"></span>    
            </button>  
            <a class="navbar-brand" href="${ctx}/homePageCtrl/toHomePage.do" target="_self">啾唧网</a>  
        </div>  
        <div class="collapse navbar-collapse" id = "target-menu">  
            <ul class="nav navbar-nav">  
                <c:choose>
                <c:when test="${F_USER_ID==''||empty F_USER_ID}">
                <li class="active"><a href="${ctx}/homePageCtrl/toLogin.do" target="_self">请登录</a></li>
                </c:when>  
                <c:otherwise>
                     <li><a href="javascript:void(0)">${USERNAME}</a></li>
				     <li><a href="${ctx}/userCtrl/logout.do" target="_self">登出</a></li>
				</c:otherwise>
				</c:choose> 
                <li><a href="${ctx}/homePageCtrl/toRegister.do" target="_self">免费注册</a></li>  
                <li><a href="${ctx}/homePageCtrl/toInformation.do">个人中心</a></li> 
                <li><a id="shopCart" href="${ctx}/tbshopcar/tbShopCarController/list.do" target="_blank">购物车</a></li> 	
                <li><a href="javascript:alert('功能暂未开放')"  onMouseOut="hideImg()"  onmouseover="showImg(this)">网站导航</a></li> 
                <li><a rel="erweima" href="<%=appSystem%>/H54B3F430_0802221451.apk">手机下载</a></li> 		 
           </ul> 
        </div>  
        </div> 
</nav> 





<div class="container daohang" style="position:absolute;z-index:99999;display:none;width:80%;background:white">
  <div class="row" style="padding:10px;">
              <div class="col-md-4" style="border-right:1px solid black">
                <h3>电商平台</h3>
                <div class="row" style="margin-top:10px;">
                <div class="col-md-4">淘宝</div>
				<div class="col-md-4">天猫</div>
				<div class="col-md-4">聚划算</div>	
				</div>	
				
			    <div class="row"  style="margin-top:10px;">
                <div class="col-md-4">爱逛街</div>
				<div class="col-md-4"></div>
				<div class="col-md-4"></div>	
				</div>
			   
			    <div class="row"  style="margin-top:10px;">
                <div class="col-md-4">淘女郎</div>  
				</div> 
              </div>
              <div class="col-md-4" style="border-right:1px solid black">
                  <h3>金融平台</h3>
                <div class="row" style="margin-top:10px;">
                <div class="col-md-4">支付宝</div>
				<div class="col-md-4">网商银行</div>
				<div class="col-md-4"></div>	
				</div>	
				
			    <div class="row"  style="margin-top:10px;">
                <div class="col-md-4">阿里钱盾</div>
				<div class="col-md-4"></div>
				<div class="col-md-4"></div>	
				</div>
			   
			    <div class="row"  style="margin-top:10px;">
                <div class="col-md-4">蚂蚁聚宝</div>
				<div class="col-md-4"></div>
				<div class="col-md-4"></div>	
				</div> 
              </div>
              <div class="col-md-4">
                  <h3>生活服务</h3>
                <div class="row" style="margin-top:10px;">
                <div class="col-md-4">淘宝视频</div>
				<div class="col-md-4">淘宝电影</div>
				<div class="col-md-4">虾米音乐</div>	
				</div>	
				
			    <div class="row"  style="margin-top:10px;">
                <div class="col-md-4">亲宝贝</div>
				<div class="col-md-4">闲鱼</div>
				<div class="col-md-4">生活汇</div>	
				</div>
			   
			    <div class="row"  style="margin-top:10px;">
                <div class="col-md-4">钉钉</div>
				<div class="col-md-4">高德地图</div>
				<div class="col-md-4"></div>	
				</div> 
               </div>
    </div> 
</div>


<script>
$(function() {
	

	
	
	 $("[rel=erweima]").popover({
         trigger:'manual',
         placement : 'bottom', //placement of the popover. also can use top, bottom, left or right
         title : '<div style="text-align:center; color:red; text-decoration:underline; font-size:14px;">啾唧App</div>', //this is the top title bar of the popover. add some basic css
         html: 'true', //needed to show html of course
         content : '<div id="popOverBox"><img src="<%=appSystem%>/app.png" width="251" height="200" /></div>',	
         animation: false
     }).on("mouseenter", function () {
                 var _this = this;
                 $(this).popover("show");
                 $(this).siblings(".popover").on("mouseleave", function () {
                     $(_this).popover('hide');
                 });
             }).on("mouseleave", function () {
                 var _this = this;
                 setTimeout(function () {
                     if (!$(".popover:hover").length) {
                         $(_this).popover("hide")
                     }
                 }, 100);
    });
	 
	 
	 $("[rel=websiteNavigation]").popover({
         trigger:'manual',
         placement : 'bottom', //placement of the popover. also can use top, bottom, left or right
        // title : '<div style="text-align:center; color:red; text-decoration:underline; font-size:14px;">啾唧App</div>', //this is the top title bar of the popover. add some basic css
         html: 'true', //needed to show html of course
         content : function() {  
           return $(".container1").html();  
         },  
         animation: false
     }).on("mouseenter", function () {
                 var _this = this;
                 $(this).popover("show");
                 $(this).siblings(".popover").on("mouseleave", function () {
                     $(_this).popover('hide');
                 });
             }).on("mouseleave", function () {
                 var _this = this;
                 setTimeout(function () {
                     if (!$(".popover:hover").length) {
                         $(_this).popover("hide")
                     }
                 }, 100);
    });
	  
});

function showImg(x) {
	var top = $(x).offset().top + 15;
	var left = $(x).offset().left
	var window_w = $(window).width();
	var container_w = $(".daohang").width();
	var left = (window_w - container_w) / 2;
	$(".daohang").css({
		'left' : left,
		'top' : top
	});
	$(".daohang").show();
	$(".daohang").on("mouseleave", function() {
		$(".daohang").hide();
	});
}
function hideImg() {
	setTimeout(function() {
		if (!$(".daohang:hover").length) {
			$(".daohang").hide();
		}
	}, 100);
}

</script>
	 
