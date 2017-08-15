<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<link rel="shortcut icon" href="${ctxStaticB}/images/ico.ico" type="image/x-icon" />
<link rel="stylesheet" href="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/css/bootstrap.css" type="text/css" /> 
<link rel="stylesheet" href="${ctxStatic}/plugin/gritter/css/jquery.gritter.css" type="text/css" /> 
<script src="${ctxStatic}/plugin/jquery/jquery-1.11.3/jquery-1.11.3.min.js"></script>
<script src="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/js/bootstrap.js"></script>
<script src="${ctxStatic}/plugin/bootstrap-paginator/js/bootstrap-paginator.js"></script> 
<script src="${ctxStatic}/plugin/common/default.js"></script> 
<script src="${ctxStatic}/plugin/gritter/js/jquery.gritter.min.js"></script>
<script src="${ctxStatic}/plugin/bootbox/bootbox-4.4.0/bootbox.js"></script>  


<link type="text/css" rel="stylesheet" href="${ctxStatic}/plugin/bootstrapvalidator/css/bootstrapValidator.css" />
<script type="text/javascript" src="${ctxStatic}/plugin/bootstrapvalidator/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="${ctxStatic}/plugin/bootstrapvalidator/js/language/zh_CN.js"></script>

</head>
<body>
 <div class="contanier">
    
     <div class="per-infor"><h2>个人资料</h2></div>
     
     <div class="infor-head row">
     <div class="col-sm-3">当前头像：</div>
     <div class="col-sm-9" style="margin-left:12%"><img src="${ctxStaticB}/images/touxiang.jpg" alt="头像" title="头像" /></div>
     </div>
     
     <div class="form">
      <form action="" method="post" id="userForm">
      
       <input class="form-control"  type="hidden" name="F_USER_ID" id="F_USER_ID"   value="" />
       <input class="form-control"  type="hidden" name="F_Deleted" id="F_Deleted"   value="0" />
       
       <div class="form-group row">	
            <label for="relnameInput" class="col-sm-2 col-form-label"><sup>*</sup>用户名:</label>
            <div class="col-sm-10">
               <input class="form-control" readOnly="readOnly" type="text" name="F_UserName" id="F_UserName"   value=""  placeholder="请输入用户名" 
               
                data-bv-message="用户名无效"
               
                data-bv-notempty data-bv-notempty-message="用户名是必须的！"
               
                data-bv-stringlength="true"
                data-bv-stringlength-min="6"
                data-bv-stringlength-max="12"
                data-bv-stringlength-message="用户名必须大于6位小于12位"
                />
            </div>
         </div>
         
          <div class="form-group row">
                <label for="nameInput" class="col-xs-2 col-form-label">昵称:</label>
                <div class="col-sm-10"> 
                    <input  class="form-control"  type="text" name="F_NickName" id="F_NickName"  value="" />
                </div> 
          </div>
         <div class="form-group row">	
            <label for="relnameInput" class="col-sm-2 col-form-label">真实姓名:</label>
            <div class="col-xs-10">
               <input class="form-control"  type="text" name="F_RealName" id="F_RealName"   value="" />
            </div>
         </div>
         
         <div class="form-group row">
            <label for="sexInput" class="col-sm-2 col-form-label"> 性别：</label>
            <div class="col-sm-10">
               <label class="form-check-inline">
               <input class="form-check-input"  name="F_Sex" value="0" type="radio" id="F_Sex0" style="margin:0">男
               </label>
               <label class="form-check-inline">
               <input  class="form-check-input"  name="F_Sex" type="radio" value="1" id="F_Sex1" style="padding-left:15px">女
               </label>
               <label class="form-check-inline">
               <input  class="form-check-input"  name="F_Sex" type="radio" value="2" id="F_Sex2" style="padding-left:15px">未知
               </label>
               
             </div>
         </div> 
         
         <div class="form-group row">	
            <label for="relnameInput" class="col-sm-2 col-form-label"><sup>*</sup>手机号:</label>
            <div class="col-sm-10">
               <input class="form-control"  type="text"  name="F_Mobile" id="F_Mobile"   value="" placeholder="请输入手机号" 
               data-bv-notempty data-bv-notempty-message="手机号是必须的！"
               
                data-bv-stringlength="true"
                data-bv-stringlength-min="11"
                data-bv-stringlength-max="11"
                data-bv-stringlength-message="请输入11位手机号码"
                
         
                />
                      <!--  data-bv-regexp="false"
                data-bv-regexp-regexp="/^1[3|5|8]{1}[0-9]{9}$/"
                data-bv-regexp-message="请输入正确的手机号码" -->
            </div>
         </div>
         
          <div class="form-group row">	
            <label for="relnameInput" class="col-sm-2 col-form-label"><sup>*</sup>邮箱:</label>
            <div class="col-sm-10">
               <input class="form-control" type="email" name="F_Email" id="F_Email"   value="" placeholder="请输入邮箱" 
               data-bv-notempty data-bv-notempty-message="邮箱是必须的！"
               data-bv-emailaddress="true"
               data-bv-emailaddress-message="此邮箱无效"/>
            </div>
         </div>
         
         
          <div class="form-group row">	
            <label for="relnameInput" class="col-sm-2 col-form-label">QQ:</label>
            <div class="col-sm-10">
               <input class="form-control"  type="text"  name="F_QQ" id="F_QQ"   value="" placeholder="请输入QQ号"/>
            </div>
         </div>
         
         
         
       <!--  <div class="form-group row"> 
	        <label class="col-sm-2 col-form-label">生日：</label>
	        <div class="col-sm-10">
			        <select name="born[]" >
			            <option></option>
			                            <option  value="2012">2012</option>
			                            <option  value="2011">2011</option>
			                            <option  value="2010">2010</option>
			                            <option  value="2009">2009</option>
			                            <option  value="2008">2008</option>
			                            <option  value="2007">2007</option>
			                            <option  value="2006">2006</option>
			                            <option  value="2005">2005</option>
			                            <option  value="2004">2004</option>
			                            <option  value="2003">2003</option>
			                            <option  value="2002">2002</option>
			                            <option  value="2001">2001</option>
			                            <option  value="2000">2000</option>
			                    </select>&nbsp;年&nbsp;
			        <select name="born[]" id="month">
			            <option></option>
			                            <option  value="1">1</option>
			                            <option  value="2">2</option>
			                            <option  value="3">3</option>
			                            <option  value="4">4</option> 
			                    </select>&nbsp;月&nbsp;
			        <select name="born[]" id="day">
			            <option></option>
			                            <option  value="1">1</option>
			                            <option  value="2">2</option>
			                            <option  value="3">3</option>
			                            <option  value="4">4</option>
			                            <option  value="5">5</option>
			                            <option  value="6">6</option>
			                            <option  value="7">7</option>
			                            <option  value="8">8</option>
			                    </select>&nbsp;日</p>
                 </div> 
        </div> -->
        
         <div class="form-group row">
            <label class="col-sm-2 col-form-label">家乡：</label>
            <div class="col-sm-10">
               <input  type="text" class="form-control" id="F_Hometown" name="F_Hometown" />
            </div> 
         </div>           
                  
           </form>
           
            <button  class="btn btn-primary" id="save" onclick="save()">保存</button>
            
      </div>
       
 </div> 
</body>

<script>

$(document).ready(function() {
    $('#userForm').bootstrapValidator({
    	message: '存在无效信息',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields:{
        	F_Mobile: {
                 message: 'The phone is not valid',
                 validators: {
                     notEmpty: {
                         message: '手机号码不能为空'
                     },
                     stringLength: {
                         min: 11,
                         max: 11,
                         message: '请输入11位手机号码'
                     },
                     regexp: {
                         regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                         message: '请输入正确的手机号码'
                     }
                 }
             }
        }
    });
});

function init(){
	$.ajax({
		   url: "${ctx}/userCtrl/getUser.do",
		   type:"Post", 
		   success:function(data){	
			   var data = eval("("+data+")");
			   data = data.data;
			   console.info(data);
			    if(data!=null){ 
			    	 $("#F_USER_ID").val(data.F_USER_ID);
			    	 $("#F_UserName").val(data.F_UserName);
				     $("#F_NickName").val(data.F_NickName);  
				     $("#F_RealName").val(data.F_RealName);
				     $("#F_Mobile").val(data.F_Mobile);
				     $("#F_Email").val(data.F_Email);
				     $("#F_QQ").val(data.F_QQ); 
				     if(data.F_Sex=="0"){
				    	 $("#F_Sex0").attr("checked",true);
				     }else if(data.F_Sex=="1"){
				    	 $("#F_Sex1").attr("checked",true);
				     }else{
				    	 $("#F_Sex2").attr("checked",true);
				     }
				     $("#F_Hometown").val(data.F_Hometown);
				 } 
					
		   }  
	});
}

init();

function save(){
	
	 var $form = $("#userForm");

     var data = $form.data('bootstrapValidator');
     if (data) {
     // 修复记忆的组件不验证
        data.validate();

        if (!data.isValid()) {
            return false;
        }
     }
	    
 	 $.ajax({
 		url: "${ctx}/userCtrl/updateUser.do",
		cache : false,
		async :	false,
		data: $("#userForm").serialize(),
		dataType : "json",  
		type : 'post',
		success : function(response) { 
			 if(!response.iserror){
				xAlert("信息提示","更新成功",1);   
			    init(); 
			 } 
		}
	});
}


</script>
</html>