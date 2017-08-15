<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>啾唧网</title>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/neat.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/my_common.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/swiper.min.css">
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/my_center/css/my_center.css"/>
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
        <i class="setting-icon"></i>
        <h1 class="header-title">我的</h1>
        <i class="mes-icon"></i>
    </header>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">    <!--必须包有这层，滚动才会生效-->
                <div class="my-info">
                    <div class="unregistered">   <!--未登录注册时的结构-->
                        <i class="person-icon"></i>
                        <p>注册/登录</p>
                    </div>
                    <div class="registered">     <!--已登录注册时的结构-->
                        <div class="personal-img">
                            <img src="${ctxStaticB}/wapjiuji/my_center/img/person.jpg" alt="" class="person-img"/>
                        </div>
                        <p class="person-name">${USERNAME}</p>
                    </div>
                </div>
                <div class="my-order">
                    <div class="option clearfix myOrder">
                        <span>我的订单</span>
                        <div>
                            <span>查看全部订单</span>
                            <i class="right-icon"></i>
                        </div>
                    </div>
                    <div class="order-sort">
                        <div><i class="coin-icon" id="dfk"></i><p>待付款</p></div>
                        <div><i class="truck-icon" id="dsh"></i><p>待收货</p></div>
                        <div><i class="complete-icon" id="ywc"></i><p>已完成</p></div>
                    </div>
                </div>
                <div class="my-message">
                    <div class="option clearfix message">
                        <span>我的消息</span>
                        <div>
                            <i class="right-icon"></i>
                        </div>
                    </div>
                    <div class="order-sort">
                        <div><i class="person-icon"></i><p>个人信息</p></div>
                        <div><i class="location-icon"></i><p>收货地址</p></div>
                        <div><i class="lock-icon"></i><p>修改密码</p></div>
                    </div>
                </div>
               <!--  <div class="option clearfix">
                    <span>我的消息</span>
                    <div>
                        <i class="right-icon"></i>
                    </div>
                </div> -->
                <div class="option clearfix help_feedback">
                    <span>帮助反馈</span>
                    <div>
                        <i class="right-icon"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="swiper-scrollbar"></div>
    </div> 
    
    <jsp:include page="../common/footer.jsp"></jsp:include>
         
    <script src="${ctxStaticB}/wapjiuji/public/js/jquery.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/swiper.min.js"></script>
    <script src="${ctxStaticB}/wapjiuji/my_center/js/my_center.js"></script>
    
        <script>
        $(".person-icon").click(function(){
            window.location.href="${ctx}/pageController/wapjiuji/my_center/personal_information.do";
        });
        
        $(".location-icon").click(function(){
            window.location.href="${ctx}/homePageCtrl/toWapDeliveryAddress.do";
        });
        
        
        $(".setting-icon").click(function(){
            window.location.href="${ctx}/pageController/wapjiuji/my_center/system-function.do";
        });
        
        $(".lock-icon").click(function(){
            window.location.href="${ctx}/pageController/wapjiuji/login/modify_password.do";
        });
         
        
        $(".person-icon").click(function(){
            window.location.href="${ctx}/pageController/wapjiuji/my_center/personal_information.do";
        });
        
     
        
        $(".help_feedback").click(function(){
            window.location.href="${ctx}/pageController/wapjiuji/my_center/help_feedback.do";
        });
        
        $(".myOrder").click(function(){
            window.location.href="${ctx}/tborder/tbOrderController/toWapMyOrder.do";
        });
        
        $("#dfk").click(function(){
            window.location.href="${ctx}/tborder/tbOrderController/toWapMyOrder.do?F_Status=-1";
        });
        
        $("#dsh").click(function(){
            window.location.href="${ctx}/tborder/tbOrderController/toWapMyOrder.do?F_Status=0";
        });
        
        $("#ywc").click(function(){
            window.location.href="${ctx}/tborder/tbOrderController/toWapMyOrder.do?F_Status=3";
        });
      
        
        
        
    </script>
    
</body>
</html>