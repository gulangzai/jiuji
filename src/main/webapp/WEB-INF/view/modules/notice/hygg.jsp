<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" /> 
<meta name="description" content="啾唧网 方便快捷，物美价廉，更快送达，诚信服务" />
<meta name="keywords" content="啾唧帮助" />
<title>啾唧-新手帮助</title>  

<link rel="stylesheet" href="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/css/bootstrap.css" type="text/css" /> 
<link rel="shortcut icon" href="${ctxStaticB}/images/logo.ico" type="image/x-icon" /> 
<link rel="stylesheet" href="${ctxStaticB}/module/head/css/head.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/module/homepage/css/base.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctxStaticB}/module/main/css/main.css"/> 
<link rel="stylesheet" href="${ctxStatic}/plugin/jqueryui/jquery-ui-1.12.1.custom/jquery-ui.css">  

<script src="${ctxStatic}/plugin/jquery/jquery-1.11.3/jquery-1.11.3.min.js"></script>
<script src="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/js/bootstrap.js"></script>
<script src="${ctxStatic}/plugin/jqueryui/jquery-ui-1.12.1.custom/jquery-ui.js"></script>


</head>

<body>
<jsp:include page="/WEB-INF/view/modules/homemain/headerThree.jsp"/>


	<div class="container">

		<div class="row">
			
			
  <jsp:include page="/WEB-INF/view/modules/notice/left.jsp"/>
			


			<div class="col-xs-9">
				<!-- 导航写 -->
				<div class="row">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="${ctx}">首页</a></li>


							<li><a href="${ctx}/homePageCtrl/help/toIndex.do">公告中心</a></li>
							<li class="active">会员公告</li>

						</ol>
					</div>
				</div>

				 
				 <div class="row">
					<div class="col-xs-12">
					 
					 	<table  id="jqGrid" class="table table-striped table-bordered table-hover imagetable" >
							  <tr>  
							   </tr> 
							   
							   <tbody  id="tbody">
							       
							   </tbody> 
					    </table> 
					    <ul id="jqGridPager"></ul> 
	    
					 
					 
                    </div>
				</div>
				
				
				 
			</div>

		</div>
	</div>


<jsp:include page="/WEB-INF/view/modules/homemain/footer.jsp"/>

 
 
</body>

<script>

var carId = 1;

function init(currentPage){
	$.ajax({
		url: "${ctx}/tbnotice/tbNoticeController/dataList.do",
		datatype: 'json',
		page:currentPage,
		data:{"page":currentPage,"noticeType":"HYGG"},
		type: "Post", 
		success: function (data) {
			console.info(data);
			var data = eval("("+data+")");
			//console.info(data.data);
			 
			if(data!=null){ 
				
				$("#tbody").empty();
				
				$.each(data.data, function (index, item) { //遍历返回的json
		  
					var f_status = "";
					if(item.F_NOTICE_TYPE=='PTGG'){
						f_status = "[平台公告]";
					}else if(item.F_NOTICE_TYPE=='HYGG'){
						f_status="[会员公告]";
					}else{
						f_status="[其他公告]"; 
					}
					
					var html ='<tr>';  
					html+='<td   style="text-align:center">'+f_status+'</td>'; 
					html+="<td   style='text-align:left'><a href='${ctx}/homePageCtrl/page/notice/tb_notice_detail.do?F_NOTICE_UID="+item.F_NOTICE_UID+"'>"+item.F_NOTICE_TITLE+"</a></td>";    
	                html+='<td   style="text-align:center">浏览量:'+item.F_SEE_NUM+'</td>';  
				    html +='<td  style="text-align:center">'+item.F_CREATE_DATE+'</td>'; 
				 
					
					html+='</tr>'; 
			      
				    $("#tbody").append(html);
				});
			    
				
				var pageCount =   data.total;   //取到pageCount的值(把返回数据转成object类型)
				var currentPage = data.page; //得到urrentPage
				
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
				    	    		   url: "${ctx}/tbnotice/tbNoticeController/dataList.do",
				    	    		   type:"Post",
				    	    		   data:{"page":page,"noticeType":"HYGG"},
				    	    		   success:function(data){	
				    	    			    if(data!=null){
				    	    				   var data = eval("("+data+")");
				    	    				   
				    	    				    $("#tbody").empty();  
			    								
				    	    				  	$.each(data.data,function(index,item){ 
				    	    				  		var f_status = "";
				    	    						if(item.F_NOTICE_TYPE=='PTGG'){
				    	    							f_status = "[平台公告]";
				    	    						}else if(item.F_NOTICE_TYPE=='HYGG'){
				    	    							f_status="[会员公告]";
				    	    						}else{
				    	    							f_status="[其他公告]"; 
				    	    						}
				    	    						
				    	    				  		var html ='<tr>';  
				    	    						html+='<td   style="text-align:center">'+f_status+'</td>'; 
				    	    						html+="<td   style='text-align:left'><a href='${ctx}/homePageCtrl/page/notice/tb_notice_detail.do?F_NOTICE_UID="+item.F_NOTICE_UID+"'>"+item.F_NOTICE_TITLE+"</a></td>";    
				    	    		                html+='<td   style="text-align:center">浏览量:'+item.F_SEE_NUM+'</td>';  
				    	    					    html +='<td  style="text-align:center">'+item.F_CREATE_DATE+'</td>'; 
				    	    					  
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

</script>


</html>




