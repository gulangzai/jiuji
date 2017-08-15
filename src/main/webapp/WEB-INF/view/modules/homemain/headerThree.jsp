<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" />
<link rel="stylesheet" href="${ctxStaticB}/css/head.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/css/homepage/base.css" type="text/css" />

<jsp:include page="/WEB-INF/view/modules/homemain/headerSecond.jsp"/>

 
 
 <div style="width:100%;margin:0px auto">
	<div class="container" style="background:white">
		  <div class="row"> 
		  
		              <div class="col-xs-12 col-sm-12 col-md-1">
		                <a href="${ctx}/homePageCtrl/toHomePage.do"><img src="${ctxStaticB}/images/homepage/logo2.png" width="145" alt="" /></a>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-11">
		                       <div class="search-form" style="margin:10px auto">
									<div id="search-bd" class="search-bd">
										<ul>
											<li class="selected">找商品</li>
											<!-- <li>找商家</li> -->
										</ul>
									</div>
									<div id="search-hd" class="search-hd" style="height: 40px">
										<div class="search-bg" style="height: 32px;margin-left: 2px;">
										<input type="text" id="autocomplete" class="search-input" style="height: 34px;"   placeholder="生鲜水果半价抢疯"/>  
									     </div>
										<button id="submit" class="btn-search" value="搜索">搜索</button>
									</div> 
									 <div id="selction-ajax"></div> 
								</div> 
						</div> 
		    </div> 
    </div>
</div>
	 
