<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="啾唧网 方便快捷，物美价廉，更快送达，诚信服务" />
<meta name="keywords" content="啾唧首页" />

<link rel="shortcut icon" href="#" />

<title>啾唧-主页</title> 
<link rel="stylesheet" href="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/css/bootstrap.css" type="text/css" /> 
<link rel="stylesheet" href="${ctxStaticB}/css/main.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/css/homepage/carousel.css" />
<link rel="shortcut icon" href="${ctxStaticB}/images/logo.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/plugin/carouselengine/initcarousel-1.css">
 
<script src="${ctxStatic}/plugin/jquery/jquery-1.11.3/jquery-1.11.3.min.js"></script>
<script src="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/js/bootstrap.js"></script>

<script src="${ctxStatic}/plugin/carouselengine/amazingcarousel.js"></script> 
<script src="${ctxStatic}/plugin/carouselengine/initcarousel-1.js"></script>
<script src="${ctxStatic}/plugin/carouselengine/initcarousel-2.js"></script>   
<script src="${ctxStatic}/plugin/carouselengine/initcarousel-3.js"></script>   

<link rel="stylesheet" href="${ctxStatic}/plugin/jqueryui/jquery-ui-1.12.1.custom/jquery-ui.css">  
<script src="${ctxStatic}/plugin/jqueryui/jquery-ui-1.12.1.custom/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="${ctxStaticB}/system/niftyModal/css/default.css" />
		<link rel="stylesheet" type="text/css" href="${ctxStaticB}/system/niftyModal/css/component.css" />
<script src="${ctxStaticB}/system/niftyModal/js/modernizr.custom.js"></script>

<link rel="stylesheet" type="text/css" href="${ctxStaticB}/system/choujiangRound/css/default.css"/>	
    
<%
//String rootFile = request.getScheme()+"://"+request.getServerName()+":8088/file";
String rootFileApp = request.getScheme()+"://"+request.getServerName()+":8088/app"; 
String rootFile = "https://www.jiujichina.com/fileSystem";
%>

<script>  
	var ctx = '${ctx}';
	$(function() {
		//通用头部搜索切换
		/*$('#search-hd .search-input').on(
				'input propertychange',
				function() {
					var val = $(this).val();
					if (val.length > 0) {
						$('#search-hd .pholder').hide(0);
					} else {
						var index = $('#search-bd li.selected').index();
						$('#search-hd .pholder').eq(index).show().siblings(
								'.pholder').hide(0);
					}
				})*/

		$('#search-bd li').click(
				function() {
					var index = $(this).index();
					$('#search-hd .pholder').eq(index).show().siblings(
							'.pholder').hide(0);
					$('#search-hd .search-input').eq(index).show().siblings(
							'.search-input').hide(0);
					$(this).addClass('selected').siblings().removeClass(
							'selected');
					$('#search-hd .search-input').val('');
				});
	})

	
</script>
</head>

<body> 
 


 <div class="md-modal md-effect-1" id="modal-1">
			<div class="md-content">
				<h3>抽奖区</h3>
				<div>
					  <div class="ly-plate">

						  <div class="rotate-bg"></div>
						
						  <div class="lottery-star"><img src="${ctxStaticB}/images/homepage/rotate-static.png" id="lotteryBtn"></div>
						
					  </div>
					<button class="md-close">Close me!</button>
				</div>
			</div>
 </div>
		
		
 <div class="container" style="display:none">
		 
			 <div class="column">
					<button class="md-trigger" data-modal="modal-1">Fade in &amp; Scale</button> 
			 </div>
			 
</div><!-- /container -->
		
<%@include file="/WEB-INF/view/modules/homemain/header.jsp"%>
	
	
		
		
		
		
		<div class="md-overlay"></div><!-- the overlay element -->
 
  <div style="width:100%;margin:0px auto">
	<div class="container">
		   <div id="focus" style="margin-left: 200px;width:960px;">
					<ul> 
						<c:forEach var="tCarousel" items="${tCarousels}">
						  <li style="width:960px;">
						        <div class="img">
								    <a href="${tCarousel.F_Url}" target="_blank"><img src="${ctxStaticB}/images/${tCarousel.F_Address}" height="400" width="960" alt="" style="background-repeat:repeat-x" /></a>  
								</div></li>
						</c:forEach> 
			      </ul>
	      </div>
    </div>
 </div>
 

	     
  <div style="width:100%;margin:0px auto;">	 
        <div class="container"> 
        <div class="row">
 		<div id="amazingcarousel-container-1" style="padding:0px">
		      
		    <div id="amazingcarousel-1" style="display:block;position:relative;width:100%;max-width: 100%;margin:0px auto 0px;">
		        
		     <div class="tit-arrival1" style="margin-bottom:10px;">
				新品上市
			 </div>
	
               <div class="amazingcarousel-list-container" style="padding:4px;">
		        <ul class="amazingcarousel-list">
			        <c:forEach var="tproduct" items="${tproducts}">
						 <li class="amazingcarousel-item">
	                    <div class="amazingcarousel-item-container">
							<div class="amazingcarousel-image"><a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tproduct.F_PARENT_SKU}" target="_blank" title="${tproduct.F_PRODUCTNAME}"  data-group="amazingcarousel-1"><img src="${tproduct.F_PATH}"  alt="${tproduct.F_PRODUCTNAME}" /></a></div>
							<div class="amazingcarousel-title"><span class="txt">${tproduct.F_PRICE}RMB</span></div>
							<div class="amazingcarousel-description"></div>                   
	                    </div>
	                    </li>
				    </c:forEach>  
               </ul>
		            <div class="amazingcarousel-prev"></div>
		            <div class="amazingcarousel-next"></div>
		        </div>
		   <!-- <div class="amazingcarousel-nav"></div>  
		        <div class="amazingcarousel-engine"><a href="http://amazingcarousel.com">JavaScript Image Carousel</a></div>--> 
		    </div>
	     </div> 
	    </div>
	    </div>
	</div>
	
	<div class="clear"></div>
	
	
  <div style="width:100%;margin:0px auto;">	 
         <div class="container"> 
        <div class="row">
 		<div id="amazingcarousel-container-2" style="padding: 0px;">
		      
		    <div id="amazingcarousel-2" style="display:block;position:relative;width:100%;margin:0px auto 0px;">
		        
		     <div class="tit-arrival1" style="margin-bottom:10px;">
				热门商品
			 </div>
	
               <div class="amazingcarousel-list-container" style="padding:4px;">
		        <ul class="amazingcarousel-list">
			        <c:forEach var="tproductHot" items="${tproductHots}">
						 <li class="amazingcarousel-item">
	                    <div class="amazingcarousel-item-container">
							<div class="amazingcarousel-image"><a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tproductHot.FParentSku}"  title="${tproductSpecial.FProductName}"   data-group="amazingcarousel-2"><img  src="${tproductHot.FPath}"  alt="${tproductHot.FProductName}"/></a></div>
							<div class="amazingcarousel-title"><span class="txt">${tproductHot.FPrice}RMB</span></div>
							<div class="amazingcarousel-description"></div>                   
	                    </div>
	                    </li>
				    </c:forEach>  
               </ul>
		            <div class="amazingcarousel-prev"></div>
		            <div class="amazingcarousel-next"></div>
		        </div>
		   <!-- <div class="amazingcarousel-nav"></div> 
		        <div class="amazingcarousel-engine"><a href="http://amazingcarousel.com">JavaScript Image Carousel</a></div> --> 
		    </div>
		    </div>
	    </div> 
	    </div>
	</div>
	
	
 <div class="clear"></div>
	
  <div style="width:100%;margin:0px auto;">	 
        
    <div class="container"> 
        <div class="row">
        
 		<div id="amazingcarousel-container-3" style="padding: 0px;">
		      
		    <div id="amazingcarousel-3" style="display:block;position:relative;width:100%;max-width: 100%;margin:0px auto 0px;">
		        
		     <div class="tit-arrival1" style="margin-bottom:10px;">
				产品特卖
			 </div>
	
               <div class="amazingcarousel-list-container" style="padding:4px;">
		        <ul class="amazingcarousel-list">
			        <c:forEach var="tproductSpecial" items="${tproductSpecials}">
						 <li class="amazingcarousel-item">
	                    <div class="amazingcarousel-item-container">
							<div class="amazingcarousel-image"><a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tproductSpecial.FParentSku}" title="${tproductSpecial.FProductName}"    data-group="amazingcarousel-3"><img src="${tproductSpecial.FPath}"  alt="${tproductSpecial.FProductName}" /></a></div>
							<div class="amazingcarousel-title"><span class="txt">${tproductSpecial.FPrice}RMB</span></div>
							<div class="amazingcarousel-description"></div>                   
	                    </div>
	                    </li>
				    </c:forEach>  
               </ul>
		            <div class="amazingcarousel-prev"></div>
		            <div class="amazingcarousel-next"></div>
		        </div>
		   <!-- <div class="amazingcarousel-nav"></div> 
		        <div class="amazingcarousel-engine"><a href="http://amazingcarousel.com">JavaScript Image Carousel</a></div> --> 
		    </div>
	      </div> 
	    </div>
	  </div>
 </div>
	
	
	<div class="clear"></div>
	 
 <jsp:include page="/WEB-INF/view/modules/homemain/footer.jsp"/>  

 

<jsp:include page="/WEB-INF/view/modules/homemain/side.jsp"/>		            


<script src="${ctxStaticB}/js/head.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(function() {
			var sWidth = $("#focus").width(); //获取焦点图的宽度（显示面积）
			var len = $("#focus ul li").length; //获取焦点图个数
			var index = 0;
			var picTimer;

			//以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
			var btn = "<div class='btnBg'></div><div class='btn'>";
			for (var i = 0; i < len; i++) {
				btn += "<span></span>";
			}
			btn += "</div><div class='preNext pre'></div><div class='preNext next'></div>";
			$("#focus").append(btn);
			$("#focus .btnBg").css("opacity", 0.5);

			//为小按钮添加鼠标滑入事件，以显示相应的内容
			$("#focus .btn span").css("opacity", 0.4).mouseover(function() {
				index = $("#focus .btn span").index(this);
				showPics(index);
			}).eq(0).trigger("mouseover");

			//上一页、下一页按钮透明度处理
			$("#focus .preNext").css("opacity", 0.2).hover(function() {
				$(this).stop(true, false).animate({
					"opacity" : "0.5"
				}, 300);
			}, function() {
				$(this).stop(true, false).animate({
					"opacity" : "0.2"
				}, 300);
			});

			//上一页按钮
			$("#focus .pre").click(function() {
				index -= 1;
				if (index == -1) {
					index = len - 1;
				}
				showPics(index);
			});

			//下一页按钮
			$("#focus .next").click(function() {
				index += 1;
				if (index == len) {
					index = 0;
				}
				showPics(index);
			});

			$("#focus ul").css("width", sWidth * (len));

			//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
			$("#focus").hover(function() {
				clearInterval(picTimer);
			}, function() {
				picTimer = setInterval(function() {
					showPics(index);
					index++;
					if (index == len) {
						index = 0;
					}
				}, 4000); //此4000代表自动播放的间隔，单位：毫秒
			}).trigger("mouseleave");

			//显示图片函数，根据接收的index值显示相应的内容
			function showPics(index) { //普通切换
				var nowLeft = -index * sWidth; //根据index值计算ul元素的left值
				$("#focus ul").stop(true, false).animate({
					"left" : nowLeft
				}, 300); //通过animate()调整ul元素滚动到计算出的position
				//$("#focus .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
				$("#focus .btn span").stop(true, false).animate({
					"opacity" : "0.4"
				}, 300).eq(index).stop(true, false).animate({
					"opacity" : "1"
				}, 300); //为当前的按钮切换到选中的效果
			} 	  
			 
		});
		
		
		
		
		$(document).ready(function() { 
			$(".amazingcarousel-image").each(function(){
				 $(this).children("div").find("a").remove();
			}); 
		}); 
		
	</script>
</body>
<!-- 自动搜索 -->
<%-- <script src="${ctxStatic}/plugin/jquery/demo.js" type="text/javascript"></script>  
<script src="${ctxStatic}/plugin/jquery/jquery.autocomplete.js" type="text/javascript"></script> --%>

  
 <script>
 var F_ClsId;
  $( function() { 
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
    		window.open("${ctx}/productCtrl/toProjectListPage.do?f_clsId="+F_ClsId,"_blank");
    	} 
    }); 
  });
  
  /**---------------抽奖---------------------**/
  
  

		var click=false;
		window.onload=function(){
			 
			$.ajax({
				url:ctx+"/tbYouhuiCtrl/alreadyHad.do", 
				async:false,
				type:"post",
				success:function(data){ 
					data = eval("("+data+")"); 
					if(data.iserror){ 
						console.info(data.iserror); 
						return;
					}else if(!data.iseeror){
						showChoujiang();
					}
				}
			});
			
			
		};
		
 
		
		 function showChoujiang(){
			 $(".md-trigger").click(); 
			  
				$("#btn").click(function(){
					//按下弹起效果
					$("#btn").addClass("cjBtnDom");
					setTimeout(function(){	
						$("#btn").removeClass("cjBtnDom");
					},200);

					
					if(click) {
						return false;
					}
					else{
						luck.speed=100;
						roll();
						click=true;
						return false;
					}
				
				});
		 }
	
  </script>
  


<!-- classie.js by @desandro: https://github.com/desandro/classie -->
<script src="${ctxStaticB}/system/niftyModal/js/classie.js"></script>
<script src="${ctxStaticB}/system/niftyModal/js/modalEffects.js"></script>

<!-- for the blur effect -->
<!-- by @derSchepp https://github.com/Schepp/CSS-Filters-Polyfill -->
<script>
// this is important for IEs
var polyfilter_scriptpath = '/js/';
</script>
<script src="${ctxStaticB}/system/niftyModal/js/cssParser.js"></script>
<script src="${ctxStaticB}/system/niftyModal/js/css-filters-polyfill.js"></script>


<script src="${ctxStaticB}/system/choujiangRound/js/jquery.easing.min.js"></script>
<script src="${ctxStaticB}/system/choujiangRound/js/jQueryRotate.2.2.js"></script> 

<script src="${ctxStaticB}/system/choujiangRound/js/default.js"></script>




</html>