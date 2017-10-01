  function love(obj){  
	    	  if(F_USER_ID.length<=0){
	    		window.open(ctx+"/tbshouchang/tbShouChangController/save.do","_self");
	  		 	return;
	  		  }
		  		
	    		var F_PRODUCT_ID  = $(obj).attr("data-product-id");
	    		var F_SKU  = $(obj).attr("data-product-sku");
	    		$.ajax({
	    			url : ctx+'/tbshouchang/tbShouChangController/save.do',
	    			data : {"FProductId":F_PRODUCT_ID,"FSku":F_SKU}, 
	    			async :	false,
	    			type:"POST",    
	    			success : function(response) {
	    				 console.info(response);
	    				 if(!response.iserror){
	    					//xAlert("信息提示","收藏成功",1);
	    					$(obj).attr("disabled","disabled");
	    				 }else{
	    					 alert("收藏失败");
	    				 } 
	    			}
	    		});   
}