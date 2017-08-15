<%
/* *
 *功能：支付宝即时到账交易接口调试入口页面
 *版本：3.4
 *日期：2016-03-08
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 **********************************************
 */
%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %> 


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<link rel="shortcut icon" href="${ctxStaticB}/images/ico.ico" type="image/x-icon" /> 
  <meta name="description" content="啾唧网 方便快捷，物美价廉，更快送达，诚信服务" /> 
    <meta charset="UTF-8">
    <title>啾唧购物车</title>
    <link rel="stylesheet" href="${ctxStaticB}/css/head.css" type="text/css" />
    <link rel="stylesheet" href="${ctxStaticB}/css/homepage/base.css" type="text/css" />

    <link rel="stylesheet" href="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/css/bootstrap.css" type="text/css" /> <link rel="stylesheet" href="${ctxStaticB}/css/goods.css" type="text/css" />
    <script src="${ctxStatic}/plugin/jquery/jquery-1.11.3/jquery-1.11.3.min.js"></script>
    <script src="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/js/bootstrap.js"></script>
    
  
<style>
 div{
    text-align:center;
 }
</style>
</head> 
<body>

<%@include file="/WEB-INF/view/modules/homemain/headerFirst.jsp"%>
 
    <div style="width:100%;background:white;margin:10px auto"> 
        <div class="container" style="width:1080px;color: black;font-size: 24px;line-height: 34px;text-align:center">
            <div class="row">
                <div class="col-sm-2"><a href="https://www.alipay.com/" class="logo">
                    <img src="${ctxStaticB}/images/homepage/logo2.png" height="30px"></a>
                 </div>
                <div class="col-sm-2" style="text-align:left">购物车</span> 
                <div class="col-sm-8"></div>
            </div>
        </div> 	
    </div>
    
    
       <div style="width:100%;background:white;margin:10px auto"> 
   
	     <div class="container" style="width:1080px;color: black;font-size: 24px;line-height: 34px;text-align:center">
	            <div class="row"> 
	                <div class="col-sm-2" style="text-align:left">确认收货地址</span> </div> 
	            </div> 
	            <c:if test="${page.data== null || fn:length(page.data) == 0}">
	               <div class="row">
	               <div  class="col-sm-10" style="text-align:left;">
	               
	                   <span style="font: 12px arial,sans-serif;">请完善收货地址</span>
	               </div>
	           </c:if>
	           <c:forEach var="tbAddress" items="${pageAddress.data}"> 
				    <div class="row" > 
				           <c:if test="${tbAddress.F_IS_DEFAULT=='1'}">
					       <div  class="col-sm-10" style="text-align:left;" id="${tbAddress.F_ADDRESS_UID}"><input type="radio" checked=true name="address" value="${tbAddress.F_ADDRESS_UID}"/>${tbAddress.F_ADDRESS_DETAIL}(${tbAddress.F_RECEIVE_NAME} 收)${tbAddress.F_RECEIVE_MOBILE}</div>
					       <div  class="col-sm-2" style="text-align:center">  
					          <span>默认地址</span>
					       </c:if>
					       <c:if test="${tbAddress.F_IS_DEFAULT=='0'}">
						       <div  class="col-sm-10" style="text-align:left;" id="${tbAddress.F_ADDRESS_UID}"><input type="radio" name="address" value="${tbAddress.F_ADDRESS_UID}"/>${tbAddress.F_ADDRESS_DETAIL}(${tbAddress.F_RECEIVE_NAME} 收)${tbAddress.F_RECEIVE_MOBILE}</div>
						       <div  class="col-sm-2" style="text-align:center">   
					       </c:if>
					       </div> 
				    </div>  
		        </c:forEach>  
		        
		         	
	     </div>
   </div>
   
    
    
    <div style="width:100%;background:white;margin:0px auto">
        <div class="container" style="width:1080px;color: #999999;font-size: 14px;line-height: 34px;border:1px solid red">
         <div>
         
               <div class="row">  
                        <div class="col-sm-1"></div> 
				        <div class="col-sm-2">商品名称</div>
				        <div class="col-sm-2">单价</div> 
				        <div class="col-sm-2">数量</div> 
				        <div class="col-sm-2">小计</div> 
				        <div class="col-sm-3" style="text-align:center">操作</div> 
			   </div>
			   
			    <c:forEach var="tbShopCar" items="${page.data}"> 
				    <div class="row">
				       <div class="col-sm-1"><input type="checkbox" value="${tbShopCar.F_PRODUCT_ID}"/></div>
				       <div  class="col-sm-2" id="${tbShopCar.F_PRODUCT_ID}name">${tbShopCar.F_ProductName}</div>
				       <div  class="col-sm-2" id="${tbShopCar.F_PRODUCT_ID}price">${tbShopCar.F_Price}</div>
				       <div  class="col-sm-2" id="${tbShopCar.F_PRODUCT_ID}count"><span>${tbShopCar.F_NUMBER}</span></div>
				       <div  class="col-sm-2" id="${tbShopCar.F_PRODUCT_ID}zongji">${tbShopCar.F_COST}</div>
				       <div  class="col-sm-3" style="text-align:center">
				           <p>
				           <button type="button" class="btn btn-success btn-sm" onclick="tbshopcar.del(${tbShopCar.F_SHOPCARID})"><span class="glyphicon glyphicon-remove"></span></button>
				           <button type="button" class="btn btn-success btn-sm" onclick="tbshouchang.add(${tbShopCar.F_SHOPCARID})"><span class="glyphicon glyphicon-plus"></span></button>
				           </p>
				       </div> 
				    </div>  
		        </c:forEach>  
			 
			 </div>
			   	
			  <div class="row" style="margin-top:100px;background:#f6f6f6;font-size:20px;height:55px;line-height:55px;">
			            <div class="col-sm-1">分享</div>
			            <div class="col-sm-6"></div>   
				        <div class="col-sm-3" style="text-align: right"><span>合计(含运费):</span><span style="color:red" id="heji">0</span></div> 
				        <div class="col-sm-2" style="text-align:center">
				            <button type="button" class="btn btn-success btn-sm" id="alisubmit">提交订单</button>
				        </div> 
			 	 
		      </div>	
        </div> 
        
      
				
    </div>
    
    
        <form action="${ctx}/payCtrl/toShopCarAlipayapi.do" class="alipayform" method="POST" target="_blank" style="display:none">
            <input type="hidden" name="F_PRODUCT_IDs" id="F_PRODUCT_IDs" value="${F_Cost}">
            <input type="hidden" name="F_Costs" id="F_Costs" value="${F_Cost}">
            <input type="hidden" name="F_BuyCounts" id="F_BuyCounts" value="${F_BuyCount}">
            <input type="hidden" name="F_SinglePrices" id="F_SinglePrices" value="${F_SinglePrices}">
            <input type="hidden" name="F_ADDRESS_UID" id="F_ADDRESS_UID" value="${F_ADDRESS_UID}">
            
            <div class="element" style="margin-top:60px;">
                <div class="legend">支付宝即时到账交易接口快速通道 </div>
            </div>
            <div class="element">
                <div class="etitle">商户订单号:</div>
                <div class="einput"><input type="text" name="WIDout_trade_no" id="out_trade_no"></div>
                <br>
                <div class="mark">注意：商户订单号(out_trade_no).必填(建议是英文字母和数字,不能含有特殊字符)</div>
            </div>
            
            <div class="element">
                <div class="etitle">商品名称:</div>
                <div class="einput"><input type="text" name="WIDsubject" id="WIDsubject" value="无商品"></div>
                <br>
                <div class="mark">注意：产品名称(subject)，必填(建议中文，英文，数字，不能含有特殊字符)</div>
            </div>
            <div class="element">
                <div class="etitle">付款金额:</div>
                <div class="einput"><input type="text" name="WIDtotal_fee" id="WIDtotal_fee" value="0"></div>
                <br>
                <div class="mark">注意：付款金额(total_fee)，必填(格式如：1.00,请精确到分)</div>
            </div>
			<div class="element">
                <div class="etitle">商品描述:</div>
                <div class="einput"><input type="text" name="WIDbody" value="${productDesc}"></div>
                <br>
                <div class="mark">注意：商品描述(body)，选填(建议中文，英文，数字，不能含有特殊字符)</div>
            </div>
            <div class="element">
                <input type="submit"  value ="确认支付">
            </div>
        </form>
        


<jsp:include page="/WEB-INF/view/modules/homemain/footer.jsp"/>

</body>
<script>

Array.prototype.remove = function(b) { 
	var a = this.indexOf(b); 
	if (a >= 0) { 
	this.splice(a, 1); 
	return true; 
	} 
	return false; 
}; 
	
        var allprice;
        var idLabel=[];
        var nameLabel=[];
        var F_CostsLabel=[];
        var F_BuyCountsLabel=[];
        var F_SinglePricesLabel=[];
        
		$("input[type='checkbox']").change(function(){
			  idLabel =[];
			  nameLabel=[];
			  F_CostsLabel=[];
		      F_BuyCountsLabel=[];
		      F_SinglePricesLabel=[];
			  allprice = 0;
			  $("input[type='checkbox']:checked").each(function(index,ele){
				  if($(this).is(":checked")){
						var id = $(this).val();
						var price = $("#"+id+"price").text(); 
						var buyCount = $("#"+id+"count").text(); 
						var name = $("#"+id+"name").text();
						var zongji = $("#"+id+"zongji").text();
						//allprice = allprice + price*count; 
						idLabel.push(id);
						nameLabel.push(name);
						F_BuyCountsLabel.push(buyCount);
						F_CostsLabel.push(zongji);
						F_SinglePricesLabel.push(price);
						allprice = allprice+ parseFloat(zongji);
				  } 	
		      });
			  
			  $("#WIDtotal_fee").val(allprice);
			  $("#WIDsubject").val(nameLabel.toString());
			  $("#F_PRODUCT_IDs").val(idLabel.toString());
			  $("#F_Costs").val(F_CostsLabel.toString());
			  $("#F_BuyCounts").val(F_BuyCountsLabel.toString());
			  $("#F_SinglePrices").val(F_SinglePricesLabel.toString());
			  $("#heji").text(allprice); 
			 
		});
      
 
         var out_trade_no = document.getElementById("out_trade_no");

         //设定时间格式化函数
         Date.prototype.format = function (format) {
               var args = {
                   "M+": this.getMonth() + 1,
                   "d+": this.getDate(),
                   "h+": this.getHours(),
                   "m+": this.getMinutes(),
                   "s+": this.getSeconds(),
               };
               if (/(y+)/.test(format))
                   format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
               for (var i in args) {
                   var n = args[i];
                   if (new RegExp("(" + i + ")").test(format))
                       format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? n : ("00" + n).substr(("" + n).length));
               }
               return format;
           };
           
         out_trade_no.value = new Date().format("yyyyMMddhhmmss");
         
         
         $("#alisubmit").click(function(){
        	 if($("#WIDtotal_fee").val()=="0"){ 
        		 alert("请选择商品"); 
        		 return;
        	 }
        	 
             $("#F_ADDRESS_UID").val($("input[name='address']:checked").val()); 
        	 
        	 
             var f_address_uid = $("#F_ADDRESS_UID").val();
             if(f_address_uid==''){
            	 alert("请选择收货地址");
            	 return;
             }
             
             $(".alipayform").submit();	
             
         });
         
         var tbshopcar = (function(){
        	var	del = function(F_SHOPCARID){
           		 $.ajax({
           		    	url:'${ctx}/tbshopcar/tbShopCarController/delete.do',
           		    	type:"POST",
           		    	data:{"F_SHOPCARID":F_SHOPCARID},
           		    	success:function(data){
           		    		console.info(data);
           		    		window.location="${ctx}/tbshopcar/tbShopCarController/list.do";
           		    	}
           		}); 
           	};
           	var shouchang = function(F_PRODUCT_ID){
           	    $.ajax({
    		    	url:'${ctx}/tbshouchang/tbShouChangController/save.do',
    		    	type:"POST",
    		    	data:{"F_PRODUCT_ID":F_PRODUCT_ID},
    		    	success:function(data){
    		    		if(!data.iserror){
    		    			alert("收藏成功");
    		    		}
    		    		
    		    	}
    		    }); 
           	};
            return{
           		del:del,
           		shouchang:shouchang
           	};
           	
         })(); 
         
         var tbshouchang = (function(){
         	  var del = function(F_SHOUCHANG_UID){
            		 $.ajax({
            		    	url:'${ctx}/tbshouchang/tbShouChangController/delete.do',
            		    	type:"POST",
            		    	data:{"F_SHOUCHANG_UID":F_SHOUCHANG_UID},
            		    	success:function(data){
            		    		 alert("取消收藏成功");
            		    	}
            		}); 
            	};
            	var add = function(F_PRODUCT_ID){
            	    $.ajax({
     		    	url:'${ctx}/tbshouchang/tbShouChangController/save.do',
     		    	type:"POST",
     		    	data:{"F_PRODUCT_ID":F_PRODUCT_ID},
     		    	success:function(data){
     		    		alert("收藏成功");
     		    	}
     		    }); 
             };
             return{
            		del:del,
            		add:add
            };
            	
          })(); 
 
</script>

</html>