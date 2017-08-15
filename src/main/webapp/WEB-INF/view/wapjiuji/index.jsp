<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title></title>
    <link rel="shortcut icon" href="${ctxStaticB}/images/ico.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/neat.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/my_common.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/swiper.min.css">
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/index/css/index.css"/> 
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
    <header class="index-header">
        <div class="sort-box">
            <i class="sort-icon"></i>
            <span class="icon-word">分类</span>
        </div>
        <div class="search-box">
            <input type="text" class="search-input" placeholder="搜索商品/店铺"/>
            <i class="search-icon"></i>
        </div>
        <div class="mes-box">
            <i class="mes-icon"></i>
            <span class="icon-word">消息</span>
        </div>
    </header>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide my-slide">    <!--必须包有这层，滚动才会生效-->
               
               
               
                <div class="banner-swiper">    <!--轮播图-->
                    <div class="banner-swiper-wrapper swiper-wrapper">
                    
                    <c:forEach var="tCarousel" items="${tCarousels}">
                              <div class="banner-wrapper-slide swiper-slide"><img src="${ctxStaticB}/images/${tCarousel.F_Address}" alt=""/></div>
                    </c:forEach> 
						
                       <%--  <div class="banner-wrapper-slide swiper-slide"><img src="${ctxStaticB}/wapjiuji/index/img/banner.jpg" alt=""/></div>
                        <div class="banner-wrapper-slide swiper-slide"><img src="${ctxStaticB}/wapjiuji/index/img/banner.jpg" alt=""/></div>
                        <div class="banner-wrapper-slide swiper-slide"><img src="${ctxStaticB}/wapjiuji/index/img/banner.jpg" alt=""/></div>
                        <div class="banner-wrapper-slide swiper-slide"><img src="${ctxStaticB}/wapjiuji/index/img/banner.jpg" alt=""/></div>
                        <div class="banner-wrapper-slide swiper-slide"><img src="${ctxStaticB}/wapjiuji/index/img/banner.jpg" alt=""/></div>
                        <div class="banner-wrapper-slide swiper-slide"><img src="${ctxStaticB}/wapjiuji/index/img/banner.jpg" alt=""/></div> --%>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
                
                <div class="channel-panel">   <!--轮播图下分类-->
                   
                   <c:forEach var="tClass" items="${tclasses}" varStatus="status">
                	    <c:if test="${status.count==1||status.count==5}"> 
                	         <div class="channel-row">
                	    </c:if>
                	    
                	     <div class="channel-item"> 
                            <img src="${ctxStaticB}/wapjiuji/${tClass.F_WAP_ICON}" alt="" class="channel-icon"/>
                            <p class="channel-name">${tClass.F_ClsName}</p>
                         </div>
                        
                        <%-- <c:out value="${status.count}"></c:out> --%>
                        
                        <c:if test="${status.count==4}">
                	        </div>
                	    </c:if>
                	    
                	      <c:if test="${fn:length(tclasses) == status.count}">
		                	        <div class="channel-item">
		                            <img src="${ctxStaticB}/wapjiuji/index/img/1.png" alt="" class="channel-icon"/>
		                            <p class="channel-name">分类</p>
		                            </div>
                	        </div>
                	    </c:if>
                	    
                	</c:forEach>
                	
                </div>
                
            <%--    <div class="sale-block">   <!--今日促销版块-->
                    <div class="sale-title"><img src="${ctxStaticB}/wapjiuji/index/img/img01.png" alt=""/></div>
                    <div class="sale-products">
                        <div class="product-item">
                        
                        
                        
                            <div class="product">
                                <div class="product-img">
                                    <img src="${ctxStaticB}/wapjiuji/index/img/product.jpg" alt=""/>
                                    <div class="activity">促销</div>
                                </div>
                                <div class="product-mes">
                                    <p class="product-name">无油烟不粘锅</p>
                                    <p class="product-intro">无油烟不粘锅煤气电磁炉无油烟不粘锅煤气电磁炉无油烟不粘锅煤气电磁炉无油烟不粘锅煤气电磁炉 </p>
                                    <p class="product-area">产地：<span>江苏</span></p>
                                    <p class="current-price">¥<span>299.00</span></p>
                                    <p class="original-price">¥<del>699.00</del></p>
                                    <div class="shopping-car">&#xe95d</div>
                                </div>
                            </div>
                            
                            
                            
                            
                            
                            <div class="product">
                                <div class="product-img">
                                    <img src="${ctxStaticB}/wapjiuji/index/img/product2.jpg" alt=""/>
                                    <div class="activity">促销</div>
                                </div>
                                <div class="product-mes">
                                    <p class="product-name">无油烟不粘锅</p>
                                    <p class="product-intro">无油烟不粘锅煤气电磁炉无油烟不粘锅煤气电磁炉无油烟不粘锅煤气电磁炉无油烟不粘锅煤气电磁炉 </p>
                                    <p class="product-area">产地：<span>江苏</span></p>
                                    <p class="current-price">¥<span>299.00</span></p>
                                    <p class="original-price">¥<del>699.00</del></p>
                                    <div class="shopping-car">&#xe95d</div>
                                </div>
                            </div>
                            
                            
                            
                        </div>
                        
                        
                        
                        
                        
                        <div class="product-item">
                            <div class="product">
                                <div class="product-img">
                                    <img src="${ctxStaticB}/wapjiuji/index/img/product.jpg" alt=""/>
                                    <div class="activity">促销</div>
                                </div>
                                <div class="product-mes">
                                    <p class="product-name">无油烟不粘锅</p>
                                    <p class="product-intro">无油烟不粘锅煤气电磁炉无油烟不粘锅煤气电磁炉无油烟不粘锅煤气电磁炉无油烟不粘锅煤气电磁炉 </p>
                                    <p class="product-area">产地：<span>江苏</span></p>
                                    <p class="current-price">¥<span>299.00</span></p>
                                    <p class="original-price">¥<del>699.00</del></p>
                                    <div class="shopping-car">&#xe95d</div>
                                </div>
                            </div>
                            <div class="product">
                                <div class="product-img">
                                    <img src="${ctxStaticB}/wapjiuji/index/img/product2.jpg" alt=""/>
                                    <div class="activity">促销</div>
                                </div>
                                <div class="product-mes">
                                    <p class="product-name">无油烟不粘锅</p>
                                    <p class="product-intro">无油烟不粘锅煤气电磁炉无油烟不粘锅煤气电磁炉无油烟不粘锅煤气电磁炉无油烟不粘锅煤气电磁炉 </p>
                                    <p class="product-area">产地：<span>江苏</span></p>
                                    <p class="current-price">¥<span>299.00</span></p>
                                    <p class="original-price">¥<del>699.00</del></p>
                                    <div class="shopping-car">&#xe95d</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>   --%>
                
                
                
                <div class="hot-block">    <!--热卖版块-->
                    <div class="hot-title"><img src="${ctxStaticB}/wapjiuji/index/img/img02.png" alt=""/></div>
                    <div class="hot-products">
                    
                    
                      <c:forEach var="tproductHot" items="${tproductHots}" varStatus="status">
						  
						   <c:if test="${status.count==1||status.count==3}"> 
                	          <div class="product-item">
                	      </c:if>
                	    
                	        <div class="product">
                                <div class="product-img">
                                     <a href="${ctx}/tbProductController/toWapSingleProduct.do?f_parentSku=${tproductHot.F_PARENT_SKU}" title="${tproduct.F_PRODUCTNAME}"> <img src="${tproductHot.F_PATH}" alt=""/></a>
                                </div>
                                <div class="product-mes">
                                    <!-- <p class="product-name">${tproductHot.F_PRODUCTNAME}</p> 
                                    <p class="product-intro">${tproductHot.F_PRODUCTDESC} </p> -->
                                    <p class="current-price">¥<span>${tproductHot.F_SHOW_PRICE}RMB</span></p>
                                    <p class="original-price">¥<del>${tproductHot.F_PRICE}RMB</del></p>
                                    <div class="shopping-car">喜</div>  
                                </div>
                            </div>
                            
	                     
	                      <c:if test="${status.count==2||status.count==4||fn:length(tproductHots) == status.count}">
                	         </div>
                	      </c:if>
                	      
				    </c:forEach> 
				     
                        
                    <%--  <div class="product-item">
                            <div class="product">
                                <div class="product-img">
                                    <img src="${ctxStaticB}/wapjiuji/index/img/product.jpg" alt=""/>
                                </div>
                                <div class="product-mes">
                                    <p class="product-name">无油烟不粘锅</p>
                                    <p class="product-intro">无油烟不粘锅煤气电磁炉无油烟不粘锅煤气电磁炉无油烟不粘锅煤气电磁炉无油烟不粘锅煤气电磁炉 </p>
                                    <p class="product-area">产地：<span>江苏</span></p>
                                    <p class="current-price">¥<span>299.00</span></p>
                                    <p class="original-price">¥<del>699.00</del></p>
                                    <div class="shopping-car">&#xe95d</div>
                                </div>
                            </div>
                        
                        </div>   --%>
                        
                       
                     
                    </div> 
                </div> 
                
                
            </div> 
        </div> 
        <div class="swiper-scrollbar"></div>
    </div>
    
    <jsp:include page="./common/footer.jsp"></jsp:include>
    
   <!--  <footer>
        <div class="footer-item active">
            <i class="index-icon "></i>
            <span class="icon-word">首页</span>
        </div>
        <div class="footer-item">
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
    <script src="${ctxStaticB}/wapjiuji/public/js/swiper.min.js"></script>
    <script src="${ctxStaticB}/wapjiuji/index/js/index.js"></script>
 
</body>
</html>