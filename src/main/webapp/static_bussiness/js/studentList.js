(function($){
	
	var tableContent;
	var table;
	 
	//搜索
	$("#search").click(function(){ 
		var keyword = $("input[name='search']").val();//alert(); 
		table.keyword = keyword;
		flush(1,keyword);
	});
	
	//定时器 显示进度 
	function showProgress(){ 
		    var value = $('#p').progressbar('getValue');  
		    value += Math.floor(Math.random() * 10);
		    $('#p').progressbar('setValue', value); 
	}
	
	//导出excel
	var t1;
	$("#exportExcel").click(function(){
		$(".easyui-progressbar").show(); 
		t1 = window.setInterval(showProgress,1000); 
		$.ajax({
    		type:'post',
    		url:ctx+'/myStudent/exportExcel.do',
    		data:{
    			majorId:table.majorId,  
		        headColor:table.headColor
		    },
    		async:true,
    		success:function(sR){
    			if(sR.message=='FAIL'){
    				alert('生成失败');
    			}else{   
    				window.clearInterval(t1); 
    				$(".easyui-progressbar").hide();
    				window.location.href=ctx+"/myStudent/downloadExcel.do";
    			}
    		}
    	});   
	});
	
	 
	$(".colorOpe").click(function(){   
		 
	    $(".colorOpe").each(function(index){
	    	$(this).css("background-image",""); 
	    	   //console.info($(this));
	    });
	    $(this).css("background-image","url("+ctx+"/static/images/studentList/u840.png)");
	 
		var bb = [];
    	for(var k=0;k<table.columns.length;k++){ 
    		bb[k]=table.columns[k].title;
    	}
    	table.headColor=$(this).attr('data');
    	tableContent.empty();
    	table.addHeader(bb); 
    	flush(1);
	});
	
	
    $.fn.table = function(options){  
    	tableContent = this;
    	table = new Table(options);
    	var bb = [];
    	for(var k=0;k<table.columns.length;k++){ 
    		bb[k]=table.columns[k].title;
    	}
    	table.addHeader(bb); 
    	flush(1);
    	return table;
    };
    
    //表格对象
    function Table(options){
    	this.columns = options.columns;
    	this.headColor = options.headColor;
    	this.majorId = options.majorId;
    	this.trNum;
    	this.header = [];   //表头数据
    	this.allData=[];    //
    	this.rowData=[]; 
    	this.contentData=[];//内容数据
    	this.$lis=[];       //分页标签
    	this.currentPage=1; //选中的当前页
    	this.allPageNum;    //总共的页数
    	this.allRecodeNum;  //总的数据量
    	this.keyword;       //搜索的关键词 
    }
    
    //获取数据
    function getRemoteData(currentPage,keyword){
    	$.ajax({
    		type:'post',
    		url:ctx+'/myStudent/allStudent.do',
    		async:false,
    		data:{
    			marjorId:'8Z5FqMVTQ4QZtJMQfbtp',
    			currentPage:currentPage,
    			keyword:keyword,
    			headColor:table.headColor
    		},
    		success:function(sR){
    			var dd=sR.data.obj;
    			for(var i=0;i<dd.length;i++){ 
    			    var aa = [];
    			    aa[0]=(parseInt(currentPage)-1)*5+i+1;
    			    aa[1]=dd[i].studentName;
    			    aa[2]=dd[i].studentId;
    			    aa[3]=dd[i].mobile;
    			    aa[4]=dd[i].lastTime;
    			    aa[5]=dd[i].firstDuration;
    			    aa[6]=dd[i].rightRate;
    			    aa[7]=dd[i].studentAttr;
    			    aa[8]=dd[i].studentSource;
    			    table.addContentTr(aa);
    			}
    			table.allRecodeNum = sR.data.allRecodeNum; 
    		}
    	});
    }
    
    //添加表头
    function addHeader(){ 
    	for(var ii=0;ii<table.header.length;ii++){
    		tableContent.append(table.header[ii]); 
    	}
    }
    
    //添加数据
    function addData(){ 
    	for(var i=0;i<table.contentData.length;i++){ 
    		tableContent.append(table.contentData[i]); 
    	} 
    }
    
 
    Tr.prototype.addTh = function(thData){
    	this.rowData[this.rowData.length] = new Th(thData);
    }
    
    Tr.prototype.addTd = function(tdData){
    	this.rowData[this.rowData.length] = new Td(tdData);
    } 
    
    Table.prototype.addOperate = function($tr,trData){
    	var $th = $('<td style="width:350px;"><a href="javascript:void(0)" onclick="studentDetail(\''+trData[2]+'\')">查看详情</a>'
    			+'<a href="javascript:void(0)" onclick="table.deleteStudentByPhone('+trData[3]+')">删除</a>'
    			+'<a href="javascript:void(0)" onclick="table.resetPassword('+trData[3]+')">重置密码</a></td>');
    	$tr.append($th);
    }
    
    
    Table.prototype.addTr = function(trData){
    	this.allData[this.allData.length] = new Tr(trData);
    }
    
    Table.prototype.addHeader = function(trData){
    	this.header=[];
    	this.header[this.header.length] = new TrTh(trData);
    }
    
    Table.prototype.addContentTr = function(trData){ 
    	var tr = new Tr(trData); 
    	this.addOperate(tr,trData);
    	this.contentData[this.contentData.length] = tr;
    }
    
    //分页下标(当前页,总共的记录条数)
    function addPageTool(currentPage,allRecodeNum){ 
    	tableContent.next().remove();
    	var $ulDiv = $('<div style="magin-top:0px;"></div>'); 
    	$ulDiv.append(table.createUI(currentPage,allRecodeNum));
    	tableContent.after($ulDiv);  
    	return $ulDiv;
    }
    
    function RenderLi(btnLabel,currentPage){
    	var $li = $('<li onclick="table.myClick(\''+btnLabel+'\');">'+currentPage+'</li>'); 
    	return $li;
    }
    
    Table.prototype.createUI = function(currentPage,allRecodeNum){ 
    	this.currentPage=currentPage;
    	var allPageNum = (parseInt(allRecodeNum%5)==0)?parseInt(allRecodeNum/5):parseInt(allRecodeNum/5)+1;
    	//alert(allRecodeNum+'-'+allPageNum);
    	this.allPageNum=allPageNum;
    	 //alert(allRecodeNum+'总共页数'+allPageNum);
    	var $ul = $("<ul class='pages'></ul>"); 
    	var $li= new RenderLi('first',"首页");
    	$ul.append($li);
    	$li  = new RenderLi("last","上一页")
    	$ul.append($li);	
    	this.$lis[this.$lis.length]=$li;
    	var startLi = 1;
    	var endLi = 9;
    	
    	if(currentPage>4){
    		startLi = parseInt(currentPage)-4;
    		endLi = parseInt(currentPage)+4;
    	}
    	if(allPageNum<endLi){
    		endLi = allPageNum;
    	}
    	if(allPageNum<startLi){
    		startLi = 1;
    		endLi = 1;
    	}
    	//alert(currentPage+'-'+startLi+'-'+endLi);
    	for (var point = startLi; point < endLi; point++) {
    		var $li = new RenderLi(point,point); 
    		if(point==currentPage){
    			$li.addClass("pgCurrent");
    		}
    		this.$lis[this.$lis.length]=$li;
    		$ul.append($li);
    	}  
    	var num = 10;
    	if(allPageNum>endLi){
    		$li=new RenderLi("...","...");
    		num=+1;
        	this.$lis[this.$lis.length]=$li;
        	$ul.append($li);
    	} 
    	
    	//末页
    	$li = new RenderLi(allPageNum,allPageNum);
    	if(this.allPageNum==currentPage){
    		$li.addClass("pgCurrent");
    	}
    	$ul.append($li);
    	
    	$li=new RenderLi("next","下一页"); 
    	this.$lis[this.$lis.length]=$li; 
    	$ul.append($li);   
    	
    	//共多少页
    	$li = new RenderLi("all","共"+allPageNum+"页");
    	$ul.append($li);
    	return $ul;
    }
    
    //点击标签页
    Table.prototype.myClick = function(currentPage){  
    	if(currentPage=='first'){
    		this.currentPage = 1;
    		 currentPage = 1;
    	}
    	if(currentPage=='all') return;
    	if(currentPage=='...') return;
    	if(currentPage=='last'){
    	  	this.currentPage = this.currentPage -1;
    	}else if(currentPage=='next'){
    		this.currentPage = parseInt(this.currentPage) +1; 
    	}else{
    		this.currentPage = currentPage;
    	} 
    	currentPage = this.currentPage; 
    	if(currentPage<1) this.currentPage=1;
    	else if(currentPage>this.allPageNum) this.currentPage = this.allPageNum;  
    	//alert(currentPage);
    	//判断是否搜索
    	var keyword = $("input[name='search']").val();
    	if(keyword=='')
    	   flush(this.currentPage);
    	else{
    		//alert('搜索'+keyword);
    		 flush(this.currentPage,table.keyword); 
    	} 
    } 
    
    function flush(currentPage){
    	//清空表格数据
    	table.contentData=[];
    	//表操作
    	getRemoteData(currentPage);
    	tableContent.empty(); 
    	addHeader();
    	//添加表格样式
    	addData();   
    	//alert('--ss-'+this.allRecodeNum);
    	addPageTool(currentPage,table.allRecodeNum); 
    }
    
    function flush(currentPage,keyword){
    	//清空表格数据
    	table.contentData=[];
    	//表操作
    	getRemoteData(currentPage,keyword);
    	tableContent.empty(); 
    	addHeader();
    	//添加表格样式
    	addData();    
    	addPageTool(currentPage,table.allRecodeNum); 
    }
    
    //初始化
    function init(){
    	tableContent.empty(); 
		addHeader();
		table.contentData=[]; 
    }
    
    Table.prototype.deleteStudentByPhone = function(phone){  
    	$.messager.confirm("确认", '你确认要删除该学员?', function (r) {  
		    	if(r){
		    		$.ajax({
			    		type:'post',
			    		url:ctx+'/myStudent/deleteStudentByPhone.do',
			    		async:false,
			    		data:{
			    			phone:phone
			    		},
			    		success:function(sR){
			    			if(sR.message=='DELETE_YES'){
			    				alert("删除成功"); 
			    				flush(table.currentPage,table.keyword);
			    			}else{
			    				alert("删除失败");
			    			} 
			    		}
			    	});
		    	} 
		    });
    }
    
    //重置密码
    Table.prototype.resetPassword = function(phone){   
        $.messager.confirm("确认", '你确认重置密码吗?', function (r) {  
    	        if (r) {  
    	        	$.ajax({
    	        		type:'post',
    	        		url:ctx+'/myStudent/resetPassword.do',
    	        		async:false,
    	        		data:{
    	        			phone:phone
    	        		},
    	        		success:function(sR){
    	        			if(sR.message=='RESET_SUCCESS'){
    	        				alert("密码重置成功,为初始密码123456");
    	        			} else{
    	        				alert("密码重置失败");
    	        			}
    	        		}
    	        	}); 
    	            return true;  
    	        }  
    	}); 
    }
    
    
    function TrTh(ths){
    	 var $tr = $('<tr></tr>');
     	 for(var i=0;i<ths.length;i++)
   		 $tr.append(new Th(ths[i])); 
     	 return $tr;
    }
    
    function Tr(ths){   
    	 var $tr = $('<tr></tr>');
    	 for(var i=0;i<ths.length;i++)
    		 $tr.append(new Td(ths[i])); 
    	 return $tr;
    } 
    function Th(data){
    	var $th = $('<th style="background-color:'+table.headColor+';color:white;">'+data+'</th>');
    	return $th;
    }
    
    function Td(data){
    	var $td = $('<td>'+data+'</td>');
    	return $td;
    }
})(jQuery);