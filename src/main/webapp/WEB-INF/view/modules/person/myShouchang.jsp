<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的收藏</title>
<link rel="shortcut icon" href="${ctxStaticB}/images/ico.ico" type="image/x-icon" />

<link rel="stylesheet" href="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/css/bootstrap.css" type="text/css" /> 
<link rel="stylesheet" href="${ctxStatic}/plugin/gritter/css/jquery.gritter.css" type="text/css" /> 
 

<script src="${ctxStatic}/plugin/jquery/jquery-1.11.3/jquery-1.11.3.min.js"></script>
<script src="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/js/bootstrap.js"></script>
<script src="${ctxStatic}/plugin/bootstrap-paginator/js/bootstrap-paginator.js"></script> 
<script src="${ctxStatic}/plugin/common/default.js"></script> 
<script src="${ctxStatic}/plugin/gritter/js/jquery.gritter.min.js"></script>
<script src="${ctxStatic}/plugin/bootbox/bootbox-4.4.0/bootbox.js"></script>  
 
</head>
<body> 
		<div class="container" style="width:780px;color: #999999;font-size: 14px;line-height: 34px;">
			  <div class="row"> 
		            
		                <div class="col-md-3" style="text-align:center">商品名</div>
		                <div class="col-md-2" style="text-align:center">商品价格</div> 
		                <div class="col-md-2" style="text-align:center">状态</div> 
					    <div class="col-md-3" style="text-align:center">操作</div>
			   </div> 
			   
			   <div class="row mytable">
			       
			   </div>
			   
			      
			   <ul id="example" class="row"></ul>
			    
			
			   
		   
			   
			   
	    </div> 
</body>

<script>

var options = null;

var carId = 1;

function init(currentPage){
	$.ajax({
		url: "${ctx}/tbshouchang/tbShouChangController/dataList.do",
		datatype: 'json',
		currentPage:currentPage,
		type: "Post", 
		success: function (data) {
			//console.info(data);
			var data = eval("("+data+")");
			console.info(data.data);
			 
			if(data!=null){ 
				
				$(".mytable").empty();
				
				$.each(data.data, function (index, item) { //遍历返回的json
		  
					$(".mytable").append('<div class="row">');  
				    $(".mytable").append('<div class="col-md-3" style="text-align:center">'+item.F_ProductName+'</div>'); 
					$(".mytable").append('<div class="col-md-2" style="text-align:center">'+item.F_SinglePrice+'</div>'); 
					if(item.F_Status=='0'){
						$(".mytable").append('<div class="col-md-2" style="text-align:center">正常</div>'); 
				  	}else{
				  	    $(".mytable").append('<div class="col-md-2" style="text-align:center">下线</div>'); 
				  	} 
					$(".mytable").append('<div class="col-md-3" style="text-align:center"><button type="button" class="btn btn-danger btn-sm" onclick="del('+item.F_SHOUCHANG_UID+')"><span class="glyphicon glyphicon-trash"></span>删除</button></div>'); 
					$(".mytable").append('</div>'); 
			      
					
				});
			    
				
				var pageCount =   data.totalPage;   //取到pageCount的值(把返回数据转成object类型)
				var currentPage = data.currentPage; //得到urrentPage
				if(currentPage!=0){ 
				    options = {
				    		   bootstrapMajorVersion: 3, //版本
				    	       currentPage:currentPage,
				    	       totalPages:pageCount,
				    	       alignment:"left",
				    	       size:"normal", 
				    	       itemTexts:function(type,page,current){
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
				    	    		   url: "${ctx}/tbshouchang/tbShouChangController/dataList.do",
				    	    		   type:"Post",
				    	    		   data:{"currentPage":page},
				    	    		   success:function(data){	
				    	    			    if(data!=null){
				    	    				   var data = eval("("+data+")");
				    	    				   
				    	    				    $(".mytable").empty();  
			    								
				    	    				  	$.each(data.data,function(index,item){ 
				    	    				  		var html ='';
				    	    				  		//html+='<div class="row">';  
				    	    				  		html+='<div class="col-md-3" style="text-align:center">'+item.F_ProductName+'</div>'; 
				    	    				  	    html+='<div class="col-md-2" style="text-align:center">'+item.F_SinglePrice+'</div>'; 
				    	    				  	    if(item.F_Status=='0'){
				    	    				  	      html+='<div class="col-md-2" style="text-align:center">正常</div>'; 
				    	    				  	    }else{
				    	    				  	      html+='<div class="col-md-2" style="text-align:center">下线</div>'; 
				    	    				  	    }
				    	    	                 
		                                            html+='<div class="col-md-3" style="text-align:center"><button type="button" class="btn btn-danger btn-sm" onclick="del('+item.F_SHOUCHANG_UID+')"><span class="glyphicon glyphicon-trash"></span>删除</button></div>'; 
		                                           // html+='</div>'; 
				    						        $(".mytable").append(html);
				    	    				  	}); 
			    								
				    	    			   } 
				    	    		   }
				    	    	   });
				    	       }
				    	    };
					
				    $("#example").bootstrapPaginator(options); 
			    
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
			 
			var url = "${ctx}/tbshouchang/tbShouChangController/delete.do?F_SHOUCHANG_UID="+Id+"&tm="+new Date().getTime();
			 
		 	$.ajax({
				url : url,
				cache : false,
				async :	false,
				dataType : "json",  
				type : 'post',
				success : function(response) { 
					 if(!response.iserror){
						xAlert("信息提示","删除成功",1);  
						//alert($('#example').bootstrapPaginator("getPages"));
					    var pageNum = $('#example').bootstrapPaginator("getPages");
					    init(pageNum);
					    //$('#example').bootstrapPaginator("show",1); 
						//options.onPageClicked('','','',pageNum);
					 } 
				}
			});  
			
		}
	});
}


    

    
</script>
</html>