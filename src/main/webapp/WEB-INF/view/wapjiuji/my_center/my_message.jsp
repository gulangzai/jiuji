<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title></title>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/neat.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/my_common.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/swiper.min.css">
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/my_center/css/my_message.css"/>
    <script>
        (function (doc, win) {
            var docEl = doc.documentElement,
                    resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
                    recalc = function () {
                        var clientWidth = docEl.clientWidth;
                        if (!clientWidth) return;
                        docEl.style.fontSize = 20 * (clientWidth / 320) + 'px';
                    };
            if (!doc.addEventListener) return;
            win.addEventListener(resizeEvt, recalc, false);
            doc.addEventListener('DOMContentLoaded', recalc, false);
        })(document, window);
    </script>
</head>
<body>
    <header>
        <i class="return-btn"></i>
        <h1 class="header-title">我的消息</h1>
    </header>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">    <!--必须包有这层，滚动才会生效-->
                <div class="mes">
                    <p class="clearfix"><span class="mes-title">物流通知</span><span class="mes-time">昨天</span></p>
                    <p class="mes-con">您的快件已到上地分部您的快件已到上地分部您的快件已到上地分部您的快件已到上地分部您的快件已到上地分部您的快件已到上地分部</p>
                </div>
                <div class="mes">
                    <p class="clearfix"><span class="mes-title">优惠促销</span><span class="mes-time">16/01/02</span></p>
                    <p class="mes-con">母婴用品优惠最高1折起</p>
                </div>
                <div class="mes">
                    <p class="clearfix"><span class="mes-title">客服通知</span><span class="mes-time">15/12/16</span></p>
                    <p class="mes-con">母婴用品优惠最高1折起</p>
                </div>
            </div>
        </div>
        <div class="swiper-scrollbar"></div>
    </div>
    <script src="${ctxStaticB}/wapjiuji/public/js/jquery.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/jump.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/swiper.min.js"></script>
    <script src="${ctxStaticB}/wapjiuji/my_center/js/my_center.js"></script>
   
    <script>
    
	    function init(){
	    	$.ajax({
	    		   url: "${ctx}/tbmessage/tbMessageController/wapDataList.do",
	    		   type:"Post", 
	    		   success:function(data){	
	    			   var data = eval("("+data+")");
	    			   data = data.data;
	    			   console.info(data);
	    			    if(data!=null){ 
	    			    	$(".swiper-slide").empty();
	    			    	data.forEach(function(ele,indx){
	    			            var html ='<div class="mes" id="'+ele.F_MESSAGE_UID+'">';
	    	                    html+='<p class="clearfix"><span class="mes-title">'+ele.F_TITLE+'</span><span class="mes-time">'+ele.F_CREATE_DATE+'</span></p>';
	    	                    html+='<p class="mes-con">'+ele.F_CONTENT+'</p>';
	    	                    html+='</div>';
	    			    	    $(".swiper-slide").append(html);
	    			    	});
	    			
	    				 }  
	    		   }  
	    	});
	    }
	
	    init();
    
    </script>
    
    
</body>
</html>