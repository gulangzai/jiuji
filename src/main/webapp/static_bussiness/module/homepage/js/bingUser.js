var validate_label;
var have_no_account_form_validate_label;

$(document).ready(function() { 
	 
	 validate_label = $("#haveAccountUserQQbingForm").validate({
			rules: {
				username: {
					required:true,
					minlength : 6,
					maxlength:12,
					remote:{
	 					type: "POST",
	 					url:  ctx+"/userCtrl/checkUsername.do",
	 					async: false,
	 					dataType: "json",   
	 					data: {
	 						data:function(){
	 							var username = $("input[name='username']").val();
	 						    var mobile = $("input[name='mobile']").val();
	 							var password = $("input[name='password']").val();
	 							var email =    $("input[name='email']").val();
	 							var data =  {
	 				    			username:username,
	 				    			mobile:mobile,  
	 				    			password:password,
	 				    			email:email
	 						    };
	 							return data;
	 						}
	 					}
	 				} 
		        },
				password: {
					required: true,
					minlength: 6
				},
				rpassword: {
					equalTo: "#register_password"
				},
				email: {
					required: true,
					email: true,
					remote:{
	 					type: "POST",
	 					url:  ctx+"/userCtrl/checkEmail.do",
	 					async: false,
	 					data: {
	 						data:function(){
	 							var username = $("input[name='username']").val();
	 						    var mobile = $("input[name='mobile']").val();
	 							var password = $("input[name='password']").val();
	 							var email =    $("input[name='email']").val();
	 							var data =  {
	 				    			username:username,
	 				    			mobile:mobile,  
	 				    			password:password,
	 				    			email:email
	 						    };
	 							return data;
	 						}
	 					}
	 				}
				},
				mobile : {
					required : true,
					minlength : 11,  
					// 自定义方法：校验手机号在数据库中是否存在
					//checkPhoneExist : true,
					isMobile : true,
					remote:{
	 					type: "POST",
	 					url:  ctx+"/userCtrl/haveAccountCheckMobile.do",
	 					async: false,
	 					data: {
	 						DATA:function(){ 
	 						    var mobile = $("haveAccountUserQQbingForm input[name='mobile']").val(); 
	 							var data =  { 
	 				    			mobile:mobile
	 						    };
	 							return data;
	 						}
	 					}
	 				} 
				}
			}, 
			messages: {
				username: {
					required:"请输入姓名",
					minlength: $.validator.format("用户名不能小于{0}个字 符"),
					maxlength: $.validator.format("用户名不能大于{0}个字 符"),
					remote:"用户已存在"
				},
				password: {
					required: "请输入密码",
					minlength: $.validator.format("密码不能小于{0}个字 符")
				},
				rpassword: {
					required: "请输入确定密码",
					equalTo: "两次密码不一样"
				},
				email: {
					required: "请输入邮箱",
					email: "请输入有效邮箱",
					remote:"该邮箱已用"
				},
				mobile : {
					required : "请输入手机号",
					minlength : "确认手机不能小于11个字符",
					isMobile : "请正确填写您的手机号码",
					remote:"该手机号不存在"
				}
			},
			success: function(label){
				$(label).parent().addClass("checkRight");
				$(label).remove();
			},
			errorPlacement : function(error, element) {
				console.info(element);
				error.appendTo(element.next());
			},
			submitHandler: function(form){
				alert("验证通过");
			}
		});
	 
	 have_no_account_form_validate_label = $("#have_no_account_form").validate({
			rules: {
				username: {
					required:true,
					minlength : 6,
					maxlength:12,
					remote:{
	 					type: "POST",
	 					url:  ctx+"/userCtrl/checkUsername.do",
	 					async: false,
	 					dataType: "json",   
	 					data: {
	 						data:function(){
	 							var username = $("input[name='username']").val();
	 						    var mobile = $("input[name='mobile']").val();
	 							var password = $("input[name='password']").val();
	 							var email =    $("input[name='email']").val();
	 							var data =  {
	 				    			username:username,
	 				    			mobile:mobile,  
	 				    			password:password,
	 				    			email:email
	 						    };
	 							return data;
	 						}
	 					}
	 				} 
		        },
				password: {
					required: true,
					minlength: 6
				},
				rpassword: {
					equalTo: "#register_password"
				},
				email: {
					required: true,
					email: true,
					remote:{
	 					type: "POST",
	 					url:  ctx+"/userCtrl/checkEmail.do",
	 					async: false,
	 					data: {
	 						data:function(){
	 							var username = $("input[name='username']").val();
	 						    var mobile = $("input[name='mobile']").val();
	 							var password = $("input[name='password']").val();
	 							var email =    $("input[name='email']").val();
	 							var data =  {
	 				    			username:username,
	 				    			mobile:mobile,  
	 				    			password:password,
	 				    			email:email
	 						    };
	 							return data;
	 						}
	 					}
	 				}
				},
				mobile : {
					required : true,
					minlength : 11,  
					// 自定义方法：校验手机号在数据库中是否存在
					//checkPhoneExist : true,
					isMobile : true,
					remote:{
	 					type: "POST",
	 					url:  ctx+"/userCtrl/checkMobile.do",
	 					async: false,
	 					data: {
	 						DATA:function(){
	 							var username = $("input[name='username']").val();
	 						    var mobile = $("input[name='mobile']").val();
	 							var password = $("input[name='password']").val();
	 							var email =    $("input[name='email']").val();
	 							var data =  {
	 				    			username:username,
	 				    			mobile:mobile
	 						    };
	 							return data;
	 						}
	 					}
	 				}
				},
				code:{
					required : true
				}
			}, 
			messages: {
				username: {
					required:"请输入姓名",
					minlength: $.validator.format("用户名不能小于{0}个字 符"),
					maxlength: $.validator.format("用户名不能大于{0}个字 符"),
					remote:"用户已存在"
				},
				password: {
					required: "请输入密码",
					minlength: $.validator.format("密码不能小于{0}个字 符")
				},
				rpassword: {
					required: "请输入确定密码",
					equalTo: "两次密码不一样"
				},
				email: {
					required: "请输入邮箱",
					email: "请输入有效邮箱",
					remote:"该邮箱已用"
				},
				mobile : {
					required : "请输入手机号",
					minlength : "确认手机不能小于11个字符",
					isMobile : "请正确填写您的手机号码",
					remote:"该手机号已用"
				},
				code:{
					required : "请输入验证码"
				}
			},
			success: function(label){
				$(label).parent().addClass("checkRight");
				$(label).remove();
			},
			errorPlacement : function(error, element) {
				console.info(element);
				error.appendTo(element.next());
			},
			submitHandler: function(form){
				alert("验证通过");
			}
		});
	 
	
});

//添加自定义验证规则
//手机号码验证
jQuery.validator.addMethod("isMobile", function(value, element) {
	var length = value.length;
	var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
	return this.optional(element) || (length == 11 && mobile.test(value));
}, "请正确填写您的手机号码");


var i=60;
var flag = true;
function remainTime(){ 
	flag = false;
	var obj = $("#haveAccountSendCode");
	var textLabel = "获取手机动态密码";
	var label = obj.text();
    if(i==0){  
    	 obj.text(textLabel); 
    	 flag = true; 
    	 return;
    }  
    obj.text(i+"秒后重试"); 
    i=i-1;
    setTimeout("remainTime()",1000);  
}  

function noCountRemainTime(){ 
	flag = false;
	var obj = $("#haveNoAccountSendCode");
	var textLabel = "获取手机动态密码";
	var label = obj.text();
    if(i==0){  
    	 obj.text(textLabel); 
    	 flag = true; 
    	 return;
    }  
    obj.text(i+"秒后重试"); 
    i=i-1;
    setTimeout("noCountRemainTime()",1000);  
}  




$(function() {
	$("#have_account_btn").click(function() { 
		  if(validate_label.form()){ 
			    var mobile = $("#haveAccountUserQQbingForm input[name='mobile']").val();  
				var F_OPEN_ID = $("input[name='F_OPEN_ID']").val();
				var code = $("#haveAccountUserQQbingForm input[name='code']").val(); 
				$.ajax({
		    		type:'post',
		    		url:ctx+'/userCtrl/haveAccountUserQQbing.do',
		    		data:{ 
		    			mobile:mobile,   
		    			F_OPEN_ID:F_OPEN_ID,
		    			code:code
				    },
				    dataType: "json", 
		    		async:false,
		    		success:function(sR){ 
		    			if(sR.message=='FAIL'){
		    				alert('已有账户绑定失败');
		    			}else if(sR.message=='NOEXIST'){
		    				alert("该用户不合法");
		    			}else if(sR.message=='ERRORCODE'){
		    				alert("验证码错误");
		    			}else if(sR.message=='SUCCESS'){ 
		    				window.location=ctx+"/homePageCtrl/toHomePage.do"; 
		    			}
		    		}
		    	});  
		  } 
	}); 
	
	$("#haveAccountSendCode").click(function(){
		var mobileObj = $("#haveAccountUserQQbingForm input[name='mobile']");
		var mobile=$("#haveAccountUserQQbingForm input[name='mobile']").val(); 
		if(flag){
			  if(validate_label.element(mobileObj)){ 
			       	  $.ajax({
			       		type:'post',
			       		url:ctx+'/userCtrl/sendCode.do',
			       		data:{
			       			mobile:mobile
			   		    },
			   		    dataType: "json", 
			       		async:false,
			       		success:function(sR){ 
			       			if(sR.message=='SEND'){
			       			   //alert('验证码已发送');
			       			   remainTime(); 
			       			}else if(sR.message=='SENDERROR'){
			       				alert("验证码发送失败");
			       			}
			       		}
			       	});
			  } 
    	}  
	}); 
	
	
	
	
	$("#have_no_account_btn").click(function() { 
		  if(have_no_account_form_validate_label.form()){ 
			    var username = $("#have_no_account_form input[name='username']").val();
			    var mobile = $("#have_no_account_form  input[name='mobile']").val();
			    var code = $("#have_no_account_form  input[name='code']").val();
				var password = $("#have_no_account_form  input[name='password']").val(); 
				var email =    $("#have_no_account_form  input[name='email']").val();
				var password = $("#have_no_account_form  input[name='password']").val();
				var F_OPEN_ID = $("input[name='F_OPEN_ID']").val();
				$.ajax({
		    		type:'post',
		    		url:ctx+'/userCtrl/haveNoAccountUserQQbing.do',
		    		data:{ 
		    			username:username,
		    			mobile:mobile,  
		    			email:email,
		    			F_OPEN_ID:F_OPEN_ID,
		    			password:password,
		    			code:code 
				    },
				    dataType: "json", 
		    		async:false,
		    		success:function(sR){ 
		    			if(sR.message=='FAIL'){
		    				alert('注册失败');
		    			}else if(sR.message=='EXIST'){
		    				alert("用户已经存在");
		    			}else if(sR.message=='ERRORCODE'){
		    				alert("验证码错误");
		    			}else if(sR.message=='SUCCESS'){ 
		    				window.location=ctx+"/homePageCtrl/toHomePage.do"; 
		    			}
		    		}
		    	});  
		  } 
	}); 
	

	
	$("#haveNoAccountSendCode").click(function(){
		var mobileObj = $("#have_no_account_form input[name='mobile']");
		var mobile=$("#have_no_account_form input[name='mobile']").val(); 
		if(flag){
			  if(have_no_account_form_validate_label.element(mobileObj)){ 
			       	  $.ajax({
			       		type:'post',
			       		url:ctx+'/userCtrl/sendCode.do',
			       		data:{
			       			mobile:mobile
			   		    },
			   		    dataType: "json", 
			       		async:false,
			       		success:function(sR){ 
			       			if(sR.message=='SEND'){
			       			   //alert('验证码已发送');
			       			  noCountRemainTime(); 
			       			}else if(sR.message=='SENDERROR'){
			       				alert("验证码发送失败");
			       			}
			       		}
			       	});
			  } 
    	}  
	}); 
	
 
	
	
	
	
	
	
	    
	
});