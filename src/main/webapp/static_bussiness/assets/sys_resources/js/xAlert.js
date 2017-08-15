xAlert = function(title,content,type){
	if(title==null||title==undefined||title==""){
		title="信息提示";
	}
	if(type==undefined){
		type="1";
	}
	var cssName="";
	if(type==1){
		cssName+="gritter-success";
	}
	if(type==2){
		cssName+="gritter-error";
	}
	if(type==3){
		cssName="gritter-warning";
	}
	
	$.gritter.add({
		title:title,
		text:content,
		time:200,
		class_name:cssName
	});
}







