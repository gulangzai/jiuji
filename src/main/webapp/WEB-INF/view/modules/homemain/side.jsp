<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%> 
 
<style> 
/* side */
.side{position:fixed;width:54px;height:275px;right:0;top:214px;z-index:100;}
.side ul li{width:54px;height:54px;float:left;position:relative;border-bottom:1px solid #444;}
.side ul li .sidebox{position:absolute;width:54px;height:54px;top:0;right:0;transition:all 0.3s;background:#000;opacity:0.8;filter:Alpha(opacity=80);color:#fff;font:14px/54px "微软雅黑";overflow:hidden;}
.side ul li .sidetop{width:54px;height:54px;line-height:54px;display:inline-block;background:#000;opacity:0.8;filter:Alpha(opacity=80);transition:all 0.3s;}
.side ul li .sidetop:hover{background:#ae1c1c;opacity:1;filter:Alpha(opacity=100);}
.side ul li img{float:left;} 
.side ul li .sidebox1{position:absolute;width:54px;height:54px;top:0;right:0;transition:all 0.3s;background:#000;opacity:0.8;filter:Alpha(opacity=80);color:#fff;font:14px/54px "微软雅黑";overflow:hidden;}
</style>
   
<div class="side">
  <ul> 
	  <li><a href="http://wpa.qq.com/msgrd?v=3&uin=1871710810&site=qq&menu=yes" target="_blank"><div class="sidebox1"><img src="http://demo.lanrenzhijia.com/2014/service1108/side_icon04.png" alt="点击这里给我发消息" title="点击这里给我发消息"/>QQ客服</div></a></li>
	  <li><a href="#"><div class="sidebox"><img src="http://demo.lanrenzhijia.com/2014/service1108/side_icon01.png">客服热线:<span style='font-size:16px;'>18855953679</span></div></a></li>
      <li style="border:none;"><a href="javascript:goTop();" class="sidetop"><img src="http://demo.lanrenzhijia.com/2014/service1108/side_icon05.png"></a></li>
  </ul>
</div>
	
	
<script>
$(function(){
	$(".side ul li").hover(function(){
		$(this).find(".sidebox").stop().animate({"width":"224px"},200).css({"opacity":"1","filter":"Alpha(opacity=100)","background":"#ae1c1c"})	
	},function(){
		$(this).find(".sidebox").stop().animate({"width":"54px"},200).css({"opacity":"0.8","filter":"Alpha(opacity=80)","background":"#000"})	
	});
	
	 
});
//回到顶部函数
function goTop(){
	$('html,body').animate({'scrollTop':0},300);
}
</script>
