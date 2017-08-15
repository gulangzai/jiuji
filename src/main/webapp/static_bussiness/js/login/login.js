var validate_label;
$(document).ready(function() {  
	 validate_label = $("#loginForm").validate({
			rules: {
				username: {
					required:true,
					minlength : 6,
					maxlength:12
				},
				password: {
					required: true,
					minlength: 6
				}
			}, 
			messages: {
				username: {
					required:"请输入姓名",
					minlength: $.validator.format("用户名不能小于{0}个字 符"),
					maxlength: $.validator.format("用户名不能大于{0}个字 符")
				},
				password: {
					required: "请输入密码",
					minlength: $.validator.format("密码不能小于{0}个字符")
				}
			},
			success: function(label){
				$(label).parent().addClass("checkRight");
				$(label).remove();
			},
			errorPlacement : function(error, element) {
				console.info(element);
				error.appendTo(element.next());
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


(function(){
	$("#submit").click(function(){ 
		if(validate_label.form()){
		    $("#loginForm").submit(); 
		}
	}); 
})(jQuery);