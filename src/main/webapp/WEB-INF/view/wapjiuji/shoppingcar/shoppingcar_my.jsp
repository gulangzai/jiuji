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
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/swiper.min.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/shoppingcar/css/shoppingcar.css"/>
    
<%
String rootFile = request.getScheme()+"://"+request.getServerName()+":8088/file";
String rootFileApp = request.getScheme()+"://"+request.getServerName()+":8088/app"; 
%>

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
    <header class="shoppingcar-header">
        <i class="return-btn"></i>
        <h1 class="header-title">购物车</h1>
        <span class="edit">编辑</span>
    </header>
    <div class="swiper-container scroll-part1">
        <div class="swiper-wrapper">
            <div class="swiper-slide">    <!--必须包有这层，滚动才会生效-->
                <div class="carriage-free-notice">
                    <i class="megaphone-icon"></i>
                    <span>全场商品满50元，免配送费！</span>
                </div>
                <ul class="shopping-list">
                
                <c:forEach var="tbShopCar" items="${page.data}"> 
                 
                    <li class="single clearfix">
                        <%--<div class="shop">
                            <i class="circle-icon"></i>
                            <div class="shop-about">
                                <i class="shop-icon"></i>
                                 <span class="shop-name">康恩大药房${tbShopCar.F_PRODUCT_ID}</span> 
                            </div>
                        </div>
                        --%>
                        <div class="goods" id="goods1">
                            <i class="circle-icon"></i>
                            <div class="c2">
                                <img src="<%=rootFile%>/${tbShopCar.F_PATH}" alt="" class="product-img"/>
                                <p class="total">
                                    <span class="minus-btn">-</span>
                                    <span class="num">1</span>
                                    <span class="plus-btn">+</span>
                                </p>
                            </div>
                            <div class="c3">
                                <p class="product-name">${tbShopCar.F_ProductName}</p>
                                <!-- <p class="product-address">产地：<span>韩国</span></p> -->
                                <p class="current-price">¥<span>${tbShopCar.F_REAL_PRICE}</span></p>
                            </div>
                            <div class="del-btn">删除</div>
                        </div>
                    </li> 
                    
				    
		        </c:forEach>  
		        
                </ul>
            </div>
        </div>
        <div class="swiper-scrollbar"></div>
    </div>
    <footer class="shoppingcar-footer1">
        <div class="total-mes">
            <p class="amount-mes">合计:¥<span>145.00</span></p>
            <p class="carriage">(含运费:<span>5.00</span>元)</p>
        </div>
        <div class="balance-btn">去结算</div>
    </footer>
    <div class="shoppingcar-action-block">
        <i class="circle-icon"></i>
        <span>全选</span>
        <div class="shoppingcar-action-block-btns">
            <p class="remove-btn">删除</p>
        </div>
    </div>
    <script src="${ctxStaticB}/wapjiuji/public/js/jquery.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/jump.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/swiper.min.js"></script>
    <script src="${ctxStaticB}/wapjiuji/shoppingcar/js/shoppingcar_01.js"></script>

    <script>
        $(".balance-btn").click(function(){
            window.location.href="${ctx}/pageController/wapjiuji/order/confirm_order.do";
        });
    </script>

</body>
</html>