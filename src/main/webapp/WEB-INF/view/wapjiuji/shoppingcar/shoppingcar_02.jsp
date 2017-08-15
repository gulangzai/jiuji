<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>购物车</title>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/neat.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/my_common.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/swiper.min.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/shoppingcar/css/shoppingcar.css"/>
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
        <!--<i class="return-btn"></i>-->
        <h1 class="header-title">购物车</h1>
        <span class="edit">编辑</span>
    </header>
    <div class="swiper-container scroll-part2">
        <div class="swiper-wrapper">
            <div class="swiper-slide">    <!--必须包有这层，滚动才会生效-->
                <div class="carriage-free-notice">
                    <i class="megaphone-icon"></i>
                    <span>全场商品满50元，免配送费！</span>
                </div>
                <ul class="shopping-list">
                    <li class="single clearfix">
                        <div class="shop">
                            <i class="circle-icon"></i>
                            <div class="shop-about">
                                <i class="shop-icon"></i>
                                <span class="shop-name">康恩大药房</span>
                            </div>
                        </div>
                        <div class="goods" id="goods">
                            <i class="circle-icon"></i>
                            <div class="c2">
                                <img src="${ctxStaticB}/wapjiuji/shoppingcar/img/product.jpg" alt="" class="product-img"/>
                                <p class="total">
                                    <span class="minus-btn">-</span>
                                    <span class="num">1</span>
                                    <span class="plus-btn">+</span>
                                </p>
                            </div>
                            <div class="c3">
                                <p class="product-name">燕春天 燕窝三角小香展10克 国外进口</p>
                                <p class="product-address">产地：<span>韩国</span></p>
                                <p class="current-price">¥<span>145.00</span></p>
                            </div>
                            <div class="del-btn">删除</div>
                        </div>
                    </li>
                    <li class="single clearfix">
                        <div class="shop">
                            <i class="circle-icon"></i>
                            <div class="shop-about">
                                <i class="shop-icon"></i>
                                <span class="shop-name">康恩大药房</span>
                            </div>
                        </div>
                        <div class="goods" id="goods">
                            <i class="circle-icon"></i>
                            <div class="c2">
                                <img src="${ctxStaticB}/wapjiuji/shoppingcar/img/product.jpg" alt="" class="product-img"/>
                                <p class="total">
                                    <span class="minus-btn">-</span>
                                    <span class="num">1</span>
                                    <span class="plus-btn">+</span>
                                </p>
                            </div>
                            <div class="c3">
                                <p class="product-name">燕春天 燕窝三角小香展10克 国外进口</p>
                                <p class="product-address">产地：<span>韩国</span></p>
                                <p class="current-price">¥<span>145.00</span></p>
                            </div>
                            <div class="del-btn">删除</div>
                        </div>
                        <div class="goods" id="goods">
                            <i class="circle-icon"></i>
                            <div class="c2">
                                <img src="${ctxStaticB}/wapjiuji/shoppingcar/img/product.jpg" alt="" class="product-img"/>
                                <p class="total">
                                    <span class="minus-btn">-</span>
                                    <span class="num">1</span>
                                    <span class="plus-btn">+</span>
                                </p>
                            </div>
                            <div class="c3">
                                <p class="product-name">燕春天 燕窝三角小香展10克 国外进口</p>
                                <p class="product-address">产地：<span>韩国</span></p>
                                <p class="current-price">¥<span>145.00</span></p>
                            </div>
                            <div class="del-btn">删除</div>
                        </div>
                        <div class="goods" id="goods">
                            <i class="circle-icon"></i>
                            <div class="c2">
                                <img src="${ctxStaticB}/wapjiuji/shoppingcar/img/product.jpg" alt="" class="product-img"/>
                                <p class="total">
                                    <span class="minus-btn">-</span>
                                    <span class="num">1</span>
                                    <span class="plus-btn">+</span>
                                </p>
                            </div>
                            <div class="c3">
                                <p class="product-name">燕春天 燕窝三角小香展10克 国外进口</p>
                                <p class="product-address">产地：<span>韩国</span></p>
                                <p class="current-price">¥<span>145.00</span></p>
                            </div>
                            <div class="del-btn">删除</div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="swiper-scrollbar"></div>
    </div>
    <div class="shoppingcar-footer2">
        <div class="total-mes">
            <p class="amount-mes">合计:¥<span>145.00</span></p>
            <p class="carriage">(含运费:<span>5.00</span>元)</p>
        </div>
        <div class="balance-btn">去结算</div>
    </div>
    <div class="shoppingcar-action-block">
        <i class="circle-icon"></i>
        <span>全选</span>
        <div class="shoppingcar-action-block-btns">
            <p class="remove-btn">删除</p>
        </div>
    </div>
    
      <jsp:include page="../common/footer.jsp"></jsp:include>
      
   <!--  <footer>
        <div class="footer-item">
            <i class="index-icon "></i>
            <span class="icon-word">首页</span>
        </div>
        <div class="footer-item">
            <i class="sort-icon"></i>
            <span class="icon-word">分类</span>
        </div>
        <div class="footer-item active">
            <i class="shopping-car-icon"></i>
            <span class="icon-word">购物车</span>
        </div>
        <div class="footer-item">
            <i class="user-icon"></i>
            <span class="icon-word">我的</span>
        </div>
    </footer> -->
    <script src="${ctxStaticB}/wapjiuji/public/js/jquery.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/jump.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/swiper.min.js"></script>
    <script src="${ctxStaticB}/wapjiuji/shoppingcar/js/shoppingcar_01.js"></script>
</body>
</html>