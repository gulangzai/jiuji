<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="啾唧网 方便快捷，物美价廉，更快送达，诚信服务" />
<meta name="keywords" content="啾唧首页" />


<title>啾唧-主页</title> 
<!--[if lt IE 9]>
  <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
<![endif]-->
<meta http-equiv="X-UA-Compatible" content="edge" />
<link rel="stylesheet" type="text/css" href="${ctxStaticB}/module/homepage/css/index.css">
<script src="${ctxStaticB}/module/homepage/js/jquery-1.8.3.min.js"></script>
<script src="${ctxStaticB}/module/homepage/js/jquery.fly.min.js"></script>
<script src="${ctxStaticB}/module/homepage/js/public.js"></script>
<!--[if lte IE 9]>
</script><script src="${ctxStaticB}/module/homepage/js/ie9.js"></script>
<![endif]-->
<script src="${ctxStaticB}/module/homepage/js/base.js"></script>
<script>document.createElement("top")</script>
<script>document.createElement("search")</script>
<script>document.createElement("light")</script>
<script>document.createElement("light1")</script>
</head>

<% 
String rootFileApp = request.getScheme()+"://"+request.getServerName()+":8088/app";  
String rootFile = "https://www.jiujichina.com/fileSystem";
String appSystem = "https://www.jiujichina.com/appSystem";

String F_USER_ID = null;
if(session.getAttribute("F_USER_ID")!=null){
	   F_USER_ID = session.getAttribute("F_USER_ID").toString();
}

%>

<body>
<!--最大的背景-->
 <div class="maxbj"></div>  


<!--头部-->
<top>
	<section class="seck">
    	
        <div class="register_login">
        
               <c:choose>
                <c:when test="${F_USER_ID==''||empty F_USER_ID}">
                
                 <a href="${ctx}/homePageCtrl/toLogin.do" target="_self">会员登录</a>
                  <a href="${ctx}/homePageCtrl/toRegister.do" target="_self">快速注册</a> 
                </c:when>  
                <c:otherwise>
                     <em>您好，</em>
                     <a href="javascript:void(0)">${USERNAME}</a></li>
				     <a href="${ctx}/userCtrl/logout.do" target="_self">登出</a> 
				</c:otherwise>
				</c:choose> 
				 
        </div>
        <div class="vip_center">
        	<a href="${ctx}/homePageCtrl/toInformation.do">会员中心</a>
            <%-- <a rel="erweima" href="<%=appSystem%>/H54B3F430_0802221451.apk">手机下载</a> --%>
        </div>
    </section>
</top>
<!--header-->
<div class="maxbj1">
<header>
	<b class="logo"><img src="${ctxStaticB}/module/homepage/images/logo2.png" width="145"></b>
    <search>
    	<form>
        	<input type="text" placeholder="查询关键词..." required style=" width:440px; height:30px; text-indent:2em; float:left; box-shadow:none">
            <button>搜索</button>
        </form>
    </search>
    <div class="sping_car">
    	<b></b>
        <em><a href="${ctx}/tbshopcar/tbShopCarController/list.do" target="_blank">我的购物车</a></em>
    </div>
</header>
</div>
<!--导航-->
<section class="dao_hang">
	<nav>
    	<!--右下侧广告-->
        <div class="advertisement">
        	<h4>最新公告</h4>
            <div class="notice_new">
                      <c:forEach var="tbNotice" items="${tbNotices}" varStatus="status">
                             <p><a href="${ctx}/homePageCtrl/page/notice/tb_notice_detail.do?F_NOTICE_UID=${tbNotice.FNoticeUid}">【${tbNotice.FNoticeTypeLabel}】${tbNotice.FNoticeTitle}</a></p>
					  </c:forEach>   
					    
            	<%-- <p><a href="${ctx}/homePageCtrl/notice/toIndex.do">【优选】金秋聚会，买一送一</a></p>
                <p><a href="#">【优选】中秋嘉年华，好礼钜惠</a></p>
                <p><a href="#">【优选】冰点破纪录，低价不猫腻</a></p>
                <p><a href="#">【优选】开学季，“纸”想“净、净”学习</a></p>
                <p><a href="#">【优选】金秋聚会，买一送一</a></p>
                <p><a href="#">【优选】中秋嘉年华，好礼钜惠</a></p>
                <p><a href="#">【优选】开学季，“纸”想“净、净”学习</a></p> --%>
            </div>
            <a href="#">
            	<div class="notice_img">
            	    <img src="${ctxStaticB}/module/homepage/images/activity.jpg" class="img1">
                    <img src="${ctxStaticB}/module/homepage/images/activity.jpg" class="img2">
                </div>
            </a>
            <!--<script>
			$(function(){
				$(".notice_img")
				})
            </script>-->
        </div>
    	<!--全部商品分类-->
    	<div class="important"><img src="${ctxStaticB}/module/homepage/images/all_list.png" style=" margin-top:8px">&nbsp;全部商品分类
        	<aside>
            	<ul>
            	      <c:forEach var="tClass" items="${tclasses}" varStatus="status">
					        <li class="cates" mt-ct="list${status.index + 1}"> 
								<h3>${tClass.F_ClsName} </h3>  
								<p>
		                        	<!-- <a href="#">洗衣粉</a>
		                            <a href="#">马桶刷</a>
		                            <a href="#">不锈钢龙头</a> -->
		                         <c:forEach var="sonTClass"  begin="0" end="2" items="${tClass.sonTClasses}" varStatus="status1">
					                 <a class="cate_detail_con_lk" href="${ctx}/productCtrl/toProjectListPage.do?f_clsId=${sonTClass.F_ClsId}">${sonTClass.F_ClsName}</a>  
							     </c:forEach> 
							        <i style="font-family:'宋体';color:#666; line-height:23px; font-size:14px; float:left">></i>
		                        </p>
							</li>
					    </c:forEach>   
					    
					    <!-- <li class="cates"  mt-ct="list05">
                    	<h3>卫生洁具</h3>
                        <p>
                        	<a href="#">洗衣粉</a>
                            <a href="#">马桶刷</a>
                            <a href="#">不锈钢龙头</a>
                            <i style="font-family:'宋体';color:#666; line-height:23px; font-size:14px; float:left">></i>
                        </p>
                        </li> -->
                    
                </ul>
            </aside>
            <div>
            
                <c:forEach var="tClass" items="${tclasses}" varStatus="status">
			         <div class="import_list b-list${ status.index + 1}">
				           
					        <c:forEach var="sonTClass" items="${tClass.sonTClasses}" varStatus="status1">
					        
					            <c:if test="${(status1.index+1)%10==1}"> 
						             <dd>
						       </c:if> 
					       
							    <a class="cate_detail_con_lk" href="${ctx}/productCtrl/toProjectListPage.do?f_clsId=${sonTClass.F_ClsId}">${sonTClass.F_ClsName}</a>  
							
							     <c:if test="${(status1.index+1)%10==0||fn:length(tClass.sonTClasses)==(status1.index+1)}"> 
					                   </dd>
					              </c:if>
			              
							</c:forEach> 
						 
					 </div>
			    </c:forEach>    
					    
                <!-- <div class="import_list b-list05"> 
                    <dd>
                    	<a href="#">T恤</a>
                        <a href="#">休闲裤</a>
                        <a href="#">条纹T</a>
                        <a href="#">牛仔裤</a>
                        <a href="#">针织运动裤</a>
                        <a href="#">潮T</a>
                        <a href="#">格子衬衫</a>
                        <a href="#">村棉印花T恤</a>
                        <a href="#">纯色衬衫</a>
                        <a href="#">牛仔夹克</a>
                        <a href="#">迷彩风</a>
                    </dd> 
                    <dt>与内容无关：</dt>
                    <dd>
                    	<a href="#">T恤</a>
                        <a href="#">休闲裤</a>
                        <a href="#">条纹T</a>
                        <a href="#">牛仔裤</a>
                        <a href="#">针织运动裤</a>
                        <a href="#">潮T</a>
                        <a href="#">格子衬衫</a>
                        <a href="#">村棉印花T恤</a>
                        <a href="#">纯色衬衫</a>
                        <a href="#">牛仔夹克</a>
                        <a href="#">迷彩风</a>
                    </dd>
                </div>  -->
            </div>	
        </div>
        <!--结束-->
        <div class="dao_list">
        	<a href="${ctx}/homePageCtrl/toHomePage.do">首页</a> 
        </div>
        
    </nav>
</section>
<!--banner-->
<div id="banner_tabs" class="flexslider">
    <ul class="slides">
	     <c:forEach var="tCarousel" items="${tCarousels}">
				  <li>
				      <a href="${tCarousel.F_Url}" target="_blank">
				         <img  width="1920" height="500" alt=""  src="${ctxStaticB}/${tCarousel.F_Address}"  style="background: url(${ctxStaticB}/${tCarousel.F_Address}) no-repeat center;"  />
				       </a>  
				  </li>
		 </c:forEach>  
	</ul>
	<ul class="flex-direction-nav">
		<li><a class="flex-prev" href="javascript:;">Previous</a></li>
		<li><a class="flex-next" href="javascript:;">Next</a></li>
	</ul>
	<ol id="bannerCtrl" class="flex-control-nav flex-control-paging">
		<li class="active"><a>1</a></li>
		<li><a>2</a></li>
		<li><a>2</a></li> 
	</ol>
</div>
<script src="${ctxStaticB}/module/homepage/js/slider.js"></script>
<!--gong告-->
<script type="text/javascript">
		window.onload=function(){
		$("top").animate({'margin-top':'0'},2000)	
		$(".advertisement").animate({'top':'30','opacity':'1'},200)
		$(".flexslider").animate({'margin-top':'0'},200)
		$("aside").animate({'top':'30','opacity':'1'},200)
		$("top").animate({'margin-top':'-400'},1000)
		
		}
</script>
<!--楼层分布图-->

<div class="fixed_position">
	<div class="fixed_position_1">
    	<ul>
        	<!-- <li>超级福包</li>  -->
            <li>首饰配件</li>
            <li>兴趣爱好</li>
            <li>精品上衣</li>
            <li>潮鞋新尚</li>
            <li>化妆美容</li>
            <li>时尚炫酷</li> 
            <li>新品上市</li>
            <li>产品特卖</li>
            <li>推荐商品</li>
        </ul>
    </div>
</div>
<!--福包专区-->
<%-- <span class="as blessing_package">
	<h3>超级福包<font>每日精选，好礼优惠不停</font></h3>
</span>    
<div class="three_fb">
	<ul>
    	<li>
        	<light>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang1.png">
            </light>
			<a href="liebiao_page.html"><img src="${ctxStaticB}/module/homepage/images/1.jpg"></a> 	
            <span>价值288元</span>
            <a href="#">查看福包</a>
            <em>200人已购买</em>
  	      </li>
        <li>
        	<light>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang1.png">
            </light>
        		<a href="liebiao_page.html"><img src="${ctxStaticB}/module/homepage/images/3.jpg"></a> 
            <span>价值288元</span>
            <a href="#">查看福包</a>
            <em>200人已购买</em>
        </li>
        <li>
        	<light>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang1.png">
            </light>
        	<a href="liebiao_page.html"><img src="${ctxStaticB}/module/homepage/images/2.jpg"></a> 
            <span>价值288元</span>
            <a href="#">查看福包</a>
            <em>200人已购买</em>
        </li>
    </ul>
</div> --%>
<!--应季商品-->
<%-- <span class="as blessing_package">
	<a href="#" style=" color:#000"><h3 style="float:left">&nbsp;应季商品<img src="images/zd.png" style="display:block; float:left; margin-top:5px"></h3></a>
    <div class="detailed_navigation">
    	<ul>
        	<li class="dog d-1-lt01 yadi"  dg-floor="1"  dg-ct="lt01">春季</li>
            <li class="dog d-1-lt02"  dg-floor="1"  dg-ct="lt02">夏季</li>
            <li class="dog d-1-lt03"  dg-floor="1"  dg-ct="lt03">秋季</li>
            <li class="dog d-1-lt04"  dg-floor="1"  dg-ct="lt04">冬季</li>
        </ul>
    </div>
</span>
<div>
 <div class="currency f-1-lt01">
	<ul>
    	<li>
        	
        	<a href="Blessingpackage.html"><img src="${ctxStaticB}/module/homepage/images/56da66aeN557ae881.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
            <light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="Blessingpackage.html"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
			</em>
            
        </li>
        <li>
        	
        	<a href="Blessingpackage.html"><img src="${ctxStaticB}/module/homepage/images/56da66aeN557ae881.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
            <light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="Blessingpackage.html"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	
        	<a href="Blessingpackage.html"><img src="${ctxStaticB}/module/homepage/images/56da66aeN557ae881.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
            <light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="Blessingpackage.html"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
    </ul>
</div>
 <div class="currency f-1-lt02" style="display:none">
	<ul>
    	<li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/574521dcN025c8825.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
        	
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li> 
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/574521dcN025c8825.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
        	
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/574521dcN025c8825.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
        	
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
    </ul>
</div>
 <div class="currency f-1-lt03" style="display:none">
	<ul>
    	<li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/571a4db9Neaf4826c.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/571a4db9Neaf4826c.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/571a4db9Neaf4826c.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/571a4db9Neaf4826c.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/571a4db9Neaf4826c.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
    </ul>
</div>
 <div class="currency f-1-lt04" style="display:none">
	<ul>
    	<li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/578c8bedNd80ce7f6.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/578c8bedNd80ce7f6.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/578c8bedNd80ce7f6.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/578c8bedNd80ce7f6.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/578c8bedNd80ce7f6.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
    </ul>
</div>
</div> --%>


<!--首饰配件-->
<span class="as blessing_package">
	<a href="#" style=" color:#000"><h3 style="float:left">&nbsp;首饰配件<img src="${ctxStaticB}/module/homepage/images/zd.png" style="display:block; float:left; margin-top:5px"></h3></a>
    <div class="detailed_navigation">
    	<ul>
    	<c:forEach var="shoushi" items="${shoushiClass}" varStatus="status">  
    	    <c:choose>
		   <c:when test="${(status.index+1)==1}">  
		      <li class="dog d-1-lt01 yadi"  dg-floor="1"  dg-ct="lt01">${shoushi.FClsName}</li>       
		   </c:when>
		   <c:otherwise>  
		        <li class="dog d-1-lt0${status.index+1}"  dg-floor="1"  dg-ct="lt0${status.index+1}">${shoushi.FClsName}</li>
		   </c:otherwise>
		   </c:choose>
          </c:forEach>   
			  
        	<!-- <li class="dog d-2-lt01 yadi"  dg-floor="2"  dg-ct="lt01">耳饰</li>
            <li class="dog d-2-lt02"  dg-floor="2"  dg-ct="lt02">脚链</li>
            <li class="dog d-2-lt03"  dg-floor="2"  dg-ct="lt03">帽子</li>  -->
        </ul>
    </div>
</span>


<div>

<c:forEach var="shoushi" items="${shoushiClass}" varStatus="status">  
 
 <c:choose>
		   
<c:when test="${(status.index+1)==1}"> 
		   
 <div class="currency f-1-lt0${status.index+1}">
	<ul>
	  <c:forEach var="tbproduct" items="${shoushi.products}" varStatus="status">  
	      <li>
        	<a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><img src="${tbproduct.F_PATH}" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${tbproduct.F_PATH}">
            </light1>
            <span>￥${tbproduct.F_Price}</span>
            <a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><p>${tbproduct.F_ProductName} </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        </c:forEach>  
    </ul>
   </div>
    </c:when>
     <c:otherwise> 
      
     <div class="currency f-1-lt0${status.index+1}" style="display:none">
		<ul>
		  <c:forEach var="tbproduct" items="${shoushi.products}" varStatus="status">  
		      <li>
	        	<a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><img src="${tbproduct.F_PATH}" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
	        	<light1>
	            	<img src="${tbproduct.F_PATH}">
	            </light1>
	            <span>￥${tbproduct.F_Price}</span>
	            <a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><p>${tbproduct.F_ProductName} </p></a>
	           	<em>
	            	<a href="#">收藏</a>
	                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
	            </em>
	        </li>
	        </c:forEach>  
	    </ul>
	   </div>
   
     
     
      </c:otherwise>
	 </c:choose>
</c:forEach> 
 
</div>



<!--兴趣爱好-->  
<span class="as blessing_package">
	<a href="#" style=" color:#000"><h3 style="float:left">&nbsp;兴趣爱好<img src="${ctxStaticB}/module/homepage/images/zd.png" style="display:block; float:left; margin-top:5px"></h3></a>
    <div class="detailed_navigation">
    	<ul>
    	<c:forEach var="xinquaihao" items="${xinquaihaoClass}" varStatus="status">  
    	    <c:choose>
		   <c:when test="${(status.index+1)==1}">  
		      <li class="dog d-2-lt01 yadi"  dg-floor="2"  dg-ct="lt01">${xinquaihao.FClsName}</li>       
		   </c:when>
		   <c:otherwise>  
		        <li class="dog d-2-lt0${status.index+1}"  dg-floor="2"  dg-ct="lt0${status.index+1}">${xinquaihao.FClsName}</li>
		   </c:otherwise>
		   </c:choose>
          </c:forEach>   
			   
        </ul>
    </div>
</span>


<div>

<c:forEach var="xinquaihao" items="${xinquaihaoClass}" varStatus="status">  
 
 <c:choose>
		   
<c:when test="${(status.index+1)==1}"> 
		   
 <div class="currency f-2-lt0${status.index+1}">
	<ul>
	  <c:forEach var="tbproduct" items="${xinquaihao.products}" varStatus="status">  
	      <li>
        	<a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><img src="${tbproduct.F_PATH}" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${tbproduct.F_PATH}">
            </light1>
            <span>￥${tbproduct.F_Price}</span>
            <a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><p>${tbproduct.F_ProductName} </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        </c:forEach>  
    </ul>
   </div>
    </c:when>
     <c:otherwise> 
      
     <div class="currency f-2-lt0${status.index+1}" style="display:none">
		<ul>
		  <c:forEach var="tbproduct" items="${xinquaihao.products}" varStatus="status">  
		      <li>
	        	<a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><img src="${tbproduct.F_PATH}" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
	        	<light1>
	            	<img src="${tbproduct.F_PATH}">
	            </light1>
	            <span>￥${tbproduct.F_Price}</span>
	            <a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><p>${tbproduct.F_ProductName} </p></a>
	           	<em>
	            	<a href="#">收藏</a>
	                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
	            </em>
	        </li>
	        </c:forEach>  
	    </ul>
	   </div>
   
     
     
      </c:otherwise>
	 </c:choose>
</c:forEach> 
 
</div>





<!--精品上衣--> 
<span class="as blessing_package">
	<a href="#" style=" color:#000"><h3 style="float:left">&nbsp;精品上衣<img src="${ctxStaticB}/module/homepage/images/zd.png" style="display:block; float:left; margin-top:5px"></h3></a>
    <div class="detailed_navigation">
    	<ul>
    	<c:forEach var="jinping" items="${jinpingClass}" varStatus="status">  
    	    <c:choose>
		   <c:when test="${(status.index+1)==1}">  
		      <li class="dog d-3-lt01 yadi"  dg-floor="3"  dg-ct="lt01">${jinping.FClsName}</li>       
		   </c:when>
		   <c:otherwise>  
		        <li class="dog d-3-lt0${status.index+1}"  dg-floor="3"  dg-ct="lt0${status.index+1}">${jinping.FClsName}</li>
		   </c:otherwise>
		   </c:choose>
          </c:forEach>   
			  
        	<!-- <li class="dog d-2-lt01 yadi"  dg-floor="2"  dg-ct="lt01">耳饰</li>
            <li class="dog d-2-lt02"  dg-floor="2"  dg-ct="lt02">脚链</li>
            <li class="dog d-2-lt03"  dg-floor="2"  dg-ct="lt03">帽子</li>  -->
        </ul>
    </div>
</span>


<div>

<c:forEach var="jinping" items="${jinpingClass}" varStatus="status">  
 
 <c:choose>
		   
<c:when test="${(status.index+1)==1}"> 
		   
 <div class="currency f-3-lt0${status.index+1}">
	<ul>
	  <c:forEach var="tbproduct" items="${jinping.products}" varStatus="status">  
	      <li>
        	<a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><img src="${tbproduct.F_PATH}" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${tbproduct.F_PATH}">
            </light1>
            <span>￥${tbproduct.F_Price}</span>
            <a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><p>${tbproduct.F_ProductName} </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        </c:forEach>  
    </ul>
   </div>
    </c:when>
     <c:otherwise> 
      
     <div class="currency f-3-lt0${status.index+1}" style="display:none">
		<ul>
		  <c:forEach var="tbproduct" items="${jinping.products}" varStatus="status">  
		      <li>
	        	<a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><img src="${tbproduct.F_PATH}" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
	        	<light1>
	            	<img src="${tbproduct.F_PATH}">
	            </light1>
	            <span>￥${tbproduct.F_Price}</span>
	            <a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><p>${tbproduct.F_ProductName} </p></a>
	           	<em>
	            	<a href="#">收藏</a>
	                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
	            </em>
	        </li>
	        </c:forEach>  
	    </ul>
	   </div>
   
     
     
      </c:otherwise>
	 </c:choose>
</c:forEach> 
 
</div>

 




<span class="as blessing_package">
	<a href="#" style=" color:#000"><h3 style="float:left">&nbsp;潮鞋新尚<img src="${ctxStaticB}/module/homepage/images/zd.png" style="display:block; float:left; margin-top:5px"></h3></a>
    <div class="detailed_navigation">
    	<ul>
    	<c:forEach var="caoxiexinshang" items="${caoxiexinshangClass}" varStatus="status">  
    	    <c:choose>
		   <c:when test="${(status.index+1)==1}">  
		      <li class="dog d-4-lt01 yadi"  dg-floor="4"  dg-ct="lt01">${caoxiexinshang.FClsName}</li>       
		   </c:when>
		   <c:otherwise>  
		        <li class="dog d-4-lt0${status.index+1}"  dg-floor="4"  dg-ct="lt0${status.index+1}">${caoxiexinshang.FClsName}</li>
		   </c:otherwise>
		   </c:choose>
          </c:forEach>   
			   
        </ul>
    </div>
</span>

<div>

<c:forEach var="caoxiexinshang" items="${caoxiexinshangClass}" varStatus="status">  
 
 <c:choose>
		   
<c:when test="${(status.index+1)==1}"> 
		   
 <div class="currency f-4-lt0${status.index+1}">
	<ul>
	  <c:forEach var="tbproduct" items="${caoxiexinshang.products}" varStatus="status">  
	      <li>
        	<a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><img src="${tbproduct.F_PATH}" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${tbproduct.F_PATH}">
            </light1>
            <span>￥${tbproduct.F_Price}</span>
            <a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><p>${tbproduct.F_ProductName} </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        </c:forEach>  
    </ul>
   </div>
    </c:when>
     <c:otherwise> 
      
     <div class="currency f-4-lt0${status.index+1}" style="display:none">
		<ul>
		  <c:forEach var="tbproduct" items="${caoxiexinshang.products}" varStatus="status">  
		      <li>
	        	<a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><img src="${tbproduct.F_PATH}" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
	        	<light1>
	            	<img src="${tbproduct.F_PATH}">
	            </light1>
	            <span>￥${tbproduct.F_Price}</span>
	            <a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><p>${tbproduct.F_ProductName} </p></a>
	           	<em>
	            	<a href="#">收藏</a>
	                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
	            </em>
	        </li>
	        </c:forEach>  
	    </ul>
	   </div>
     
      </c:otherwise>
	 </c:choose>
</c:forEach> 
 
</div>

 
<!--化妆美容--> 
<span class="as blessing_package">
	<a href="#" style=" color:#000"><h3 style="float:left">&nbsp;化妆美容<img src="${ctxStaticB}/module/homepage/images/zd.png" style="display:block; float:left; margin-top:5px"></h3></a>
    <div class="detailed_navigation">
    	<ul>
    	<c:forEach var="huazhuangmeirong" items="${huazhuangmeirongClass}" varStatus="status">  
    	    <c:choose>
		   <c:when test="${(status.index+1)==1}">  
		      <li class="dog d-5-lt01 yadi"  dg-floor="5"  dg-ct="lt01">${huazhuangmeirong.FClsName}</li>       
		   </c:when>
		   <c:otherwise>  
		        <li class="dog d-5-lt0${status.index+1}"  dg-floor="5"  dg-ct="lt0${status.index+1}">${huazhuangmeirong.FClsName}</li>
		   </c:otherwise>
		   </c:choose>
          </c:forEach>   
			   
        </ul>
    </div>
</span>


<div>

<c:forEach var="huazhuangmeirong" items="${huazhuangmeirongClass}" varStatus="status">  
 
 <c:choose>
		   
<c:when test="${(status.index+1)==1}"> 
		   
 <div class="currency f-5-lt0${status.index+1}">
	<ul>
	  <c:forEach var="tbproduct" items="${huazhuangmeirong.products}" varStatus="status">  
	      <li>
        	<a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><img src="${tbproduct.F_PATH}" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${tbproduct.F_PATH}">
            </light1>
            <span>￥${tbproduct.F_Price}</span>
            <a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><p>${tbproduct.F_ProductName} </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        </c:forEach>  
    </ul>
   </div>
    </c:when>
     <c:otherwise> 
      
     <div class="currency f-5-lt0${status.index+1}" style="display:none">
		<ul>
		  <c:forEach var="tbproduct" items="${huazhuangmeirong.products}" varStatus="status">  
		      <li>
	        	<a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><img src="${tbproduct.F_PATH}" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
	        	<light1>
	            	<img src="${tbproduct.F_PATH}">
	            </light1>
	            <span>￥${tbproduct.F_Price}</span>
	            <a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><p>${tbproduct.F_ProductName} </p></a>
	           	<em>
	            	<a href="#">收藏</a>
	                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
	            </em>
	        </li>
	        </c:forEach>  
	    </ul>
	   </div>
     
      </c:otherwise>
	 </c:choose>
</c:forEach> 
 
</div>
 
 
<!--时尚炫酷-->
<span class="as blessing_package">
	<a href="#" style=" color:#000"><h3 style="float:left">&nbsp;时尚炫酷<img src="${ctxStaticB}/module/homepage/images/zd.png" style="display:block; float:left; margin-top:5px"></h3></a>
    <div class="detailed_navigation">
    	<ul>
    	<c:forEach var="shishangxuanku" items="${shishangxuankuClass}" varStatus="status">  
    	    <c:choose>
		   <c:when test="${(status.index+1)==1}">  
		      <li class="dog d-6-lt01 yadi"  dg-floor="6"  dg-ct="lt01">${shishangxuanku.FClsName}</li>       
		   </c:when>
		   <c:otherwise>  
		        <li class="dog d-6-lt0${status.index+1}"  dg-floor="6"  dg-ct="lt0${status.index+1}">${shishangxuanku.FClsName}</li>
		   </c:otherwise>
		   </c:choose>
          </c:forEach>   
			   
        </ul>
    </div>
</span>


<div>

<c:forEach var="shishangxuanku" items="${shishangxuankuClass}" varStatus="status">  
 
 <c:choose>
		   
<c:when test="${(status.index+1)==1}"> 
		   
 <div class="currency f-6-lt0${status.index+1}">
	<ul>
	  <c:forEach var="tbproduct" items="${shishangxuanku.products}" varStatus="status">  
	      <li>
        	<a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><img src="${tbproduct.F_PATH}" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${tbproduct.F_PATH}">
            </light1>
            <span>￥${tbproduct.F_Price}</span>
            <a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><p>${tbproduct.F_ProductName} </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        </c:forEach>  
    </ul>
   </div>
    </c:when>
     <c:otherwise> 
      
     <div class="currency f-6-lt0${status.index+1}" style="display:none">
		<ul>
		  <c:forEach var="tbproduct" items="${shishangxuanku.products}" varStatus="status">  
		      <li>
	        	<a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><img src="${tbproduct.F_PATH}" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
	        	<light1>
	            	<img src="${tbproduct.F_PATH}">
	            </light1>
	            <span>￥${tbproduct.F_Price}</span>
	            <a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tbproduct.F_PARENT_SKU}" target="_blank" title="${tbproduct.F_PRODUCTNAME}"><p>${tbproduct.F_ProductName} </p></a>
	           	<em>
	            	<a href="#">收藏</a>
	                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
	            </em>
	        </li>
	        </c:forEach>  
	    </ul>
	   </div>
     
      </c:otherwise>
	 </c:choose>
</c:forEach> 
 
</div>

  


<!--个性筛选-->
<%-- <span class="as blessing_package">
	<a href="#" style=" color:#000"><h3 style="float:left">&nbsp;个性筛选<img src="images/zd.png" style="display:block; float:left; margin-top:5px"></h3></a>
    <div class="detailed_navigation">
    	<ul>
        	<li class="dog d-5-lt01 yadi"  dg-floor="5"  dg-ct="lt01">一人空间</li>
       
            <li class="dog d-5-lt02"  dg-floor="5"  dg-ct="lt02">二人世界</li>
            <li class="dog d-5-lt03"  dg-floor="5"  dg-ct="lt03">三口之家</li>
            <li class="dog d-5-lt04"  dg-floor="5"  dg-ct="lt04">四人之家</li>
            <li class="dog d-5-lt04"  dg-floor="5"  dg-ct="lt05">五口大家</li>
        </ul>
    </div>
</span>
<div>
 <div class="currency f-5-lt01">
	<ul>
    	<li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/578f96e3Ne953ac32.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/578f96e3Ne953ac32.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/578f96e3Ne953ac32.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/578f96e3Ne953ac32.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/578f96e3Ne953ac32.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
    </ul>
</div>
 <div class="currency f-5-lt02" style="display:none">
	<ul>
    	<li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/rBEhU1Kvv8gIAAAAAAcDR5hr6hkAAG4SwPB6yAABwNf577.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/rBEhU1Kvv8gIAAAAAAcDR5hr6hkAAG4SwPB6yAABwNf577.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/rBEhU1Kvv8gIAAAAAAcDR5hr6hkAAG4SwPB6yAABwNf577.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/rBEhU1Kvv8gIAAAAAAcDR5hr6hkAAG4SwPB6yAABwNf577.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/rBEhU1Kvv8gIAAAAAAcDR5hr6hkAAG4SwPB6yAABwNf577.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
    </ul>
</div>
 <div class="currency f-5-lt03" style="display:none">
	<ul>
    	<li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/5688f53dN144e3333.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/5688f53dN144e3333.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/5688f53dN144e3333.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/5688f53dN144e3333.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/5688f53dN144e3333.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
    </ul>
</div>
 <div class="currency f-5-lt04" style="display:none">
	<ul>
    	<li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/56e3bdf0N6b0aa4a7.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/56e3bdf0N6b0aa4a7.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/56e3bdf0N6b0aa4a7.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/56e3bdf0N6b0aa4a7.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/56e3bdf0N6b0aa4a7.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
    </ul>
</div>
 <div class="currency f-5-lt05" style="display:none">
	<ul>
    	<li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/577f624eN2e3465e5.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/577f624eN2e3465e5.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/577f624eN2e3465e5.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/577f624eN2e3465e5.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
        <li>
        	<a href="#"><img src="${ctxStaticB}/module/homepage/images/577f624eN2e3465e5.jpg" style=" margin:0 auto; display:block; width:220px; height:220px"></a>
        	<light1>
            	<img src="${ctxStaticB}/module/homepage/images/saoguang.png">
            </light1>
            <span>￥59</span>
            <a href="#"><p>罗技 G402 有线光电发光游戏鼠标宏笔记本电脑电竞CF专用LOL </p></a>
           	<em>
            	<a href="#">收藏</a>
                <a href="javascript:void(0)" class="add_scar">加入购物车</a>
            </em>
        </li>
    </ul>
</div>
</div>  --%>








<!--新品上市-->
<div class="as kongzhianniu">
<div class="lunbobanner">
	<ul class="lunboimg"> 
	    	  <c:forEach var="tproduct" items="${tproducts}" varStatus="status"> 
				 <c:if test="${(status.index+1)%5==1}"> 
				    <li> 
				 </c:if>	 
			    <a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tproduct.F_PARENT_SKU}" target="_blank">
	            	<b><img src="${tproduct.F_PATH}" style=" margin:0 auto; display:block; width:220px; height:220px"></b>
	                <span>${tproduct.F_PRICE}RMB</span>
	                <p>${tproduct.F_PRODUCTNAME} </p>
	            </a>   
	              
	               <c:if test="${(status.index+1)%5==0}">  
	                 </li>
	              </c:if>
	              
			  </c:forEach>  
		 	       	
    </ul>
</div>    
	<div class="btnl"><</div>
    <div class="btnr">></div>
    <h4 class="guanfangremai">新品上市</h4>
</div>





<!--产品特卖-->
<div class="as kongzhianniu2">
<div class="lunbobanner2">
	<ul class="lunboimg2"> 
	    	  <c:forEach var="tproductSpecial" items="${tproductSpecials}" varStatus="status"> 
				 <c:if test="${(status.index+1)%5==1}"> 
				    <li> 
				 </c:if>	
				 
			    <a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tproductSpecial.FParentSku}"  target="_blank">
	            	<b><img src="${tproductSpecial.FPath}" style=" margin:0 auto; display:block; width:220px; height:220px"></b>
	                <span>${tproductSpecial.FPrice}RMB</span>
	                <p>${tproductSpecial.FProductName} </p>
	            </a>   
	              
	               <c:if test="${(status.index+1)%5==0}">  
	                 </li>
	              </c:if>
	              
			  </c:forEach>  
		 	       	
    </ul>
</div>    
	<div class="btnl2"><</div>
    <div class="btnr2">></div>
    <h4 class="guanfangremai2">产品特卖</h4>
</div>















<!--猜你喜欢-->
<div class="as kongzhianniu1">
<div class="lunbobanner1">
	<ul class="lunboimg1">
	
	         <c:forEach var="tproductHot" items="${tproductHots}" varStatus="status"> 
				 <c:if test="${(status.index+1)%5==1}"> 
				    <li>
				 </c:if>	
				 
			    <a href="${ctx}/tbProductController/toSingleProduct.do?f_parentSku=${tproductHot.FParentSku}"  target="_blank">
	            	<b><img src="${tproductHot.FPath}" style=" margin:0 auto; display:block; width:220px; height:220px"></b>
	                <span>${tproductHot.FPrice}RMB</span>
	                <p>${tproductHot.FProductName} </p>
	            </a>   
	              
	               <c:if test="${(status.index+1)%5==0}">  
	                 </li>
	              </c:if>
	              
			  </c:forEach>   
    </ul>
</div>    
	<div class="btnl1"><</div>
    <div class="btnr1">></div>
    <h4 class="guanfangremai1">推荐商品</h4>
</div>












<!--页脚-->
<footer>
	<section class="foot_in">
    	<!--left-->
        <div class="foot_in_left">
        	<div>
            	<h5>新手上路</h5>
                <ul>
                	<li><a href="${ctx}/homePageCtrl/help/toXsbz.do" target="_blank">新手帮助</a></li> 
                	
                	<li><a href="${ctx}/homePageCtrl/help/toCjwt.do" target="_blank">常见问题</a></li>  
                	
                </ul>
            </div>
            <div>
            	<h5>购物指南</h5>
                <ul>
                	<li><a href="${ctx}/homePageCtrl/help/toGwlc.do" target="_blank">购物流程</a></li>  
                	 
                </ul>
            </div>
            <div>
            	<h5>支付方式</h5>
                <ul>
                	<li><a href="${ctx}/homePageCtrl/help/toZfbzf.do" target="_blank">支付宝支付</a></li> 
                </ul>
            </div>
            <div>
            	<h5>配送方式</h5>
                <ul>
                	<li><a href="${ctx}/homePageCtrl/help/toKdsh.do" target="_blank">快递送货</a></li> 
                </ul>
            </div>
            <div>
            	<h5>注册协议</h5>
                <ul>
                	<li><a href="${ctx}/homePageCtrl/help/toZcxy.do" target="_blank">注册协议</a></li> 
               
                    <li><a  href="${ctx}/homePageCtrl/help/toGywm.do" target="_blank">关于我们</a></li> 
               
                </ul>
            </div>
             
            
            <div>
            	<h5>关注我</h5>
                <img src="${ctxStaticB}/images/logo/weixingongzhong.jpg" width="153" height="153" style="display:block">
            </div>
        </div>
        <!--right-->
        <div class="foot_in_right">
        	<div>
            	<h5>联系我们</h5>
                <p><img src="${ctxStaticB}/module/homepage/images/dian.png" width="40" height="40" style=" float:left"><em style=" float:left; line-height:40px; color:#eb4e01; font-size:20px">&nbsp;&nbsp;&nbsp;150-2127-4597</em></p>
                <p><img src="${ctxStaticB}/module/homepage/images/wx.png" width="40" height="40" style=" float:left"><em style=" float:left; line-height:40px; color:#eb4e01; font-size:20px">&nbsp;&nbsp;&nbsp;<a href="#" style="color:#eb4e01">在线客服</a></em></p>
            </div>
        </div>
    </section>
</footer>

<div class="foots">
	<div class="foots_in"> 
        <em>©2000-2016  啾唧在线电子商务有限公司   版权所有 皖ICP备16007801号</em>
    </div>
</div>
 



<!--侧边栏-->
<div class="toolbar">
   <a href="###" class="toolbar-item toolbar-item-weixin" style=" position:relative">
   <em style=" position:absolute; display:block; line-height:20px; font-size:12px; color:#f00; top:-20px; left:0">(0)</em>
   <!--<span class="toolbar-layer"></span>-->
   </a>
   <a href="###" class="toolbar-item toolbar-item-feedback"></a>
   <a href="###" class="toolbar-item toolbar-item-app">
       <span class="toolbar-layer"></span>
   </a>
   <a href="javascript:scroll(0,0)" id="top" class="toolbar-item toolbar-item-top"></a>
</div>
<!--购物车fly插件-->
</body>
</html>
		       