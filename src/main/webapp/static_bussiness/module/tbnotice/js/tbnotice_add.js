 var form; 
 var editor = null;
$(function(){ 
	
	 form = FormValid.validbyFormId("#addForm"); 
	 
	  editor = CKEDITOR.replace('F_NOTICE_CONTENT',{
	    	on: {
	            instanceReady: function( ev ) {
	                this.dataProcessor.writer.setRules( 'p', {
	                    indent: false,
	                    breakBeforeOpen: false,   //<p>之前不加换行
	                    breakAfterOpen: false,    //<p>之后不加换行
	                    breakBeforeClose: false,  //</p>之前不加换行
	                    breakAfterClose: false    //</p>之后不加换行7
	                });
	            }
	        }
	    }); //参数'content'是textarea元素的name属性值，而非id属性值
	    editor.setData('这里是需要传递给CKEditor编辑器实例的值');
	    CKFinder.setupCKEditor( editor, ctx+'/ckfinder2.6.2/' ); 
	    
 });
 
 $("#CREATE_DATE").datepicker({
        format: 'yyyy-mm-dd',
	    language: "zh-CN",
	    autoclose: true
 });
 
 function deletePic(PICTURES_ID,table,table_uid_value){
	
	$.ajax({
		url : ctx+"/tbPicturesController/delete.do?PICTURES_ID="+PICTURES_ID,
		//data : data1,
		cache : false,
		async :	false,
		dataType : "json",  
		type : 'post',
		success : function(response) {
			if(!response.iserror){
				if(table_uid_value!=''&&table_uid_value!='undefined'){
					//getPicFile(table,table_uid_value);
				}else{
					
				} 
				var pic = "#"+PICTURES_ID; 
				$(pic).remove(); 
				//<input type="hidden" name="PICTURES_ID" id="PICTURES_ID" />
				var p_input = "#"+PICTURES_ID+"_input";
				console.info($(p_input));
				//$("#editForm").remove($(p_input));
				$(p_input).remove();
				
			} 
			
		}
	});  
}

//保存
function save(){
	  
	if(form.check()){
		editor.updateElement(); 
		$.ajax({
			url : ctx+"/tbnotice/tbNoticeController/save.do",
			data : $("#addForm").serialize(),
			cache : false,
			async :	false,
			dataType : "json",  
			type : 'post',
			success : function(response) {
				 console.info(typeof response);
				 if(!response.iserror){
					xAlert("信息提示","保存成功",1);
					$("#editClose").click();
					reload();
				} 
			}
		});  
	} 
}
