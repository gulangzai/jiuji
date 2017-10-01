var validate_label;
$(document).ready(function() { 
	 
	 validate_label = $("#register_form").validate({
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


$(function() {
	$("#register_btn").click(function() { 
		  if(validate_label.form()){
			    var username = $("input[name='username']").val();
			    var mobile = $("input[name='mobile']").val();
				var password = $("input[name='password']").val();
				var email =    $("input[name='email']").val();
				var code = $("input[name='code']").val();
				$.ajax({
		    		type:'post',
		    		url:ctx+'/userCtrl/registerUser.do',
		    		data:{
		    			username:username,
		    			mobile:mobile,  
		    			password:password,
		    			email:email,
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
});