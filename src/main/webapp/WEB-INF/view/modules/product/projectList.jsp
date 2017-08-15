<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %>   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="description" content="啾唧网 方便快捷，物美价廉，更快送达，诚信服务" />
<meta name="keywords" content="啾唧商品页" />
<link rel="shortcut icon" href="${ctxStaticB}/images/logo.ico" type="image/x-icon" />

<title>啾唧-商品页</title>

<%
//String rootFile = request.getScheme()+"://"+request.getServerName()+":8088/file";
String rootFileApp = request.getScheme()+"://"+request.getServerName()+":8088/app"; 
String rootFile = "https://www.jiujichina.com/fileSystem";

%>

<link rel="stylesheet" href="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/css/bootstrap.css" type="text/css" /> <link rel="stylesheet" href="${ctxStaticB}/css/goods.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/css/main.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/css/homepage/base.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/css/head.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/css/productList.css" type="text/css" />
<link rel="stylesheet" href="${ctxStatic}/plugin/jqueryui/jquery-ui-1.12.1.custom/jquery-ui.css"> 

<script src="${ctxStatic}/plugin/jquery/jquery-1.11.3/jquery-1.11.3.min.js"></script>
<script src="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/js/bootstrap.js"></script>
<script src="${ctxStatic}/plugin/jqueryui/jquery-ui-1.12.1.custom/jquery-ui.js"></script>


<script src="${ctxStaticB}/js/header.js" type="text/javascript"></script>
<script type="text/javascript">
var ctx ='${ctx}';
/* $(document).ready(function(){ 
	$('.tabs').respTabs({
		responsive : false
	});
	
}); */
     $(function(){
         //通用头部搜索切换
       /*  $('#search-hd .search-input').on('input propertychange',function(){
             var val = $(this).val();
             if(val.length > 0){
                 $('#search-hd .pholder').hide(0);
             }else{
                 var index = $('#search-bd li.selected').index();
                 $('#search-hd .pholder').eq(index).show().siblings('.pholder').hide(0);
             }
         })  */
     }) 
     
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
  
 <jsp:include page="/WEB-INF/view/modules/homemain/headerFirst.jsp"></jsp:include>
	 
	
 <div style="width:100%;margin:0px auto">
	<div class="container" style="width:1080px;background:white">
		  <div class="row"> 
		  
		              <div class="col-md-2">
		                <a href="${ctx}/homePageCtrl/toHomePage.do"><img src="${ctxStaticB}/images/homepage/logo2.png" width="145" alt="" /></a>
						</div>
						<div class="col-md-10">
		                       <div class="search-form" style="margin:10px auto">
									<div id="search-bd" class="search-bd">
										<ul>
											<li class="selected">找商品</li>
											<!-- <li>找商家</li> -->
										</ul>
									</div>
									<div id="search-hd" class="search-hd" style="height: 40px">
										<div class="search-bg" style="height: 32px;margin-left: 2px;">
										<input type="text" id="autocomplete" class="search-input" style="height: 34px;" placeholder="生鲜水果半价抢疯"/>  
									     </div>
										<button id="submit" class="btn-search" value="搜索">搜索</button>
									</div> 
									 <div id="selction-ajax"></div> 
								</div> 
						</div> 
		    </div> 
    </div>
</div>
	
	 
 
      <div class="container" align="center">
           <div class="row">  
              <c:forEach items="${projectPictureResults}" var="projectPictureResult">
               <div  class="col-xs-3 col-md-3 col-sm-3" style="border:1px solid rgb(229,229,299);padding:20px;">
                         <div style="display:none" id="${projectPictureResult.tproduct.F_PRODUCT_ID}"></div>  
                      <a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${projectPictureResult.tproduct.F_PARENT_SKU}">
                         <img id="img" src="${projectPictureResult.tproduct.F_PATH}" width=200px height=180px></a>    
                <!--  <div id="商品名" class="class="col-xs-1 col-md-1 col-sm-1" style="margin:5px 0px;text-align:left;color:rgb(153,153,153);font-size:14px;font-weight:400xp">
                      <p>${projectPictureResult.tproduct.F_PRODUCTNAME}</p>
                      </div> 
                       -->
                      <hr/>
                      <div class="col-xs-12 col-md-12 col-sm-12" style="height: 25px;margin-top:5px;padding:0px;"> 
                    
                             <div class="col-xs-4 col-md-4 col-sm-4"><span style="color:red;font-size:20px;"> ¥:${projectPictureResult.tproduct.F_PRICE}</span></div> 
	                         <div class="col-xs-8 col-md-8 col-sm-8" style="text-align:right;padding-right:0px;">
	                             <div class="col-xs-6 col-md-5 col-sm-5 btn btn-default btn-md"   onclick="window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url='+encodeURIComponent('${ctx}/productCtrl.toSingleProduct?f_ProductId=${projectPictureResult.tproduct.F_PRODUCT_ID}')+
	                          '&title=校园网购平台,一切为了学生服务! &desc=我在校园通上卖${projectPictureResult.tproduct.F_ProductName}, ${projectPictureResult.tproduct.F_PRODUCTDESC} ,有人想要吗&pics='+encodeURIComponent('<%=rootFile%>/${projectPictureResult.tbPictures[0].PATH}')+'&style=203&width=98&height=22')">分享</div>                                        
	                             <div class="col-xs-5 col-md-5 col-sm-5  btn btn-default btn-md" style="margin-left:15px;" onclick="zan(this)">赞</div>
	                         </div>
                       </div> 
                 </div> 
              </c:forEach> 
           </div> 
           <form action="${ctx}/productCtrl/toSingleProduct.do">
           <input type="hidden" name="goodType" value=""/>
           <div>
<%--                 <span><a href="${ctx}/web/querySingleGoodBase.goodBaseCtrl?goodType=${goodType}&currentPage=${pageBean.currentPage-1}"> 上一页</a></span>
                <span><a href="${ctx}/web/querySingleGoodBase.goodBaseCtrl?goodType=${goodType}&currentPage=${pageBean.currentPage+1}">下一页</a></span>
                <span>共 ${pageBean.counts} 页,到<input type="text" name="currentPage" size="3">页</span><input  type="button" value="确定" onclick="submit()"/>   --%>   
           </div>
           </form>  
      </div>  
  
  
 <jsp:include page="/WEB-INF/view/modules/homemain/footer.jsp"/>  
	
	
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

  
 </body>
  
 <%--  <script src="${ctxStatic}/js/header.js" type="text/javascript"></script> --%>
<script type="text/javascript">
$(document).ready(function(){
 
});
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
	      
});
</script>

</html>
