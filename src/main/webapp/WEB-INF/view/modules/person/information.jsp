<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<link rel="shortcut icon" href="${ctxStaticB}/images/ico.ico" type="image/x-icon" />

  <meta name="description" content="啾唧网 方便快捷，物美价廉，更快送达，诚信服务" />
  <meta name="keywords" content="啾唧商品页" />
<title>啾唧-个人中心</title> 

<%
String rootFile = request.getScheme()+"://"+request.getServerName()+":8088/file";
String rootFileApp = request.getScheme()+"://"+request.getServerName()+":8088/app"; 

%>

<link rel="stylesheet" href="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/css/bootstrap.css" type="text/css" /> <link rel="stylesheet" href="${ctxStaticB}/css/goods.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctxStaticB}/module/main/css/main.css"/> 
<link rel="stylesheet" href="${ctxStaticB}/module/homepage/css/base.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/module/head/css/head.css" type="text/css" />
<link rel="stylesheet" href="${ctxStatic}/plugin/jqueryui/jquery-ui-1.12.1.custom/jquery-ui.css"> 
<link rel="stylesheet" href="${ctxStaticB}/css/goods.css" type="text/css" /> 

<script src="${ctxStatic}/plugin/jquery/jquery-1.11.3/jquery-1.11.3.min.js" type="text/javascript"></script>  
<script src="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/js/bootstrap.js"></script>
<script src="${ctxStatic}/plugin/jqueryui/jquery-ui-1.12.1.custom/jquery-ui.js"></script>

<script src="${ctxStatic}/plugin/js/browser.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctxStaticB}/js/responsive.tabs.js"></script> 
 


 
<script type="text/javascript">
var ctx ='${ctx}'; 
	function  showImg(x){ 
		var top = $(x).offset().top+15;
		var left = $(x).offset().left
		var window_w = $(window).width();
		var container_w = $(".daohang").width(); 
		var left = (window_w-container_w)/2; 
		$(".daohang").css({'left':left,'top':top});
		$(".daohang").show();
		 $(".daohang").on("mouseleave", function () {
             $(".daohang").hide();
         });
	}
	function hideImg(){
		 setTimeout(function () {
			 if (!$(".daohang:hover").length) {
				 $(".daohang").hide(); 
             } 
         }, 100); 
	} 
</script>
</head>
<body>

<%@include file="/WEB-INF/view/modules/homemain/header.jsp"%>

 

<div style="width:100%;margin:20px auto">	
    <div class="container" style="width:1080px;height:650px;">  
		<div class="row"> 
			<div class="col-xs-3" id="myScrollspy">
	            <ul class="nav nav-tabs nav-stacked" class="affix">
	            
	                <li class="active"><a href="javascript:void(0)" onclick="toMenuContent(this)" id="personal">个人中心</a></li>
	                <li><a href="javascript:void(0)" onclick="toMenuContent(this)" id="myOrder">我的订单</a></li>
	                <li><a href="javascript:void(0)" onclick="toMenuContent(this)" id="deliveryAddress">收货地址</a></li>
	                <li><a href="javascript:void(0)" onclick="toMenuContent(this)" id="myCollection">我的收藏</a></li> 
	            </ul>
	        </div>
	         <div class="col-xs-9" id="content" >
	         </div>
		</div>
	</div>
</div>



<%@include file="/WEB-INF/view/modules/homemain/footer.jsp"%>

<!-- ------------------------------------------------------- -->
	<!-- <div class="footer">
		<div class="footer-content">
			<div class="cooperation">
				<ul>
					<li><a href="javascript:alert('功能暂未开放')">商家入驻</a></li>
					<li><a href="javascript:alert('功能暂未开放')">销售联盟</a></li>
					<li><a href="javascript:alert('功能暂未开放')">关于我们</a></li>
					<li><a href="javascript:alert('功能暂未开放')">商品专题</a></li>
					<li><a href="javascript:alert('功能暂未开放')">热门搜索</a></li>
					<li><a href="javascript:alert('功能暂未开放')">服务热线</a></li>
				</ul>
			</div>
			<div class="copy">&copy;2000-2016&nbsp;&nbsp;啾唧在线电子商务有限公司&nbsp;&nbsp;&nbsp;版权所有 皖ICP备16007801号</div>
		</div>
	</div> -->
	
	
<!-- ---------------- -->
<div id="recordContact" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 
</div><!-- /.modal -->  


<script src="${ctxStaticB}/js/header.js" type="text/javascript"></script>  
 

<!--preview end-->
<script type="text/javascript">
var F_ClsId;
$(function(){
	
	 $("[rel=erweima]").popover({
         trigger:'manual',
         placement : 'bottom', //placement of the popover. also can use top, bottom, left or right
         title : '<div style="text-align:center; color:red; text-decoration:underline; font-size:14px;">啾唧App</div>', //this is the top title bar of the popover. add some basic css
         html: 'true', //needed to show html of course
         content : '<div id="popOverBox"><img src="<%=rootFileApp%>/app.png" width="251" height="200" /></div>',	
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
	 
    $( "#autocomplete" ).autocomplete({
        source: ctx+"/productCtrl/searchProduct.do", 
        minLength: 1, 
        width: 310,
        scrollHeight: 300,
        formatItem: function(row, i, max, term) {
      	     return "<table width='400px'><tr><td align='left'>" + row.Key + "</td><td align='right'><font style='color: #009933; font-family: 黑体; font-style: italic'>约" + row.Value + "个宝贝</font>&nbsp;&nbsp;</td></tr></table>";
           // return row.name.replace(new RegExp("(" + term + ")", "gi"), "<strong>$1</strong>") + "<br><span style='font-size: 80%;'>Email: &lt;" + row.to + "&gt;</span>";

         },
        select: function( event, ui ) {
      	  F_ClsId = ui.item.id;
            //alert( "Selected: " + ui.item.value + " aka " + ui.item.id );
        }, 
     	  response: function( event, ui ) {
     		 console.info(ui);
        }
      }); 
      
      
      $("#submit").click(function(){ 
      	if(F_ClsId!=undefined){
      		window.open("${ctx}/productCtrl/toProjectListPage.do?f_clsId="+F_ClsId,"_self");
      	} 
      }); 
	       
	$("#submitRecordInfo").click(function(){
		//$('#newAdd').attr("data-target","xmgk-input");
		//$("#submitRecordInfo").attr("href","#recordContact");  
		var productName = $(".productName").text();
		var productId = $(".productId").text();
		var productPrice = $(".origin-price").text(); 
		var productDesc = $(".desc").text();
		window.open("${ctx}/payCtrl/toIndex.do?productName="+productName+"&productId="+productId+"&productPrice="+productPrice+"&productDesc="+productDesc); 
	}); 
}); 

function toMenuContent(id){
	console.info(id);
	
	$("ul.nav-tabs li").removeClass("active");
	$(id).parent().addClass("active");
	
	id=$(id).attr("id"); 
	if(id=='personal'){
		$.get("${ctx}/homePageCtrl/toPersonal.do",function(data,textStatus){
			$("#content").empty(); 
            $("#content").append(data); 
        });     
	}else if(id=='deliveryAddress'){
		$.get("${ctx}/homePageCtrl/toDeliveryAddress.do",function(data,textStatus){
			$("#content").empty(); 
            $("#content").append(data); 
        });
	}else if(id=='myCollection'){
		$.get("${ctx}/homePageCtrl/toMyCollection.do",function(data,textStatus){
			$("#content").empty(); 
            $("#content").append(data); 
        });
	}else if(id=='myOrder'){
	  $.get("${ctx}/tborder/tbOrderController/toMyOrder.do",function(data,textStatus){ 
		    $("#content").empty(); 
            $("#content").append(data); 
        });
	}
}

toMenuContent($('#personal'));

</script>
</body>
</html>