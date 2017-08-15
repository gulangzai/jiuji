<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>啾唧-商品页</title>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/neat.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/my_common.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/swiper.min.css">
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/product/css/product_details.css"/>
    <link rel="shortcut icon" href="${ctxStaticB}/images/ico.ico" type="image/x-icon" />
<%
//String rootFile = request.getScheme()+"://"+request.getServerName()+":8088/file";
String rootFileApp = request.getScheme()+"://"+request.getServerName()+":8088/app"; 
String rootFile = "https://www.jiujichina.com/fileSystem";
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
    <header class="product-details-header">
        <i class="return-btn"></i>
        <h1 class="header-title">商品详情</h1>
        <i class="share-icon"></i>
    </header>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">    <!--必须包有这层，滚动才会生效-->
                <div class="banner-swiper">    <!--轮播图-->
                    <div class="banner-swiper-wrapper swiper-wrapper">
                       <c:forEach var="t_picture" begin="0"  items="${t_pictures}">  
			              <div class="banner-wrapper-slide swiper-slide"><img src="${t_picture.PATH}" alt=""/></div>
                       </c:forEach>
                   
                 <%--        <div class="banner-wrapper-slide swiper-slide"><img src="${ctxStaticB}/wapjiuji/product/img/product.jpg" alt=""/></div>
                        <div class="banner-wrapper-slide swiper-slide"><img src="${ctxStaticB}/wapjiuji/product/img/product.jpg" alt=""/></div>
                        <div class="banner-wrapper-slide swiper-slide"><img src="${ctxStaticB}/wapjiuji/product/img/product.jpg" alt=""/></div>
                        <div class="banner-wrapper-slide swiper-slide"><img src="${ctxStaticB}/wapjiuji/product/img/product.jpg" alt=""/></div>
                        <div class="banner-wrapper-slide swiper-slide"><img src="${ctxStaticB}/wapjiuji/product/img/product.jpg" alt=""/></div>
                        <div class="banner-wrapper-slide swiper-slide"><img src="${ctxStaticB}/wapjiuji/product/img/product.jpg" alt=""/></div>
                    --%> 
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
                <div class="product-main-mes clearfix">
                    <p class="product-name">${singleProduct.F_PRODUCTNAME}</p>
                    <p class="product-intro">${singleProduct.F_PRODUCTDESC}</p>  
                    <p class="current-price">¥<span>${singleProduct.F_REAL_PRICE}</span></p>
                    <p class="original-price">¥<del>${singleProduct.F_PRICE}</del></p>
                </div>
                <div class="related-block">      <!--猜你喜欢-->
                    <div class="related-title"><img src="${ctxStaticB}/wapjiuji/product/img/img01.png" alt=""/></div>
                    <div class="related-swiper">
                        <div class="related-swiper-wrapper swiper-wrapper">
                         
		                       <c:forEach   var="tproductHot" items="${tproductHots}" varStatus="status">
								    
								   <c:if test="${status.count==1||status.count==4}"> 
		                	               <div class="related-item related-wrapper-slide swiper-slide">
		                                   <div class="related-product-list">
		                	        </c:if>
		                	        
                	      
			                       <div class="related-product">
		                                        <div class="product-img">
<%-- 		                                        <a href="${ctx}/tbProductController/toWapSingleProduct.do?f_ProductId=${tproductHot.F_PRODUCT_ID}"></a>
 --%>		                                        <img src="${tproductHot.F_PATH}" alt="${tproductHot.F_PRODUCTNAME}"/>
		                                        </div>
		                                        <div class="product-mes">
		                                        <!-- <p class="product-name">${tproductHot.F_PRODUCTNAME}</p> -->
		                                             <p class="current-price">RMB&nbsp;&nbsp;<span>${tproductHot.F_REAL_PRICE}</span></p>
		                                        </div>
		                           </div>
		                           
		                           
		                           
		                            <c:if test="${status.count==3||fn:length(tproductHots) == status.count}">
                	                        </div>
                                         </div>
                	                </c:if>
                	       
		                             
						      </c:forEach>  
						       
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
                <div class="product-details">
                    <img src="${ctxStaticB}/wapjiuji/product/img/product3.jpg" alt=""/>
                </div>
                <div class="return-top"><img src="${ctxStaticB}/wapjiuji/product/img/top.png" alt=""/></div>
            </div>
        </div>
        <div class="swiper-scrollbar"></div>
    </div>
    <footer class="product-details-footer">
         <!--  <i class="shopping-car-icon"></i>
        <div class="add-shopping-car">加入购物车</div> -->
         <div class="add-shopping-car">喜欢</div>
    </footer>
    <script src="${ctxStaticB}/wapjiuji/public/js/jquery.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/jump.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/swiper.min.js"></script>
    <script src="${ctxStaticB}/wapjiuji/product/js/product.js"></script>


    <script>
        $(".shopping-car-icon").click(function(){
            window.location.href="${ctx}/tbshopcar/tbShopCarController/wapjiujiList.do?F_USER_ID=0356d78f-9663-4f8e-8da5-6f7eda903590"
        });
    </script>

</body>
</html>