<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %>  

    <footer>
        <div class="footer-item active firstPage">
            <i class="index-icon"></i>
            <span class="icon-word">首页</span>
        </div>
        <div class="footer-item zlass">
            <i class="sort-icon"></i>
            <span class="icon-word">分类</span>
        </div>
        
        <!-- 购物车暂时拿掉 -->
       <!--  <div class="footer-item">
            <i class="shopping-car-icon"></i>
            <span class="icon-word">购物车</span>
        </div> -->
        <div class="footer-item myInformation">
            <i class="user-icon"></i>
            <span class="icon-word">我的</span>
        </div>
    </footer>
    
<script src="${ctxStaticB}/wapjiuji/public/js/jquery.js"></script>    

        <script>
        $(".sort-box").click(function(){
        	 window.location.href="${ctx}/homePageCtrl/toWapSort.do";
        });
        
        $(".mes-box").click(function(){
        	 window.location.href="${ctx}/homePageCtrl/toWapMyMessage.do";
        });
    
        $(".channel-item").click(function(){
            window.location.href="${ctx}/pageController/wapjiuji/product/product_list.do";
        });
        
        $(".product").click(function(){
            window.location.href="${ctx}/pageController/wapjiuji/product/product_details.do";
        });
         
        $(".footer-item").eq(2).click(function(){
            window.location.href="${ctx}/pageController/wapjiuji/shoppingcar/shoppingcar_02.do";
        });
        
     
        
        $(".message").click(function(){
            window.location.href="${ctx}/homePageCtrl/toWapMyMessage.do";
        });
        
        $(".firstPage").click(function(){
            window.location.href="${ctx}/homePageCtrl/toWapHomePage.do";
        });
        
        $(".zlass").click(function(){
            window.location.href="${ctx}/homePageCtrl/toWapSort.do";
        });
        
        $(".myInformation").click(function(){
            window.location.href="${ctx}/homePageCtrl/toWapInformation.do";
        });
        
        
      
    </script>