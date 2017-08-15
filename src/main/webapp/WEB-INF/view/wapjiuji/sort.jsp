<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>商品分类</title>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/neat.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/my_common.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/swiper.min.css">
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/sort/css/sort.css"/>
<% 
String rootFileApp = request.getScheme()+"://"+request.getServerName()+":8088/app"; 
String rootFile =  "https://www.jiujichina.com/systemFile";
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
<body class="sort-body">
    <header class="sort-header">
        <i class="return-btn"></i>
        <div class="search-box">
            <i class="search-icon"></i>
            <input type="text" class="search-input" placeholder="搜索商品/店铺"/>
        </div>
    </header>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">    <!--必须包有这层，滚动才会生效-->
            
            
            <c:forEach var="tClass" items="${tclasses}">
            
              <div class="sort-item">
                    <div class="sort-item-title">
                        <img src="${ctxStaticB}/wapjiuji/${tClass.F_WAP_ICON}" alt=""/>
                        <span>${tClass.F_ClsName}</span>
                    </div>
                    <ul class="sort-list">
                     <li>全部</li>
                    <c:forEach var="sonTClass" items="${tClass.sonTClasses}">
                              <li><a href="${ctx}/productCtrl/toWapProjectListPage.do?f_clsId=${sonTClass.F_ClsId}" style="color: #888">${sonTClass.F_ClsName}</a></li> 
					 </c:forEach> 			 
                    </ul>
                </div>       
			 </c:forEach>   
            </div>
        </div>
        <div class="swiper-scrollbar"></div>
    </div>
    
    <jsp:include page="./common/footer.jsp"></jsp:include>
  <!--   <footer>
        <div class="footer-item">
            <i class="index-icon "></i>
            <span class="icon-word">首页</span>
        </div>
        <div class="footer-item active">
            <i class="sort-icon"></i>
            <span class="icon-word">分类</span>
        </div>
        <div class="footer-item">
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
    <script src="${ctxStaticB}/wapjiuji/sort/js/sort.js"></script>
 
</body>
</html>