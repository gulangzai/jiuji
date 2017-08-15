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
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/my_center/css/system-function.css"/>
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
        <h1 class="header-title">系统功能</h1>
    </header>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">    <!--必须包有这层，滚动才会生效-->
            <!--     <div class="option clearfix">
                    <span>版本检测</span>
                    <div>
                        <span class="version">V1.2.1</span>
                        <i class="right-icon"></i>
                    </div>
                </div>
                <div class="option clearfix">
                    <span>清除缓存</span>
                    <div>
                        <span class="buffer">2M</span>
                        <i class="right-icon"></i>
                    </div>
                </div> -->
                <div class="option clearfix">
                    <span>是否接受推送</span>
                    <div>
                        <i class="toggle-on-icon"></i>
                    </div>
                </div>
                <div class="option clearfix">
                    <span>关于我们</span>
                    <div>
                        <i class="right-icon"></i>
                    </div>
                </div>
                <button class="primary-btn quit-btn">退出登录</button>
            </div>
        </div>
        <div class="swiper-scrollbar"></div>
    </div>
    <script src="${ctxStaticB}/wapjiuji/public/js/jquery.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/jump.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/swiper.min.js"></script>
    <script src="${ctxStaticB}/wapjiuji/my_center/js/my_center.js"></script>
    
    <script>
	    $(".quit-btn").click(function(){
	        window.location.href="${ctx}/pageController/wapjiuji/login/login.do";
	    });
    </script>
</body>
</html>