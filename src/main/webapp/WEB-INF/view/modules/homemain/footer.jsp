<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%>
<style>
#footer {
    /* height: 60px; */
    /* background-color: #f5f5f5; */
    color: #999;
    text-align: center;
    padding: 0px 0;
    margin-top: 40px;
    border-top: 0px solid #e5e5e5;
    /* background-color: #f5f5f5; */
    font-size: 12px;
}

.IndexBottom {
    padding-top: 20px;
    padding-bottom: 10px;
    border-top: 2px solid #f40;
}
a {
    color: #dd4814;
    text-decoration: none;
}
</style>
<div id="footer" style="width:100%;margin:0px auto;"> 
	
		<div class="container">
			<div class="row IndexBottom col-xs-12" style="margin-top:20px;">
				
				
					<div class="col-xs-6 col-sm-2" style="text-align: center;">
						<div class="row" style="margin-bottom: 10px;"><strong>新手上路</strong></div>
						
							<div class="row" style="line-height: 20px;">
								<a href="${ctx}/homePageCtrl/help/toXsbz.do" target="_blank">
									新手帮助
								</a>
							</div> 
					</div>
				
					<div class="col-xs-6 col-sm-2" style="text-align: center;">
						<div class="row" style="margin-bottom: 10px;"><strong>购物指南</strong></div>
						
							<div class="row" style="line-height: 20px;">
								<a href="${ctx}/homePageCtrl/help/toGwlc.do" target="_blank">
									购物流程
								</a>
							</div>
						
							<div class="row" style="line-height: 20px;">
								<a href="${ctx}/homePageCtrl/help/toCjwt.do" target="_blank">
									常见问题
								</a>
							</div>
						
					</div>
				
					<div class="col-xs-6 col-sm-2" style="text-align: center;">
						<div class="row" style="margin-bottom: 10px;"><strong>支付方式</strong></div>
						
							<div class="row" style="line-height: 20px;">
								<a href="${ctx}/homePageCtrl/help/toZfbzf.do" target="_blank">
									支付宝支付
								</a>
							</div>
						
					</div>
				
					<div class="col-xs-6 col-sm-2" style="text-align: center;">
						<div class="row" style="margin-bottom: 10px;"><strong>配送方式</strong></div>
						
							<div class="row" style="line-height: 20px;">
								<a href="${ctx}/homePageCtrl/help/toKdsh.do" target="_blank">
									快递送货
								</a>
							</div>
						
					</div>
				
					<div class="col-xs-6 col-sm-2" style="text-align: center;">
						<div class="row" style="margin-bottom: 10px;"><strong>注册协议</strong></div>
						
							<div class="row" style="line-height: 20px;">
								<a href="${ctx}/homePageCtrl/help/toZcxy.do" target="_blank">
									注册协议
								</a>
							</div>
						
					</div>
				
					<div class="col-xs-6 col-sm-2" style="text-align: center;">
						<div class="row" style="margin-bottom: 10px;"><strong>关于我们</strong></div>
						
							<div class="row" style="line-height: 20px;">
								<a href="${ctx}/homePageCtrl/help/toGywm.do" target="_blank">
									关于我们
								</a>
							</div>
						
					</div>
				
			</div>
			<hr style="margin: 0px;">
			<!-- 友情链接 -->
			
			<div class="row">
				<div class="col-xs-12 col-sm-12" style="text-align: center;">
					<div style="text-align: center;margin: auto;">
						
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.1688.com" target="_blank">阿里巴中国站</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.taobao.com" target="_blank">淘宝</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.jd.com" target="_blank">京东商城</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.yixun.com" target="_blank">易讯</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.alibaba.com" target="_blank">阿里巴巴</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.alipay.com" target="_blank">支付宝</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.aliyun.com" target="_blank">阿里云计算</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.laiwang.com" target="_blank">来往</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.net.cn" target="_blank">万网</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.yhd.com" target="_blank">一号店</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.tmall.com" target="_blank">天猫商城</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.dangdang.com" target="_blank">当当网</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.suning.com" target="_blank">苏宁</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.yintai.com" target="_blank">银泰网</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.moonbasa.com" target="_blank">梦芭莎</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://redbaby.suning.com" target="_blank">红孩子</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.amazon.cn" target="_blank">亚马逊</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.tenpay.com" target="_blank">财付通</a>
							</div>
						
							<div style="float: left;margin: 5px;">
								<a href="http://www.kuaidi100.com" target="_blank">快递查询</a>
							</div>
						 
						
					</div>
				</div>
			</div>
			<hr style="margin: 0px;">
			<div class="row col-xs-12 col-sm-12" style="margin-top: 5px;display: inline;">
				<div class="col-xs-12 col-sm-3">
				</div>
				<div class="col-xs-12 col-sm-5">
					<p style="text-align: center;"> ©2000-2016  啾唧在线电子商务有限公司   版权所有 皖ICP备16007801号
						<a target="_blank" href="http://www.aliyun.com/"><img src="http://gtms01.alicdn.com/tps/i1/T1W6.aFbFbXXcZj_6s-96-18.png" alt="运行在阿里云"></a>
					</p>
				</div>
				<div class="col-xs-12 col-sm-1">
					<!-- cnzz站点统计 --> 
					<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1261246065'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/stat.php%3Fid%3D1261246065%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
					<!--<span id="cnzz_stat_icon_1261246065"><a href="http://www.cnzz.com/stat/website.php?web_id=1261246065" target="_blank" title="站长统计"><img border="0" hspace="0" vspace="0" src="https://icon.cnzz.com/img/pic.gif"></a></span>
					<script src=" https://s95.cnzz.com/stat.php?id=1261246065&amp;show=pic" type="text/javascript"></script>
					<script src="https://c.cnzz.com/core.php?web_id=1261246065&amp;show=pic&amp;t=z" charset="utf-8" type="text/javascript"></script>  -->
				</div>
				<div class="col-xs-12 col-sm-3">
				</div>
			</div>
		</div>
	</div>
	
<script>
$(function(){
	$(".weixin-logo").hover(function(){
		$(".weixin").show();
		//$(this).find(".weixin-logo").stop().animate({"width":"224px"},200).css({"opacity":"1","filter":"Alpha(opacity=100)","background":"#ae1c1c"})	
	},function(){
		$(this).find(".sidebox").stop().animate({"width":"54px"},200).css({"opacity":"0.8","filter":"Alpha(opacity=80)","background":"#000"})	
	}); 
	 
});

</script>
	
	
	