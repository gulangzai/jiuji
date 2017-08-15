var FormValid = new Object();

FormValid.validbyformid = function(formId){
   var v = $(formId).Validform({
      tiptype:function(msg,o,cssctl){
         if(!o.obj.is("form")){
							var objt=o.obj.siblings(".info");
							if(!objt.is("div")){
								var html='<div class="info"><span class="Validform_checktip"></span><span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div>';
								o.obj.after(html);//在该节点后面添加div节点
							}	
							var objtip=o.obj.siblings(".info").find(".Validform_checktip");
							cssctl(objtip,o.type);
							objtip.text(msg);
							
							var infoObj=o.obj.siblings(".info");
							if(o.type==2){
								infoObj.fadeOut(200);
							}else{
								if(infoObj.is(":visible")){return;}
								//var left0=o.obj.siblings(".info").offset().left;	
								var left0=o.obj.position();
								infoObj.css({
									left:left0+10,
									//left:160,
									top:-32
								}).show().fadeOut(5000);
							}
						}
      },datatype:{
         "f8-2":function(){
            var reg1=/^[\d]{1,8}(\.[\d]{1,2})?$/;
            
          }
      }
   });
   return v;
}