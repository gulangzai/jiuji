<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title></title>
	<% 
	String rootFileApp = request.getScheme()+"://"+request.getServerName()+":8088/app"; 
	String rootFile = "https://www.jiujichina.com/fileSystem";
	%>

    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/neat.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/my_common.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/swiper.min.css">
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/product/css/product_list.css"/>
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
    <header class="product-list-header">
        <i class="return-btn"></i>
        <div class="search-box">
            <i class="search-icon"></i>
            <input type="text" class="search-input" placeholder="搜索商品/店铺"/>
        </div>
        <div class="shopping-car-area">
            <i class="shopping-car-icon"></i>
        </div>
    </header>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">    <!--必须包有这层，滚动才会生效-->
                <div class="product-list">
                    
                    
             <c:forEach items="${projectPictureResults}" var="projectPictureResult" varStatus="status">
             
             <c:if test="${status.count%2==1}">
                 <div class="product-item">
             </c:if> 
		               <div class="product">
	                          <div class="product-top">
	                                <div class="product-img">
	                                     <a href="${ctx}/tbProductController/toWapSingleProduct.do?f_ProductId=${projectPictureResult.tproduct.F_PRODUCT_ID}" title="${projectPictureResult.tproduct.F_PRODUCTNAME}"> <img src="<%=rootFile%>/${projectPictureResult.tbPictures[0].PATH}" alt=""/></a>
	                                </div>
	                                <div class="product-mes">
	                                    <p class="product-name">${projectPictureResult.tproduct.F_PRODUCTNAME}</p>
	                                    <p class="product-intro"> ${projectPictureResult.tproduct.F_PRODUCTDESC}</p>
	                                   <!--  <p class="product-area">产地：<span>江苏</span></p> -->
	                                </div>
	                            </div>
	                            <div class="product-bottom">
	                                <p class="current-price">¥<span>${projectPictureResult.tproduct.F_REAL_PRICE}</span></p>
	                                <p class="original-price">¥<del>${projectPictureResult.tproduct.F_PRICE}</del></p>
	                                <div class="shopping-car">喜</div>
	                            </div>
		                 </div> 
		      <c:if test="${status.count%2==0||fn:length(tclasses) == status.count}">         
                 </div>
              </c:if>   
               
              </c:forEach> 
                
                </div>
            </div>
        </div>
        <div class="swiper-scrollbar"></div>
    </div>
    <script src="${ctxStaticB}/wapjiuji/public/js/jquery.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/jump.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/swiper.min.js"></script>
    <script src="${ctxStaticB}/wapjiuji/product/js/product.js"></script>
</body>
</html>