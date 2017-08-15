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
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/order/css/payment.css"/>
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
        <h1 class="header-title">收银台</h1>
    </header>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">    <!--必须包有这层，滚动才会生效-->
                <div class="total clearfix">
                    <p>请支付</p>
                    <p><span>112.00</span>元</p>
                </div>
                <div class="option clearfix">
                    <img src="${ctxStaticB}/wapjiuji/order/img/weixi.png" alt="" class="option-img"/>
                    <div class="option-name">
                        <p>微信支付</p>
                        <p>微信安全支付</p>
                    </div>
                    <i class="right-icon"></i>
                </div>
                <div class="option clearfix">
                    <img src="${ctxStaticB}/wapjiuji/order/img/alipay.png" alt="" class="option-img"/>
                    <div class="option-name">
                        <p>支付宝支付</p>
                        <p>支付宝安全支付</p>
                    </div>
                    <i class="right-icon"></i>
                </div>
            </div>
        </div>
        <div class="swiper-scrollbar"></div>
    </div>
    <script src="${ctxStaticB}/wapjiuji/public/js/jquery.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/jump.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/swiper.min.js"></script>
    <script src="${ctxStaticB}/wapjiuji/order/js/order.js"></script>
</body>
</html>