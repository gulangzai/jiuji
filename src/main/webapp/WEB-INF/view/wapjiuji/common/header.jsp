<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %>  

    
    
<script src="${ctxStaticB}/wapjiuji/public/js/jquery.js"></script>    

        <script>
        $(".sort-box").click(function(){
        	 window.location.href="${ctx}/homePageCtrl/toWapSort.do";
        });
        
        $(".mes-box").click(functioin(){
        	 window.location.href="${ctx}/homePageCtrl/toWapMyMessage.do";
        });
    
        $(".channel-item").click(function(){
            window.location.href="${ctx}/pageController/wapjiuji/product/product_list.do";
        });
      
        $(".message").click(function(){
            window.location.href="${ctx}/homePageCtrl/toWapMyMessage.do";
        });
        
      
    </script>