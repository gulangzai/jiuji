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
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/address/css/address_list.css"/>
    
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
        <h1 class="header-title">收货地址</h1>
    </header>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">    <!--必须包有这层，滚动才会生效-->
                <div class="address-list">
                  <!--     <div class="single-address">
                        <i class="circle-checked-icon"></i>
                        <div class="consignee-mes">
                            <p>
                                <span class="consignee-name">何云</span>
                                <span class="consignee-phone">15695481242</span>
                            </p>
                            <p class="consignee-address-details">
                                <span class="default-address-sign">[默认]</span>
                                <span class="specific-address">北京海淀区四环到五环之间北京市海淀区上地东路科实大厦A座401北京海淀区四环到五环之间北京市海淀区上地东路科实大厦A座401</span>
                            </p>
                        </div>
                        <i class="edit-icon"></i>
                    </div>
                  <div class="single-address">
                        <i class="circle-checked-icon"></i>
                        <div class="consignee-mes">
                            <p>
                                <span class="consignee-name">何云</span>
                                <span class="consignee-phone">15695481242</span>
                            </p>
                            <p class="consignee-address-details">
                                <span class="default-address-sign">[默认]</span>
                                <span class="specific-address">北京海淀区四环到五环之间北京市海淀区上地东路科实大厦A座401北京海淀区四环到五环之间北京市海淀区上地东路科实大厦A座401</span>
                            </p>
                        </div>
                        <i class="edit-icon"></i>
                    </div> -->
                </div>
            </div>
        </div>
        <div class="swiper-scrollbar"></div>
    </div>
    <footer class="address-list-footer">
        <div>新增收货地址</div>
    </footer>
    <script src="${ctxStaticB}/wapjiuji/public/js/jquery.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/jump.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/swiper.min.js"></script>
    <script src="${ctxStaticB}/wapjiuji/address/js/address.js"></script>
    <script>
    
        $(".address-list-footer").click(function(){
            window.location.href="${ctx}/pageController/wapjiuji/address/new_address.do";
        });
        
        function addressManager(){
            alert('----');
            window.location.href="${ctx}/pageController/wapjiuji/address/address_management.do";
        }
        
        
        var carId = 1;

        function init(currentPage){
           var F_Status = '${F_Status}';
        	$.ajax({
        		url: "${ctx}/tbaddress/tbAddressController/myWapDataList.do?F_Status="+F_Status,
        		datatype: 'json',
        		currentPage:currentPage,
        		type: "Post", 
        		success: function (data) {
        			console.info(data);
        			var data = eval("("+data+")");
        			
        			console.info(data.data); 
        			if(data!=null){ 
        				
        				$(".address-list").empty();
        				
        				$.each(data.data, function (index, item) { //遍历返回的json
        		         
        		        var html = '<div class="single-address">';
        		        html=html+'<i class="circle-checked-icon"></i>'; 
        		        html=html+'<div class="consignee-mes">';
                        html=html+'<p>';
                        html=html+'<span class="consignee-name">'+item.F_RECEIVE_NAME+'</span>';
                        html=html+'<span class="consignee-phone">'+item.F_RECEIVE_MOBILE+'</span>';
                        html=html+'</p>';
                        html=html+' <p class="consignee-address-details">';
                        html=html+'<span class="default-address-sign">[默认]</span>';
                        html=html+'<span class="specific-address">'+item.F_ADDRESS_DETAIL+'</span>';
                        html=html+'</p>'; 
                        html=html+'</div>';
                        html=html+'<i class="edit-icon" onclick="addressManager()"></i>';
                        html=html+'</div>';   
                        
                        $(".address-list").append(html);
                        console.info($(".order-list").html());
        			 });
        			     
        				var pageCount =   data.totalPage;   //取到pageCount的值(把返回数据转成object类型)
        				var currentPage = data.currentPage; //得到urrentPage
        		  
        			}
        		}
        	});
        }

        init(1);
        
        
      
        $(".edit-icon").click(function(){ 
            window.location.href="${ctx}/pageController/wapjiuji/address/address_management.do";
        });
        
    </script>
</body>
</html>