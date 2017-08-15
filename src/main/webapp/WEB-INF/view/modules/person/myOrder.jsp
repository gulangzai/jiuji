<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
<link rel="shortcut icon" href="${ctxStaticB}/images/ico.ico" type="image/x-icon" />

<link rel="stylesheet" href="${ctxStatic}/plugin/gritter/css/jquery.gritter.css" type="text/css" /> 
 

<script src="${ctxStatic}/plugin/jquery/jquery-1.11.3/jquery-1.11.3.min.js"></script>
<script src="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/js/bootstrap.js"></script>
<script src="${ctxStatic}/plugin/bootstrap-paginator/js/bootstrap-paginator.js"></script> 
<script src="${ctxStatic}/plugin/common/default.js"></script> 
<script src="${ctxStatic}/plugin/gritter/js/jquery.gritter.min.js"></script>
<script src="${ctxStatic}/plugin/bootbox/bootbox-4.4.0/bootbox.js"></script>

<style type="text/css">
	table.imagetable {
		font-family: verdana, arial, sans-serif;
		font-size: 14px;
	}
	
	table.imagetable th {
		padding: 8px;
	}
	
	table.imagetable td {
		padding:  8px;
	} 
</style>

</head>
<body> 

 <div class="container-fluid" id="main-container">

<div id="page-content" class="clearfix">
						
  <div class="row-fluid"> 
	<div class="col-sm-12" id="inside">
	
		<table  id="jqGrid" class="table table-striped table-bordered table-hover imagetable" >
			  <tr> 
		                <th   style="text-align:center">订单编号</th>
		                <th   style="text-align:center">商品名</th>
		                <th   style="text-align:center">价格</th> 
		                <th   style="text-align:center">数量</th> 
		                <th   style="text-align:center">总计</th> 
		                <th   style="text-align:center">状态</th> 
					    <th   style="text-align:center">操作</th>
			   </tr> 
			   
			   <tbody  id="tbody">
			       
			   </tbody> 
	    </table> 
	    <ul id="jqGridPager"></ul> 
	    
	   </div> <!-- /row --> 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
 </div><!--/#page-content-->
 </div><!--/.fluid-container#main-container-->

</body>

<script>
var carId = 1;

function init(currentPage){
	$.ajax({
		url: "${ctx}/tborder/tbOrderController/dataList.do",
		datatype: 'json',
		currentPage:currentPage,
		type: "Post", 
		success: function (data) {
			//console.info(data);
			var data = eval("("+data+")");
			//console.info(data.data);
			 
			if(data!=null){ 
				
				$("#tbody").empty();
				
				$.each(data.data, function (index, item) { //遍历返回的json
		  
					var html ='<tr>';  
					html+='<td   style="text-align:center">'+item.F_OrderSeries+'</td>'; 
					html+='<td   style="text-align:center">'+item.F_ProductName+'</td>'; 
				    html+='<td   style="text-align:center">'+item.F_SinglePrice+'</td>';
	                html+='<td   style="text-align:center">'+item.F_BuyCount+'</td>'; 
	                html+='<td   style="text-align:center">'+item.F_Cost+'</td>'; 
					var f_status = "已下单";
					if(item.F_Status=='-1'){
						f_status = "已下单";
					}else if(item.F_Status=='0'){
						f_status="已付款";
					}else if(item.F_Status=='1'){
						f_status="已发货";
					}else if(item.F_Status=='2'){
						f_status="确定收货";
					}else if(item.F_Status=='3'){
						f_status="已完成";
					}
					
				    html +='<td  style="text-align:center">'+f_status+'</td>'; 
					html+='<td   style="text-align:center">'; 
					if(item.F_Status=='1'){
						html+='<button type="button" class="btn btn-success btn-sm" onclick="operate(\''+item.F_ORDER_UID+'\',\'2\')"><span class="glyphicon"></span>确定收货</button>&nbsp;';
					}else if(item.F_Status=='2'){
						html+='<button type="button" class="btn btn-success btn-sm" onclick="operate(\''+item.F_ORDER_UID+'\',\'3\')"><span class="glyphicon"></span>交易成功</button>&nbsp;';
					}
					html+='<button type="button" class="btn btn-danger btn-sm" onclick="del('+item.F_ORDER_UID+')"><span class="glyphicon glyphicon-trash"></span>删除</button>';
					html+='</td>'; 
					
					html+='</tr>'; 
			      
				    $("#tbody").append(html);
				});
			    
				
				var pageCount =   data.totalPage;   //取到pageCount的值(把返回数据转成object类型)
				var currentPage = data.currentPage; //得到urrentPage
				
				if(currentPage!=0){ 
					
					 var options = {
				    		   bootstrapMajorVersion: 3, //版本
				    	       currentPage:currentPage,
				    	       totalPages:pageCount,
				    	       alignment:"left",
				    	       size:"normal", 
				    	       itemTexts:function(type,page,current){
				    	    	   console.info(page);
				    	    	   switch(type){
					    	    	   case "first": return "首页";
					    	    	   case "prev":  return "上一页";
					    	    	   case "next":  return "下一页";
					    	    	   case "last":  return "末页";
					    	    	   case "page":  return page;
				    	    	   }
				    	       },
				    	       onPageClicked:function(event,originalEvent,type,page){
				    	    	   
				    	    	   console.info("page"+page);
				    	    	   $.ajax({
				    	    		   url: "${ctx}/tborder/tbOrderController/dataList.do",
				    	    		   type:"Post",
				    	    		   data:{"currentPage":page},
				    	    		   success:function(data){	
				    	    			    if(data!=null){
				    	    				   var data = eval("("+data+")");
				    	    				   
				    	    				    $("#tbody").empty();  
			    								
				    	    				  	$.each(data.data,function(index,item){ 
				    	    				  		var html ='<tr>';  
				    	    				  		
				    	    				  		html+='<td style="text-align:center">'+item.F_OrderSeries+'</td>'; 
				    	    				  		html+='<td style="text-align:center">'+item.F_ProductName+'</td>'; 
				    	    				  		html+='<td style="text-align:center">'+item.F_SinglePrice+'</td>'; 
				    	    				  		html+='<td style="text-align:center">'+item.F_BuyCount+'</td>'; 
				    	    						html+='<td style="text-align:center">'+item.F_Cost+'</td>'; 
				    	    						
				    	    				  	    var f_status = "已下单";
				    	    						if(item.F_Status=='-1'){
				    	    							f_status = "已下单";
				    	    						}else if(item.F_Status=='0'){
				    	    							f_status="已付款";
				    	    						}else if(item.F_Status=='1'){
				    	    							f_status="已发货";
				    	    						}else if(item.F_Status=='2'){
				    	    							f_status="确定收货";
				    	    						}else if(item.F_Status=='3'){
				    	    							f_status="已完成";
				    	    						}
				    	    					    html+='<td style="text-align:center">'+f_status+'</td>'; 
				    	    						
		                                            html+='<td   style="text-align:center">';
		                                            
		                                        	if(item.F_Status=='1'){
		                        						html+='<button type="button" class="btn btn-success btn-sm" onclick="operate(\''+item.F_ORDER_UID+'\',\'2\')"><span class="glyphicon"></span>确定收货</button>&nbsp;';
		                        					}else if(item.F_Status=='2'){
		                        						html+='<button type="button" class="btn btn-success btn-sm" onclick="operate(\''+item.F_ORDER_UID+'\',\'3\')"><span class="glyphicon"></span>交易成功</button>&nbsp;';
		                        					}
		                                        	
		                                            html+='<button type="button" class="btn btn-danger btn-sm" onclick="del('+item.F_ORDER_UID+')"><span class="glyphicon glyphicon-trash"></span>删除</button>';
		                                            html+='</td>'; 
		                                           
		                                            html+='</tr>'; 
				    						        $("#tbody").append(html);
				    	    				  	}); 
			    								
				    	    			   } 
				    	    		   }
				    	    	   });
				    	       }
				    	    };
					
				    $("#jqGridPager").bootstrapPaginator(options); 
				}
			   
			    
			    
			}
		}
	});
}

init(1);


//del
function del(Id){
	bootbox.confirm("确定要删除吗?", function(result) {
		if(result) {
			 
			var url = "${ctx}/tborder/tbOrderController/delete.do?F_ORDER_UID="+Id+"&tm="+new Date().getTime();
			 
		 	$.ajax({
				url : url,
				cache : false,
				async :	false,
				dataType : "json",  
				type : 'post',
				success : function(response) { 
					 if(!response.iserror){
						xAlert("信息提示","删除成功",1);   
					    var pageNum = $('#jqGridPager').bootstrapPaginator("getPages");
					    init(pageNum); 
					 } 
				}
			});  
			
		}
	});
}

function operate(Id,status){ 
		 
			var url = "${ctx}/tborder/tbOrderController/operate.do?F_ORDER_UID="+Id+"&tm="+new Date().getTime();
			 
		 	$.ajax({
				url : url,
				cache : false,
				data:{F_Status:status},
				async :	false,
				dataType : "json",  
				type : 'post',
				success : function(response) { 
					 if(!response.iserror){
						xAlert("信息提示","操作成功",1);   
					    var pageNum = $('#jqGridPager').bootstrapPaginator("getPages");
					    init(pageNum); 
					 } 
				}
			});    
}


    

    
</script>
</html>