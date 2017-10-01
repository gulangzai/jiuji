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
    <meta charset="UTF-8">
    <title>啾唧立即购买</title>
    <link rel="stylesheet" href="${ctxStaticB}/module/head/css/head.css" type="text/css" />
    <link rel="stylesheet" href="${ctxStaticB}/module/homepage/css/base.css" type="text/css" />
    <link rel="stylesheet" href="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/css/bootstrap.css" type="text/css" /> 
    <link rel="stylesheet" href="${ctxStaticB}/module/product/css/goods.css" type="text/css" />
    <script src="${ctxStatic}/plugin/jquery/jquery-1.11.3/jquery-1.11.3.min.js"></script>
    <script src="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/js/bootstrap.js"></script>
   
   <!-- 弹框 -->
<script src="${ctxStatic}/plugin/bootbox/bootbox-4.4.0/bootbox.js"></script>
 
    <!-- 提示牌 -->
<script src="${ctxStatic}/plugin/gritter/js/jquery.gritter.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/plugin/gritter/css/jquery.gritter.css" />  

    <!-- tips -->
<script src="${ctxStatic}/plugin/tips/jquery.tips_v0.1/jquery.tips.js"></script> 
    
   
   <!-- 表单验证 -->
<link rel="stylesheet" type="text/css" href="${ctxStatic}/plugin/validform/validform_v5.3.2/css/form_validate.css" />
<script type="text/javascript" src="${ctxStatic}/plugin/validform/validform_v5.3.2/js/Validform_v5.3.2_min.js"></script>
   
    
    
    <script type="text/javascript" src="${ctxStatic}/plugin/common/default.js"></script>
    <script type="text/javascript" src="${ctxStatic}/plugin/common/common.js"></script>

    <%
	  String rootFile = request.getScheme()+"://"+request.getServerName()+":8088/file";
	  String rootFileApp = request.getScheme()+"://"+request.getServerName()+":8088/app";  
	%>
<style>
 div{
    text-align:center;
 }
</style>
</head> 
<body>
 
  <jsp:include page="/WEB-INF/view/modules/homemain/headerSecond.jsp"></jsp:include>
    
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
	           <c:forEach var="tbAddress" items="${page.data}"> 
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
				        <div class="col-sm-2"></div>
				        <div class="col-sm-3">商品名称</div>
				        <div class="col-sm-2">商品属性</div>
				        <div class="col-sm-1">单价</div> 
				        <div class="col-sm-1">数量</div> 
				        <div class="col-sm-1">总计</div>  
				        <div class="col-sm-2">操作</div>  
			   </div>
			    
				    <div class="row" style="">
				       <div  class="col-sm-2" style="text-align:center">
				          <img style="width:200px;height:100px;" src="" id="F_PATH"/> 
				       </div>
				       <div  class="col-sm-3" style="text-align:center">
				           <span id="F_ProductName" style="line-height: 16px;text-align: left;float: left;"> ${F_ProductName}</span>
				       </div>
				       <div  class="col-sm-2" style="padding: 25px;">
				          <span style="display: block;">${productAttr}</span> 
				       </div>
				       <div  class="col-sm-1" style="padding: 25px;">
				          <span style="display: block;">${F_PRICE}</span>
				       </div>
				       <div  class="col-sm-1" style="padding: 25px;">
				       <span style="display: block;">${F_BuyCount}</span> 
				       </div>
				       <div  class="col-sm-1" style="padding: 25px;">
				       <span  id="zongji" style="display: block;"></span>
				       </div>
				       <div  class="col-sm-2" style="text-align:center;padding:25px 0px;">
				            
				           <button type="button" class="btn btn-success btn-sm" onclick="tbshopcar.add(${F_PRODUCT_ID})">加入购物车</button>
				           
				       </div> 
				    </div>   
			 
			 </div>
			  
			   <div class="row" style="height:100px;"> 
			  </div>
			   	
			  <div class="row">
			        <div  class="col-sm-12" style="text-align: left;">   
			        <span>给商家留言：</span> <input type="text" id="F_Message_textArea"/>
			        </div>
			  </div>
			  <div class="row" style="margin-top:0px;background:#f6f6f6;font-size:20px;height:55px;line-height:55px;">
			            <div class="col-sm-4"></div> 
			            <div class="col-sm-3"><span>优惠券</span><select id="youhuiSelect"><option>请选择</option></select></div>  
				        <div class="col-sm-3" style="text-align: right"><span>合计(含运费):</span>￥<span style="color:red" id="heji">${F_SinglePrice}</span></div> 
				        <div class="col-sm-2" style="text-align:center">
				            <button class="btn btn-success btn-sm" id="alisubmit" style="margin-top: 12px;">提交订单</button>	 
				        </div> 
			 	 
		      </div>	
        </div> 
        
      
				
    </div>
    
    
        <form action="toAlipayapi.do" class="alipayform" method="POST" target="_blank" style="display:none">
             <input type="hidden" name="F_YOUHUI_USER_UID" id="F_YOUHUI_USER_UID" value=""/>
             <input type="hidden" name="F_SKU" id="F_SKU" value="${F_SKU}"> 
             <input type="hidden" name="F_PRODUCT_ID" id="F_PRODUCT_ID" value="${F_PRODUCT_ID}"> 
             <input type="hidden" name="F_ProductAttr" id="F_ProductAttr" value="${productAttr}"> 
             <input type="hidden" name="F_SinglePrice" id="F_SinglePrice" value="${F_PRICE}">
             <input type="hidden" name="F_BuyCount" id="F_BuyCount" value="${F_BuyCount}">
             <input type="hidden" name="F_Cost" id="F_Cost" value="${F_Cost}">
             <input type="hidden" name="F_Express" id="F_Express" value="${F_Express}">
             <input type="hidden" name="F_ADDRESS_UID" id="F_ADDRESS_UID" value="${F_ADDRESS_UID}">
             <input type="hidden" name="F_Message" id="F_Message" value="${F_Message}">
               
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
                <div class="einput"><input type="text" name="WIDsubject" id="WIDsubject" value="${F_ProductName}"></div>
                <br>
                <div class="mark">注意：产品名称(subject)，必填(建议中文，英文，数字，不能含有特殊字符)</div>
            </div>
            <div class="element">
                <div class="etitle">付款金额:</div>
                <div class="einput"><input type="text" name="WIDtotal_fee" id="WIDtotal_fee" value="${F_SinglePrice}"></div>
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

var youhuiArray = [];
var zongji = 0;

    $(function(){
    	
    	
    	initSelect();
    	
    	var product = ${product};
    	console.info(product);
    	var buyCount = "${F_BuyCount}";
    	var singlePrice = "${F_SinglePrice}";
    	var F_Express = "${F_Express}";
    	var F_PRICE = "${F_PRICE}";
    	var F_ProductName = "${F_ProductName}";
        zongji = buyCount*F_PRICE+parseInt(F_Express);
    	$("#zongji").text(zongji);
    	$("#heji").text(zongji);
    	
    	$("#WIDtotal_fee").val(zongji);
    	$("#F_Cost").val(zongji);
    	$("#F_PATH").attr("src",product.F_PATH);
    	$("#F_ProductName").text(F_ProductName);
    	 
    });
    
    /* 初始化select */
    function initSelect(){
    	$("#youhuiSelect").empty().append("<option value='0'>请选择</option>");
    	$.ajax({
    		url:"${ctx}/tbYouhuiCtrl/querySelf.do",
    		success:function(data){
    			console.info(data);
    			data = eval("("+data+")");
    			youhuiArray  = data;
    			data.forEach(function(ele){ 
    				$("#youhuiSelect").append("<option value='"+ele.F_YOUHUI_USER_UID+"'>"+ele.F_YOUHUI_CODE+"</option>");
    			});
    		}
    	});
     }
    
    $("#youhuiSelect").change(function(){
    	//alert($("#youhuiSelect").val());
    	var chooseYouhui = $("#youhuiSelect").val();
    	var flag = false;
    	var szongji = zongji;
    	youhuiArray.forEach(function(ele){
    		if(ele.F_YOUHUI_USER_UID==chooseYouhui){
    			szongji = zongji  - ele.F_MONEY; 
    			$("#F_YOUHUI_USER_UID").val(chooseYouhui); 
    		}
    	});
    	$("#heji").text(szongji);
    	$("#WIDtotal_fee").val(szongji);
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
        	 var text = document.getElementById("F_Message_textArea").value;  
        	 
        	 $("#F_Message").val(text); 
        	 $("#F_ADDRESS_UID").val($("input[type='radio']:checked").val()); 
        	 
        	 
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
           	var add = function(F_PRODUCT_ID){
           	    $.ajax({
    		    	url:'${ctx}/tbshopcar/tbShopCarController/save.do',
    		    	type:"POST",
    		    	data:{"F_PRODUCT_ID":F_PRODUCT_ID},
    		    	success:function(data){
    		    		console.info(data);
    		    		if(!data.iserror){
    		    			xAlert("信息","添加购物车成功",1);
    		    		}
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