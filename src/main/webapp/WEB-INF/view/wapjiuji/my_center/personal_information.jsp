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
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/my_center/css/personal_information.css"/>
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
        <h1 class="header-title">个人资料</h1>
    </header>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">    <!--必须包有这层，滚动才会生效-->
                <div class="option clearfix">
                    <span class="option-name">头像</span>
                    <div>
                        <img src="${ctxStaticB}/wapjiuji/my_center/img/default-img.png" alt=""/>
                        <i class="right-icon"></i>
                    </div>
                </div>
                <div class="option clearfix">
                    <span class="option-name">用户名</span>
                    <div>
                        <span class="nickname" id="F_UserName">倾译</span>
                        <i class="right-icon"></i>
                    </div>
                </div>
                <div class="option clearfix">
                    <span class="option-name">昵称</span>
                    <div>
                        <span class="nickname" id="F_NickName">倾译</span>
                        <i class="right-icon"></i>
                    </div>
                </div>
                <div class="option clearfix">
                    <span class="option-name">手机号</span>
                    <div>
                        <span class="phone-num" id="F_Mobile"></span>
                        <i class="right-icon"></i>
                    </div>
                </div>
                
                 <div class="option clearfix">
                    <span class="option-name">邮箱</span>
                    <div>
                        <span class="phone-num" id="F_Email"></span>
                        <i class="right-icon"></i>
                    </div>
                </div>
                
                 <div class="option clearfix">
                    <span class="option-name">QQ</span>
                    <div>
                        <span class="phone-num" id="F_QQ"></span>
                        <i class="right-icon"></i>
                    </div>
                </div>
                
                 <div class="option clearfix">
                    <span class="option-name">家乡</span>
                    <div>
                        <span class="phone-num" id="F_Hometown"></span>
                        <i class="right-icon"></i>
                    </div>
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
	    		   url: "${ctx}/userCtrl/getUser.do",
	    		   type:"Post", 
	    		   success:function(data){	
	    			   var data = eval("("+data+")");
	    			   data = data.data;
	    			   console.info(data);
	    			    if(data!=null){ 
	    			    	 $("#F_USER_ID").text(data.F_USER_ID);
	    			    	 $("#F_UserName").text(data.F_UserName);
	    				     $("#F_NickName").text(data.F_NickName);  
	    				     $("#F_RealName").text(data.F_RealName);
	    				     $("#F_Mobile").text(data.F_Mobile);
	    				     $("#F_Email").text(data.F_Email);
	    				     $("#F_QQ").text(data.F_QQ);
	    				     if(data.F_Sex=='0'){
	    				    	 $("#F_Sex0").attr("checked",true);
	    				     }else{
	    				    	 $("#F_Sex1").attr("checked",true);
	    				     }
	    				     $("#F_Hometown").text(data.F_Hometown);
	    				 } 
	    					
	    		   }  
	    	});
	    }
	
	    init();
    
    </script>
</body>
</html>