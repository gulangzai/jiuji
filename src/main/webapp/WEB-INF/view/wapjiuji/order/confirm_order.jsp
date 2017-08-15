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
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/order/css/confirm_order.css"/>
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
        <h1 class="header-title">确认订单</h1>
    </header>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">    <!--必须包有这层，滚动才会生效-->
                <div class="address">     <!--用户已有收货地址信息时-->
                    <div class="l">
                        <div class="user-mes clearfix">
                            <p><i class="person-icon"></i><span>何云</span></p>
                            <p><i class="mobile-icon"></i><span>18501226791</span></p>
                        </div>
                        <div class="specific-address">北京市海淀区上地信息路甲3号科实大厦 A座201</div>
                    </div>
                    <i class="right-icon"></i>
                </div>
                <div class="fill-in-address clearfix">  <!--提示用户填写收货地址-->
                    <p><i class="location-icon"></i>请填写收货人信息</p>
                    <i class="right-icon"></i>
                </div>
                <div class="product-list">
                    <div class="product">
                        <img src="${ctxStaticB}/wapjiuji/order/img/product.jpg" alt="" class="product-img"/>
                        <div class="product-mes">
                            <p class="product-name">燕春天 燕窝三角小香展10克 国外进口</p>
                            <p class="product-address">产地：<span>韩国</span></p>
                            <div class="current-price">
                                <p>¥<span>145.00</span></p>
                                <p>×<span>2</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="product">
                        <img src="${ctxStaticB}/wapjiuji/order/img/product.jpg" alt="" class="product-img"/>
                        <div class="product-mes">
                            <p class="product-name">燕春天 燕窝三角小香展10克 国外进口</p>
                            <p class="product-address">产地：<span>韩国</span></p>
                            <div class="current-price">
                                <p>¥<span>145.00</span></p>
                                <p>×<span>1</span></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="no-invoice">
                    <span>发票抬头</span>
                    <p><span>无</span><i class="right-icon"></i></p>
                </div>
                <div class="invoice">
                    <div class="invoice-title-area">
                        <p>发票抬头</p>
                        <input type="text" placeholder="可输入个人/单位名称" class="invoice-title"/>
                    </div>
                    <div class="invoice-con">
                        <p class="title">发票内容</p>
                        <div class="options">
                            <div><i class="circle-checked-icon"></i><span class="option-name">电脑配件</span></div>
                            <div><i class="circle-icon"></i><span class="option-name">办公用品</span></div>
                            <div><i class="circle-icon"></i><span class="option-name">耗材</span></div>
                        </div>
                    </div>
                </div>
                <div class="total">
                    <div class="clearfix">
                        <p class="p1">商品金额</p>
                        <p class="p2">¥<span>145.00</span></p>
                    </div>
                    <div class="clearfix">
                        <p class="p1">运费</p>
                        <p class="p2">+&nbsp;&nbsp;¥<span>0.00</span></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="swiper-scrollbar"></div>
    </div>
    <footer>
        <div class="account">实付款：¥<span>79.00</span></div>
        <div class="submit-order-btn">提交订单</div>
    </footer>
    <script src="${ctxStaticB}/wapjiuji/public/js/jquery.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/jump.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/swiper.min.js"></script>
    <script src="${ctxStaticB}/wapjiuji/order/js/order.js"></script>

    <script>
        $(".submit-order-btn").click(function(){
            window.location.href="${ctx}/pageController/wapjiuji/order/payment.do";
        });
    </script>

</body>
</html>