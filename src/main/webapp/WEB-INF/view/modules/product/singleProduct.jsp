<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<link rel="shortcut icon" href="${ctxStaticB}/module/main/images/logo.ico" type="image/x-icon" />

  <meta name="description" content="啾唧网 方便快捷，物美价廉，更快送达，诚信服务" />
  <meta name="keywords" content="啾唧商品页" />
<title>啾唧-商品页</title> 

<%
String rootFile = "https://www.jiujichina.com/fileSystem";
String rootFileApp = request.getScheme()+"://"+request.getServerName()+":8088/app"; 

%>

<link rel="stylesheet" href="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/module/product/css/goods.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/module/main/css/main.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/module/homepage/css/base.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/module/head/css/head.css" type="text/css" />
<link rel="stylesheet" href="${ctxStatic}/plugin/jqueryui/jquery-ui-1.12.1.custom/jquery-ui.css"> 
<link rel="stylesheet" href="${ctxStaticB}/module/product/css/goods.css" type="text/css" />

<script src="${ctxStatic}/plugin/jquery/jquery-1.11.3/jquery-1.11.3.min.js"></script>
<script src="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/js/bootstrap.js"></script>
<script src="${ctxStatic}/plugin/jqueryui/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="${ctxStatic}/plugin/js/browser.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctxStatic}/plugin/js/responsive.tabs.js"></script>
<script src="${ctxStaticB}/js_system/product/jquery.fly.min.js"></script>


 <style type="text/css">
 /* orange */
.orange {
	color: #fef4e9;
	border: solid 1px #da7c0c;
	background: #f78d1d;
	background: -webkit-gradient(linear, left top, left bottom, from(#faa51a), to(#f47a20));
	background: -moz-linear-gradient(top,  #faa51a,  #f47a20);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#faa51a', endColorstr='#f47a20');
}
.orange:hover {
	background: #f47c20;
	background: -webkit-gradient(linear, left top, left bottom, from(#f88e11), to(#f06015));
	background: -moz-linear-gradient(top,  #f88e11,  #f06015);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f88e11', endColorstr='#f06015');
}
.orange:active {
	color: #fcd3a5;
	background: -webkit-gradient(linear, left top, left bottom, from(#f47a20), to(#faa51a));
	background: -moz-linear-gradient(top,  #f47a20,  #faa51a);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f47a20', endColorstr='#faa51a');
}

.off{ border: 2px solid #f3d3d3;} 
.up{border: 2px solid red;} 

.choose{
   background-color:red;
}

 
 </style>
<script type="text/javascript">
var ctx ='${ctx}';
 
   
    var productList = ${productList};
    var choose_F_SKU = productList[0].F_SKU;
    var F_PARENT_SKU = productList[0].F_PARENT_SKU;
    var choose_color = "";
    var choose_size = "";
    var choose_F_PRODUCT_ID="0";

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
	
	/*选中操作*/
    function choose(x){  
    	if($(x).hasClass("choose")){  
    		$(x).removeClass("choose"); 
    	}else{  
    		var attrValue = $(x).attr("attrFProductUid"); 
        	$("div[attrFProductUid='"+attrValue+"']").each(function(){ 
        	      $(this).removeClass("choose");
        	      $(this).attr("class","off");
        	});  
    		$(x).addClass("choose"); 
    	}
    	
    	//alert($(x).text());
     
    	
    	//商品属性 
		if($("div[labelAttr='color']").length>0){ 
			var num = $("div[labelAttr='color']").length;
			var flag = false;
			for(var k=0;k<num;k++){
				if($($("div[labelAttr='color']")[k]).hasClass("choose")){ 
					flag=true; 
					choose_color=$($("div[labelAttr='color']")[k]).text();
					break;
				}
			} 
		}
		
		
		if($("div[labelAttr='size']").length>0){
			var num = $("div[labelAttr='size']").length;
			var flag = false;
			for(var k=0;k<num;k++){
				if($($("div[labelAttr='size']")[k]).hasClass("choose")){ 
					flag=true; 
					choose_size = $($("div[labelAttr='size']")[k]).text();
					break;
				}
			} 
		}
		
		//console.info(productList);
		productList.forEach(function(e){
			//console.info(e);
			var value1 = F_PARENT_SKU+"-"+choose_color+"-"+choose_size;
			var value2 = F_PARENT_SKU+"-"+choose_size+"-"+choose_color;
			//console.info(key1+"---"+key2); 
			//console.info("判断"+e.F_SKU+"--"+value1+"---"+value2);
			if(e.F_SKU==value1){
				choose_F_SKU = e.F_SKU;
				$("#F_PRICE").text(e.F_PRICE);
				$("#F_SKU").text(e.F_SKU);
				$("#F_PRODUCT_ID").text(e.F_PRODUCT_ID);
				return;
			}
			if(e.F_SKU==value2){
				//console.info(value2);
				choose_F_SKU = e.F_SKU;
				$("#F_PRICE").text(e.F_PRICE);
				$("#F_SKU").text(e.F_SKU);
				$("#F_PRODUCT_ID").text(e.F_PRODUCT_ID);
				console.info(choose_F_SKU+"选中");
				return;
			}
		}); 
		
    }
    
    function attrMouseOut(x){ 
    	if(!$(x).hasClass("choose")){
    		$(x).attr("class","off");
    	}
        
    }
    function attrMouseOver(x){
    	if(!$(x).hasClass("choose")){
    	  $(x).attr("class","up");
    	}
    } 
    
 
    
</script>
</head>
<body>

 <jsp:include page="/WEB-INF/view/modules/homemain/headerFirst.jsp"></jsp:include>
	 
	 
<div style="width:100%;margin:0px auto">
	<div class="container" style="width:1080px;background:white">
		  <div class="row"> 
		  
		              <div class="col-md-2">
		                <a href="${ctx}/homePageCtrl/toHomePage.do"><img src="${ctxStaticB}/module/homepage/images/logo2.png" width="145" alt="" /></a>
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
 
<div style="width:100%;margin:0px auto">	
    <div class="container" style="width:1080px;">  
	<div class="row">    
        	<div class="headNav"> 
			<div class="navCon w1020"> 
				<div class="navCon-cate fl navCon_on"> 
					<div class="navCon-cate-title">
						<a href="#">全部商品分类</a>
					</div> 
					<div class="cateMenu hide"> 
						<ul> 
						<c:forEach var="tClass" items="${tclasses}">
					        <li style="border-top: none;"> 
								<div class="cate-tag">
									<strong><a href="">${tClass.FClsName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;</a></strong>
								</div> 
								<div class="list-item hide"> 
									<ul class="itemleft"> 
										<dl> 
											<!-- <dt>水果/蔬菜</dt> -->
											<dd>
											        <c:forEach var="sonTClass" items="${tClass.sonTClasses}">
													    <a href="#">${sonTClass.FClsName}</a>  
													</c:forEach>
											</dd> 
										</dl>  
									</ul>  
								</div> 
							</li>
					    </c:forEach>   
						</ul> 
					</div> 
				</div>

				<!-- 
				<div class="navCon-menu fl"> 
					<ul> 
						<li><a class="curMenu" href="${ctx}/homePageCtrl/toHomePage.do">首页</a></li>
                        <li><a href="javascript:alert('功能暂未开放')">团购场</a></li> 
						<li><a href="javascript:alert('功能暂未开放')">自营超市</a></li> 
						<li><a href="javascript:alert('功能暂未开放')">名家鉴赏</a></li> 
						<li><a href="javascript:alert('功能暂未开放')">闪购</a></li> 
						<li><a href="javascript:alert('功能暂未开放')">VIP专场</a></li> 
					</ul>  
			    </div>  
			    -->
			
			
		</div>
     </div>  
	</div>
 
  
  <div class="row"> 
	<div class="goods">
		<div class="preview-left">
			<div id="vertical" class="bigImg" style="padding: 2px;width: 100%;">
			    
			       <c:forEach var="t_picture" begin="0" end="1" items="${t_pictures}"> 
			          <img src="${t_picture.PATH}" width="100%" height="400" alt="" id="midimg" />
                   </c:forEach>  
				<div style="display: none;" id="winSelector"></div>
			</div>
			<!--bigImg end-->
			<div class="smallImg">
				<div class="scrollbutton smallImgUp disabled"></div>
				<div id="imageMenu">
					<ul>  
					 <c:forEach var="t_picture" items="${t_pictures}" varStatus="status"> 
					   
					   <c:choose>
					   <c:when test="${status.index ==0}">
					       <li    id="onlickImg${status.index}"><img src="${t_picture.PATH}" width="68" height="68" alt="水果" /></li>
					    </c:when>
					     <c:otherwise>
					        <li><img src="${t_picture.PATH}" width="68" height="68" alt="水果" /></li>
					     </c:otherwise>
					     </c:choose>  
					     
					</c:forEach>  
					</ul>
				</div>
				<div class="scrollbutton smallImgDown"></div>
			</div>
			<!--smallImg end-->
			<div id="bigView" style="display: none;">
				<img width="800" height="800" alt="" src="" />
			</div>
		</div>

		<div class="preview-right">
		    <span id="F_SKU" class="F_SKU" style="display:none">${singleProduct.F_SKU}</span>
		    <span id="F_PRODUCT_ID" class="productId" style="display:none">${singleProduct.F_PRODUCT_ID}</span>
			<h1 class="goods-title">
				<span itemprop="name" class="productName">${singleProduct.F_PRODUCTNAME}</span>
			</h1>
			<div class="goods-main">
				
				<div class="main-box">
					<div class="property-box">
						<span class="property-type">价格：</span><span class="origin-price" style="color:red">¥${singleProduct.F_SHOW_PRICE}</span>
					</div> 
					<div style="margin:1px 0;padding:5px;display:block;font-size:16px;color:#A5A5A5">本站价:¥<span>&nbsp<span id="F_PRICE">${singleProduct.F_PRICE}</span></span></div>
				    
				</div>
				 
					
				<div class="property-extra" >  
				 
				  <!--<div style="margin:1px 0;padding:5px;display:block;font-size:16px;color:#A5A5A5">数量:<span>&nbsp <span id="F_Number">${singleProduct.F_Number}</span></span></div>  --> 
				 
				   <div style="margin:1px 0;padding:5px;display:block;font-size:16px;color:#A5A5A5">运费:<span>&nbsp ¥<span id="F_Express">${singleProduct.F_Express}</span></span></div>
				  
				   
				  <c:if test="${(tbColors)!= null && fn:length(tbColors) > 0}">
				  <div class="row" style="margin: 1px 0;padding: 0px;display: block; font-size: 14px;color: #A5A5A5;">
				      <div class="col-xs-2 col-sm-2" style="padding: 5px;width: fit-content;">颜色</div>
				      <div class="col-xs-10 col-sm-10 col-md-10" style="padding: 0px;line-height: 16px;">
					       <c:forEach var="tbColor" items="${tbColors}">
						       <div class="col-sm-6" style="width: fit-content;"><div labelAttr="color" class="off" attrFProductUid='color${tbSize.F_PRODUCT_ID}' style="padding: 5px 5px;width: fit-content;cursor: pointer"   onMouseDown='choose(this)' onMouseOut="attrMouseOut(this)" onMouseOver="attrMouseOver(this)">${tbColor.F_COLOR}</div></div>
						   </c:forEach> 
                     </div>
                  </div>
				  </c:if>
				  
				   <c:if test="${(tbSizes)!= null && fn:length(tbSizes) > 0}">
				  <div class="row" style="margin: 10px 0;padding: 0px;display: block; font-size: 14px;color: #A5A5A5;">
				      <div class="col-xs-2 col-sm-2" style="padding: 5px;width: fit-content;">尺寸</div>
				      <div class="col-xs-10 col-sm-10 col-md-10" style="padding: 0px;line-height: 16px;">
					       <c:forEach var="tbSize" items="${tbSizes}">
						       <div class="col-sm-6" style="width: fit-content;"><div labelAttr="size" class="off" attrFProductUid='size${tbSize.F_PRODUCT_ID}' style="padding: 5px 5px;width: fit-content;cursor: pointer"  onMouseDown='choose(this)' onMouseOut="attrMouseOut(this)" onMouseOver="attrMouseOver(this)">${tbSize.F_SIZE}</div></div>
						   </c:forEach> 
                     </div>
                  </div>
				  </c:if>
				  
				     
                     
                    <div style="margin:5px 0;padding:5px;display:block;font-size:16px;color:#A5A5A5">数量:<span>&nbsp<input type="number" min=1 step=1 max=${singleProduct.F_Number}  maxlength="10" style="width: 50px;" value="1" id="F_BuyCount"></span>件(库存${singleProduct.F_Number}件)</div>
                   
				</div>
			</div>
		
			  
			<!-- <div class="">地址</div> -->
			<div class="buy">
				<div class="buy-btn">
				    <a  id="submitRecordInfo" href="javascript:void(0)">立即购买</a> 
				</div>
			     <div class="shop orange" id="intoShopcar" style="cursor:pointer"> 
					  <span   class="button  addcar" style="text-align: center;line-height: 40px;height:40px;display: block;font-size:20px;">+购物</span>
				 </div>  
			</div>
		</div> 
		</div>
  </div>
  <div class="row">
		<div class="tabs">
			<ul class="tabs-list">
				<li class="active"><a href="javascript:;">产品详情</a></li>
	   	 <!--  <li><a href="javascript:;">累计评价</a></li>  -->  
			</ul>
			<div class="tabs-container">
				<div class="tab-content">
					<!-- <h4>品牌名称：大红枣</h4> --> 
					 <div class="desc"> ${singleProduct.F_PRODUCTDESC}</div> 
				</div>
				<div class="tab-content">
					 <p><span>暂无评论</span></p>
				</div>
			</div>
		  </div>
	 </div>
		  
  </div>
</div>

 
	
<!-- ------------------------------------------------------- -->
<jsp:include page="/WEB-INF/view/modules/homemain/footer.jsp"/>
	
	
<!-- ---------------- -->
<div id="recordContact" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 
</div><!-- /.modal -->  
 

<script src="${ctxStaticB}/module/head/js/header.js" type="text/javascript"></script>  
 

<!--preview end-->
<script type="text/javascript">
var F_ClsId;
$(function(){ 
	     
	    $( "#autocomplete" ).autocomplete({
	        source: "${ctx}/productCtrl/searchProduct.do", 
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
	      
	//提交订单信息
	 $("#submitRecordInfo").click(function(){
		 var F_USER_ID; 
			var productName = $(".productName").text();
			var productId = $(".productId").text();
			var F_SinglePrice = $(".origin-price").text(); 
			var F_PRICE = $("#F_PRICE").text();
			if($("#F_PRICE")){
				F_SinglePrice = $("#F_PRICE").text();
			}
			if($("#F_Express")){ 
				var DIC_FREIGHT = $("#F_Express").text();
				F_SinglePrice =  parseInt(F_SinglePrice)+parseInt(DIC_FREIGHT);
			}
			
			var F_BuyCount = $("#F_BuyCount").val();  
			var F_Express = $("#F_Express").text();
			
			if(F_BuyCount>0){
				//F_SinglePrice = parseInt(F_SinglePrice)*parseInt(F_BuyCount);
			}
			var productDesc = $(".desc").text();
			
			//商品属性
			var productAttr = "";  
			if($("div[labelAttr='color']").length>0){ 
				var num = $("div[labelAttr='color']").length;
				var flag = false;
				for(var k=0;k<num;k++){
					if($($("div[labelAttr='color']")[k]).hasClass("choose")){ 
						flag=true;
						productAttr=productAttr+"颜色:"+$($("div[labelAttr='color']")[k]).text()+"<br>";
						break;
					}
				}
				if(!flag){ 
					alert("请选择颜色");
					return;
				} 
			}
			
			
			if($("div[labelAttr='size']").length>0){
				var num = $("div[labelAttr='size']").length;
				var flag = false;
				for(var k=0;k<num;k++){
					if($($("div[labelAttr='size']")[k]).hasClass("choose")){ 
						flag=true;
						productAttr=productAttr+"尺寸:"+$($("div[labelAttr='size']")[k]).text()+"<br>";
						break;
					}
				}
				if(!flag){ 
					alert("请选择尺寸");
					return;
				}
			}
			
			
			 
			
			window.open("${ctx}/payCtrl/toIndex.do?F_SKU="+choose_F_SKU+"&productAttr="+productAttr+"&productName="+productName+"&productId="+productId+"&F_PRICE="+F_PRICE+"&productPrice="+F_SinglePrice+"&productDesc="+productDesc+"&F_BuyCount="+F_BuyCount+"&F_Express="+F_Express); 
	}); 
	
	//添加购物车
	$("#intoShopcar").click(function(event){
		var F_USER_ID;
		//$('#newAdd').attr("data-target","xmgk-input");
		//$("#submitRecordInfo").attr("href","#recordContact");  
		var productName = $(".productName").text();
		var productId = $(".productId").text();
		var F_SinglePrice = $(".origin-price").text(); 
		var F_Express=0;
		if($("#F_PRICE")){
			F_SinglePrice = $("#F_PRICE").text();
		}
		if($("#F_Express")){ 
			F_Express = $("#F_Express").text();
			F_SinglePrice =  parseFloat(F_SinglePrice);
		}
		var F_BuyCount = $("#F_BuyCount").val(); 
		if(F_BuyCount<1){
			F_BuyCount = 1;
		}
		
		var productDesc = $(".desc").text();
		
		var F_USER_ID = '${F_USER_ID}';
	 
	 
		if(F_USER_ID.length<=0){
			alert('请登录后加入购物车');
			return;
		}
		
		//商品属性
		var productAttr = ""; 
		$("div[labelAttr='color']").each(function(){ 
			if(!$(this).hasClass("choose")){
				alert("请选择颜色");
				return;
			}else{
				productAttr=productAttr+"颜色:"+$(this).text();
			}
		});
		
		$("div[labelAttr='size']").each(function(){ 
			if(!$(this).hasClass("choose")){
				alert("请选择尺寸");
				return;
			}else{
				productAttr=productAttr+"尺寸:"+$(this).text();
			}
		});
		 
	 
		
	
		
		var flag = false;
		//window.open("${ctx}/payCtrl/toIndex.do?productName="+productName+"&productId="+productId+"&productPrice="+productPrice+"&productDesc="+productDesc); 
	    $.ajax({
	    	url:'${ctx}/tbshopcar/tbShopCarController/save.do',
	    	type:"POST",
	    	async: false,
	    	data:{
	    		"F_SKU":choose_F_SKU,
	    		"F_USER_ID":F_USER_ID,
	    		"F_PRODUCT_ID":productId,
	    		"F_SinglePrice":F_SinglePrice,
	    		"F_NUMBER":F_BuyCount,
	    		"F_Express":F_Express
	    		},
	    	success:function(data){
	    		if(!data.iserror){
	    			//alert("添加购物车成功");
	    			flag = true;
	    		}else{
	    			alert("添加购物车失败");
	    		} 
	    	}
	    }); 
	    
	    if(flag){
	    	var offset = $("#shopCart").offset();
			var addcar = $("#intoShopcar");
			//var img = addcar.parent().find('img').attr('src');
			var flyer = $('<img class="u-flyer" src="${t_pictures[0].PATH}" width="100px" height="50px">');
			flyer.fly({
				start: {
					left: event.pageX,
					top: event.pageY
				},
				end: {
					left: offset.left+5,
					top: offset.top+5,
					width: 0,
					height: 0
				},
				onEnd: function(){
					//$("#msg").show().animate({width: '250px'}, 200).fadeOut(1000);
					addcar.css("cursor","default").removeClass('orange').unbind('click');
					this.destory();
				}
			});
	    } 
    });

});

$(document).ready(function(){
	// 图片上下滚动
	var count = $("#imageMenu li").length - 4; /* 显示 5 个 li标签内容 */
	var interval = $("#imageMenu li:first").width();
	var curIndex = 0;
	
	$('.scrollbutton').click(function(){
		if( $(this).hasClass('disabled') ) return false;
		
		if ($(this).hasClass('smallImgUp')) --curIndex;
		else ++curIndex;
		
		$('.scrollbutton').removeClass('disabled');
		if (curIndex == 0) $('.smallImgUp').addClass('disabled');
		if (curIndex == count-1) $('.smallImgDown').addClass('disabled');
		
		$("#imageMenu ul").stop(false, true).animate({"marginLeft" : -curIndex*interval + "px"}, 600);
	});	
	// 解决 ie6 select框 问题
	$.fn.decorateIframe = function(options) {
        if ($.browser.msie && $.browser.version < 7) {
            var opts = $.extend({}, $.fn.decorateIframe.defaults, options);
            $(this).each(function() {
                var $myThis = $(this);
                //创建一个IFRAME
                var divIframe = $("<iframe />");
                divIframe.attr("id", opts.iframeId);
                divIframe.css("position", "absolute");
                divIframe.css("display", "none");
                divIframe.css("display", "block");
                divIframe.css("z-index", opts.iframeZIndex);
                divIframe.css("border");
                divIframe.css("top", "0");
                divIframe.css("left", "0");
                if (opts.width == 0) {
                    divIframe.css("width", $myThis.width() + parseInt($myThis.css("padding")) * 2 + "px");
                }
                if (opts.height == 0) {
                    divIframe.css("height", $myThis.height() + parseInt($myThis.css("padding")) * 2 + "px");
                }
                divIframe.css("filter", "mask(color=#fff)");
                $myThis.append(divIframe);
            });
        }
    }
    $.fn.decorateIframe.defaults = {
        iframeId: "decorateIframe1",
        iframeZIndex: -1,
        width: 0,
        height: 0
    }
    //放大镜视窗
    $("#bigView").decorateIframe();
    //点击到中图
    var midChangeHandler = null;
	
    $("#imageMenu li img").bind("click", function(){
    	 
		if ($(this).attr("id") != "onlickImg") { 
			midChange($(this).attr("src").replace("small", "large")); 
			$("#imageMenu li").removeAttr("id");
			$(this).parent().attr("id", "onlickImg");
		}
	}).bind("mouseover", function(){
		if ($(this).attr("id") != "onlickImg") {
			window.clearTimeout(midChangeHandler);
			midChange($(this).attr("src").replace("small", "large"));
			$(this).css({ "border": "3px solid #959595" });
		}
	}).bind("mouseout", function(){
		if($(this).attr("id") != "onlickImg"){
			$(this).removeAttr("style");
			midChangeHandler = window.setTimeout(function(){
				//midChange($("#onlickImg img").attr("src").replace("small", "large")); 
			}, 1000);
		}
	});
    function midChange(src) {
    	console.info(src);
        $("#midimg").attr("src", src).load(function() {
            changeViewImg();
        });
    }
    //大视窗看图
    function mouseover(e) {
        if ($("#winSelector").css("display") == "none") {
            $("#winSelector,#bigView").show();
        }
        $("#winSelector").css(fixedPosition(e));
        e.stopPropagation();
    }
    function mouseOut(e) {
        if ($("#winSelector").css("display") != "none") {
            $("#winSelector,#bigView").hide();
        }
        e.stopPropagation();
    }
    $("#midimg").mouseover(mouseover); //中图事件
    $("#midimg,#winSelector").mousemove(mouseover).mouseout(mouseOut); //选择器事件

    var $divWidth = $("#winSelector").width(); //选择器宽度
    var $divHeight = $("#winSelector").height(); //选择器高度
    var $imgWidth = $("#midimg").width(); //中图宽度
    var $imgHeight = $("#midimg").height(); //中图高度
    var $viewImgWidth = $viewImgHeight = $height = null; //IE加载后才能得到 大图宽度 大图高度 大图视窗高度

    function changeViewImg() {
        $("#bigView img").attr("src", $("#midimg").attr("src").replace("mid", "big"));
    }
    changeViewImg();
    $("#bigView").scrollLeft(0).scrollTop(0);
    function fixedPosition(e) {
        if (e == null) {
            return;
        }
        var $imgLeft = $("#midimg").offset().left; //中图左边距
        var $imgTop = $("#midimg").offset().top; //中图上边距
        X = e.pageX - $imgLeft - $divWidth / 2; //selector顶点坐标 X
        Y = e.pageY - $imgTop - $divHeight / 2; //selector顶点坐标 Y
        X = X < 0 ? 0 : X;
        Y = Y < 0 ? 0 : Y;
        X = X + $divWidth > $imgWidth ? $imgWidth - $divWidth : X;
        Y = Y + $divHeight > $imgHeight ? $imgHeight - $divHeight : Y;

        if ($viewImgWidth == null) {
            $viewImgWidth = $("#bigView img").outerWidth();
            $viewImgHeight = $("#bigView img").height();
            if ($viewImgWidth < 200 || $viewImgHeight < 200) {
                $viewImgWidth = $viewImgHeight = 800;
            }
            $height = $divHeight * $viewImgHeight / $imgHeight;
            $("#bigView").width($divWidth * $viewImgWidth / $imgWidth);
            $("#bigView").height($height);
        }
        var scrollX = X * $viewImgWidth / $imgWidth;
        var scrollY = Y * $viewImgHeight / $imgHeight;
        $("#bigView img").css({ "left": scrollX * -1, "top": scrollY * -1 });
        $("#bigView").css({ "top": 220, "left": $(".preview-left").offset().left + $(".preview-left").width() + 15 });

        return { left: X, top: Y };
    }
});
</script>
</body>
</html>