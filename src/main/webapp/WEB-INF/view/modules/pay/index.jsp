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
    <title>啾唧购物车</title>
    <link rel="stylesheet" href="${ctxStaticB}/module/head/css/head.css" type="text/css" />
    <link rel="stylesheet" href="${ctxStaticB}/module/homepage/css/base.css" type="text/css" />

    <link rel="stylesheet" href="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/css/bootstrap.css" type="text/css" /> 
    <link rel="stylesheet" href="${ctxStaticB}/module/product/css/goods.css" type="text/css" />
    <script src="${ctxStatic}/plugin/jquery/jquery-1.11.3/jquery-1.11.3.min.js"></script>
    <script src="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/js/bootstrap.js"></script>
    
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

  <div style="width:100%;background:#f6f6f6;margin:0px auto">
		<div class="container" style="width:1080px;;color: #999999;font-size: 14px;line-height: 34px;">
			  <div class="row">
			         <div class="col-md-3" style="padding-left: 0px;">
		                <div class="col-md-5" style="padding-left: 0px;padding-right: 0px;">欢迎来到啾唧网</div>
		                <div class="col-md-3" style="padding-left: 12px; padding-right: 0px;"><a href="${ctx}/homePageCtrl/toLogin.do" target="_self">请登录</a></div>
		                <div class="col-md-4" style="padding-right: 0px; padding-left: 0px;"><a style="padding-left: 12px;" href="${ctx}/homePageCtrl/toRegister.do" target="_self">免费注册</a></div> 
					 </div>
					 <div class="col-md-4"></div>   
					 <div class="col-md-5">
					    <div class="col-md-3" style="padding-right:12px;"><a href="${ctx}/homePageCtrl/toInformation.do">个人中心</a></div>
		                <div class="col-md-2" style="padding:0px;"><a href="javascript:alert('功能暂未开放')">收藏夹</a></div>
		                <div class="col-md-2" style="padding:0px;"><a href="javascript:alert('功能暂未开放')">购物车</a></div> 
		                <div class="col-md-2" style="padding:0px;"><a  href="javascript:alert('功能暂未开放')"  onMouseOut="hideImg()"  onmouseover="showImg(this)">网站导航</a></div>
		                <div class="col-md-3" style="padding-right: 0px;"><a rel="erweima" href="<%=rootFileApp%>/H54B3F430_0802221451.apk">手机下载</a></div>
		              </div> 
			  </div> 
	    </div>
 </div>
 
    <div style="width:100%;background:white;margin:10px auto"> 
        <div class="container" style="width:1080px;color: black;font-size: 24px;line-height: 34px;text-align:center">
            <div class="row">
                <div class="col-sm-2"><a href="https://www.alipay.com/" class="logo">
                    <img src="${ctxStaticB}/module/homepage/images/logo2.png" height="30px"></a>
                 </div>  
            </div> 	
       </div>
   </div>
   
   <div style="width:100%;background:white;margin:10px auto"> 
	     <div class="container" style="width:1080px;color: black;font-size: 24px;line-height: 34px;text-align:center">
	            <div class="row"> 
	                <div class="col-sm-2" style="text-align:left">确认收货地址</span> </div> 
	            </div>  	
	     </div>
   </div>
   
    
    <div style="width:100%;background:white;margin:0px auto">
        <div class="container" style="width:1080px;color: #999999;font-size: 14px;line-height: 34px;border:1px solid red">
         <div>
         
               <div class="row">   
				        <div class="col-sm-3">商品名称</div>
				        <div class="col-sm-2">单价</div> 
				        <div class="col-sm-2">数量</div> 
				        <div class="col-sm-2">商品价格</div> 
				        <div class="col-sm-3" style="text-align:center">操作</div> 
			   </div>
			   
			    <c:forEach var="tbShopCar" items="${page.data}"> 
				    <div class="row">
				       <div  class="col-sm-3">${tbShopCar.F_ProductName}</div>
				       <div  class="col-sm-2">${tbShopCar.F_SinglePrice}</div>
				       <div  class="col-sm-2">${tbShopCar.F_BuyCount}</div>
				       <div  class="col-sm-2">${tbShopCar.F_Cost}</div>
				       <div  class="col-sm-3" style="text-align:center">
				           <p>
				           <button type="button" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-remove"></span></button>
				           <button type="button" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus"></span></button>
				           </p>
				       </div> 
				    </div>  
		        </c:forEach>  
			 
			 </div>
			   	
			  <div class="row" style="margin-top:100px;background:#f6f6f6;font-size:20px;height:55px;line-height:55px;">
			            <div class="col-sm-1">分享</div>
			            <div class="col-sm-7"></div>   
				        <div class="col-sm-2" style="text-align: right"><span>合计:</span><span style="color:red">${productPrice}</span></div> 
				        <div class="col-sm-2" style="text-align:center">
				            <button type="button" class="btn btn-success btn-sm" id="alisubmit">提交订单</button>
				        </div> 
			 	 
		      </div>	
        </div>  	
    </div>
    
    
        <form action="toAlipayapi.do" class="alipayform" method="POST" target="_blank" style="display:none">
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
                <div class="einput"><input type="text" name="WIDsubject" value="${productName}"></div>
                <br>
                <div class="mark">注意：产品名称(subject)，必填(建议中文，英文，数字，不能含有特殊字符)</div>
            </div>
            <div class="element">
                <div class="etitle">付款金额:</div>
                <div class="einput"><input type="text" name="WIDtotal_fee" value="${productPrice}"></div>
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
        	 $(".alipayform").submit();
         });
 
</script>

</html>