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
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/order/css/my_order.css"/>
    <%
    String F_Status = request.getParameter("F_Status");
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
    <header>
        <i class="return-btn"></i>
        <h1 class="header-title">我的订单</h1>
    </header>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">    <!--必须包有这层，滚动才会生效-->
                <ul class="order-list">
                    <li class="single">
                        <div class="shop">
                            <div class="shop-about">
                                <i class="shop-icon"></i>
                                <span class="shop-name">康恩大药房</span>
                            </div>
                        </div> 
                        <div class="goods">
                            <img src="${ctxStaticB}/wapjiuji/order/img/product.jpg" alt="" class="product-img"/>
                            <div class="r">
                                <div class="l">
                                    <p class="product-name">
                                        <span class="short-name">的沙发看电视了放假打算离开房间的思考了几分收到了房贷首付款就是</span>
                                        <span class="product-size">15克</span>
                                    </p>
                                    <p class="num">×<span>2</span></p>
                                </div>
                                <p class="current-price">¥<span>145.00</span></p>
                            </div>
                        </div>
                        <div class="total">
                            <p>共<span>1</span>件商品&nbsp;合计：<span class="balance">¥<span>290</span></span>&nbsp;(含运费：<span>0.00</span>)</p>
                            <div class="btns clearfix">
                                <div class="primary-btn">查看物流</div>
                                <div class="primary-btn">确认收货</div>
                            </div>
                        </div>
                    </li>
                  <%--   <li class="single">
                        <div class="shop">
                            <div class="shop-about">
                                <i class="shop-icon"></i>
                                <span class="shop-name">创意小屋</span>
                            </div>
                        </div>
                        <div class="goods">
                            <img src="${ctxStaticB}/wapjiuji/order/img/product.jpg" alt="" class="product-img"/>
                            <div class="r">
                                <div class="l">
                                    <p class="product-name">
                                        <span class="short-name">的沙发看电视了放假打算离开房间的思考了几分收到了房贷首付款就是</span>
                                        <span class="product-size">15克</span>
                                    </p>
                                    <p class="num">×<span>2</span></p>
                                </div>
                                <p class="current-price">¥<span>145.00</span></p>
                            </div>
                        </div>
                        <div class="total">
                            <p>共<span>1</span>件商品&nbsp;合计：<span class="balance">¥<span>290</span></span>&nbsp;(含运费：<span>0.00</span>)</p>
                            <div class="btns clearfix">
                                <div class="primary-btn">取消订单</div>
                                <div class="primary-btn">去支付</div>
                            </div>
                        </div>
                    </li>
                    <li class="single">
                        <div class="shop">
                            <div class="shop-about">
                                <i class="shop-icon"></i>
                                <span class="shop-name">奇奇树小屋</span>
                            </div>
                        </div>
                        <div class="goods">
                            <img src="${ctxStaticB}/wapjiuji/order/img/product.jpg" alt="" class="product-img"/>
                            <div class="r">
                                <div class="l">
                                    <p class="product-name">
                                        <span class="short-name">的沙发看电视了放假打算离开房间的思考了几分收到了房贷首付款就是</span>
                                        <span class="product-size">15克</span>
                                    </p>
                                    <p class="num">×<span>2</span></p>
                                </div>
                                <p class="current-price">¥<span>145.00</span></p>
                            </div>
                        </div>
                        <div class="total">
                            <p>共<span>1</span>件商品&nbsp;合计：<span class="balance">¥<span>290</span></span>&nbsp;(含运费：<span>0.00</span>)</p>
                            <div class="btns clearfix">
                                <div class="primary-btn">售后服务</div>
                                <div class="state-box">已完成</div>
                            </div>
                        </div>
                    </li>
                    <li class="single">
                        <div class="shop">
                            <div class="shop-about">
                                <i class="shop-icon"></i>
                                <span class="shop-name">日韩饰品</span>
                            </div>
                        </div>
                        <div class="goods">
                            <img src="${ctxStaticB}/wapjiuji/order/img/product.jpg" alt="" class="product-img"/>
                            <div class="r">
                                <div class="l">
                                    <p class="product-name">
                                        <span class="short-name">的沙发看电视了放假打算离开房间的思考了几分收到了房贷首付款就是</span>
                                        <span class="product-size">15克</span>
                                    </p>
                                    <p class="num">×<span>2</span></p>
                                </div>
                                <p class="current-price">¥<span>145.00</span></p>
                            </div>
                        </div>
                        <div class="total">
                            <p>共<span>1</span>件商品&nbsp;合计：<span class="balance">¥<span>290</span></span>&nbsp;(含运费：<span>0.00</span>)</p>
                            <div class="btns clearfix">
                                <div class="primary-btn">售后服务</div>
                            </div>
                        </div>
                    </li> --%>
                </ul>
            </div>
        </div>
        <div class="swiper-scrollbar"></div>
    </div>
    <script src="${ctxStaticB}/wapjiuji/public/js/jquery.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/jump.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/swiper.min.js"></script>
    <script src="${ctxStaticB}/wapjiuji/order/js/order.js"></script>
    
    <script>
    
    var carId = 1;

    function init(currentPage){
       var F_Status = '${F_Status}';
    	$.ajax({
    		url: "${ctx}/tborder/tbOrderController/wapDataList.do?F_Status="+F_Status,
    		datatype: 'json',
    		currentPage:currentPage,
    		type: "Post", 
    		success: function (data) {
    			//console.info(data);
    			var data = eval("("+data+")");
    			
    			console.info(data.data); 
    			if(data!=null){ 
    				
    				$(".order-list").empty();
    				
    				$.each(data.data, function (index, item) { //遍历返回的json
    		        
    		        var html = '<li class="single">';
    		        html=html+'<div class="shop"><div class="shop-about"><i class="shop-icon"></i><span class="shop-name">'+item.F_ProductName+'</span></div></div>'; 
    		        html=html+'<div class="goods">';
                    html=html+'<img src="<%=rootFile%>/'+item.F_PATH+'" alt="" class="product-img"/>';
                    html=html+'<div class="r">';
                    html=html+'<div class="l">';
                    html=html+'<p class="product-name">';
                    html=html+'<span class="short-name" style="font-size:14px;">'+sub(item.F_ProductDesc)+'</span>';
                    html=html+'<span class="product-size"></span>';
                    html=html+'</p>';
                    html=html+'<p class="num">×<span>2</span></p>';
                    html=html+'</div>';
                    html=html+'<p class="current-price">¥<span>'+item.F_REAL_PRICE+'</span></p>';
                    html=html+'</div>';
                    html=html+'</div>';
                    html=html+'<div class="total">';
                    html=html+'<p>共<span>'+item.F_BuyCount+'</span>件商品&nbsp;合计：<span class="balance">¥<span>'+item.F_Cost+'</span></span>&nbsp;(含运费：<span>0.00</span>)</p>';
                    html=html+'<div class="btns clearfix">';
                    html=html+'<div class="primary-btn">查看物流</div>';
                    html=html+'<div class="primary-btn">确认收货</div>';
                    html=html+'</div>';
                    html=html+'</div>';
                    html=html+'</li>';
                    $(".order-list").append(html);
                    console.info($(".order-list").html());
    			 });
    			     
    				var pageCount =   data.totalPage;   //取到pageCount的值(把返回数据转成object类型)
    				var currentPage = data.currentPage; //得到urrentPage
    		  
    			}
    		}
    	});
    }

    init(1);
    
    function sub(str){
     if(str.length>45){
       return str.substring(0,45)+'...';
     }else{
       return str;
     } 
    }
    
    </script>
</body>
</html>