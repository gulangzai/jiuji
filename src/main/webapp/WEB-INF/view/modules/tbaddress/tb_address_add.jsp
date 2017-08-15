<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%>



 <%
String rootFile = request.getScheme()+"://"+request.getServerName()+":8088/file";
String rootFileApp = request.getScheme()+"://"+request.getServerName()+":8088/app"; 

%>


<div class="container">
<div class="modal-dialog"  tabindex="-1" role="dialog" style="width:80%">
   <div class="modal-content">
      <div class="modal-header">
         <button type="button" class="close"
            data-dismiss="modal" aria-hidden="true">
               &times;
         </button>
         <h4 class="modal-title" id="myModalLabel">
                                           添加收货地址
         </h4>
      </div>
      
      <div class="modal-body">
           <form class="form-horizontal" action="${ctx}/tbaddress/tbAddressController/edit.do" role="form" name="Form" id="addForm" method="post">
           	 <input type="hidden" name="F_ADDRESS_UID" id="F_ADDRESS_UID" value="${pd.F_ADDRESS_UID}"/>
           	 <input type="hidden" name="F_IS_DEFAULT" id="F_IS_DEFAULT" value="${pd.F_IS_DEFAULT}"/>
	 
		 
					       <div class="form-group">
						          <label class="col-sm-2 control-label">地区:</label>
						          <div class="col-sm-10">  
						             <input type="text" class="form-control" id="F_DIQU"  name="F_DIQU"  value="${pd.F_DIQU}"  placeholder="请填写地区" title="地区">
						          </div>  
						    </div>
					  
					       <div class="form-group">
						          <label class="col-sm-2 control-label">详细地址:</label>
						          <div class="col-sm-10">  
						             <input type="text" class="form-control" id="F_ADDRESS_DETAIL"  name="F_ADDRESS_DETAIL"  value="${pd.F_ADDRESS_DETAIL}"  placeholder="请填写详细地址" title="详细地址">
						          </div>  
						       </div>
					       <div class="form-group">
						          <label class="col-sm-2 control-label">邮政编码:</label>
						          <div class="col-sm-10">  
						             <input type="text" class="form-control" id="F_POSTAL_CODE"  name="F_POSTAL_CODE"  value="${pd.F_POSTAL_CODE}"  placeholder="请填写邮政编码" title="邮政编码">
						          </div>  
						       </div>
					       <div class="form-group">
						          <label class="col-sm-2 control-label">收件人:</label>
						          <div class="col-sm-10">  
						             <input type="text" class="form-control" id="F_RECEIVE_NAME"  name="F_RECEIVE_NAME"  value="${pd.F_RECEIVE_NAME}"  placeholder="请填写收件人" title="收件人">
						          </div>  
						       </div>
					       <div class="form-group">
						          <label class="col-sm-2 control-label">手机号:</label>
						          <div class="col-sm-10">  
						             <input type="text" class="form-control" id="F_RECEIVE_MOBILE"  name="F_RECEIVE_MOBILE"  value="${pd.F_RECEIVE_MOBILE}"  placeholder="请填写手机号" title="手机号">
						          </div>  
						   </div> 
						   
						    <div class="form-group">
						          <label class="col-sm-2 control-label">是否设为默认地址:</label>
						          <div class="col-sm-1">  
						             <input type="checkbox" class="form-control" id="F_IS_DEFAULT_CHECK"   value="0">
						          </div>  
						   </div> 
						   
						   
						   
	   
    </form> 
   </div>
      
      <!-- --------------------------footer----------------------------------- -->
      
      <div class="modal-footer">
         <button type="button" class="btn btn-default" id="editClose"
            data-dismiss="modal">关闭
         </button>
         <button type="button" class="btn btn-primary" onclick="save()">
              保存
         </button>
      </div>
      
      
   </div><!-- /.modal-content -->
</div><!-- /.modal -->
 
 
 </div>
 
 
 <script type="text/javascript">
	 var form;
	 $(function(){ 
		 form = FormValid.validbyFormId("#addForm"); 
		 
		 $("input[type='checkbox']").change(function(ele){
			 if($(this).is(":checked")){
				 $("#F_IS_DEFAULT").val("1"); 
			 }else{
				 $("#F_IS_DEFAULT").val("0");
			 }
			
		 });
	 });
  
	/* $("#CREATE_DATE").datepicker({
	        format: 'yyyy-mm-dd',
		    language: "zh-CN",
		    autoclose: true
     });
	*/
     
	 function deletePic(PICTURES_ID,table,table_uid_value){
		
		$.ajax({
			url : "${ctx}/tbPicturesController/delete.do?PICTURES_ID="+PICTURES_ID,
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
			$.ajax({
				url : "${ctx}/tbaddress/tbAddressController/save.do",
				data : $("#addForm").serialize(),
				cache : false,
				async :	false,
				dataType : "json",  
				type : 'post',
				success : function(response) {
					 console.info(typeof response);
					 if(!response.iserror){
						xAlert("信息提示","上传成功",1);
						$("#editClose").click();
						//$("#INDEX_Form").submit();
						init();
					} 
				}
			});  
		} 
	}
	 
 
 </script>
