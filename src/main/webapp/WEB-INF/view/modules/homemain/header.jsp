<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" />
<link rel="stylesheet" href="${ctxStaticB}/module/head/css/head.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/module/homepage/css/base.css" type="text/css" /> 

<jsp:include page="/WEB-INF/view/modules/homemain/headerThree.jsp"/> 

<style>
   a {
    color: #666;
    text-decoration: none;
   }
   
   .cate_detail_con_lk {
    float: left;
    margin: 4px 0;
    padding: 0 10px;
    height: 16px;
    border-left: 1px solid #e0e0e0;
    line-height: 16px;
    white-space: nowrap;
  }
  
  .cate_detail_con {
    overflow: hidden;
    padding: 6px 0;
    border-top: 1px solid #eee;
   }


</style>

<div style="width:100%;margin:0px auto">	
    <div class="container">  
	<div class="row">    
        	<div class="headNav"> 
			<div class="navCon w1080"> 
				<div class="navCon-cate fl navCon_on"> 
					<div class="navCon-cate-title">
						<a href="#">全部商品分类</a>
					</div> 
					<div class="cateMenu show"> 
						<ul> 
						<c:forEach var="tClass" items="${tclasses}">
					        <li style="border-top: none;"> 
								<div class="cate-tag">
									<strong><a href="">${tClass.F_ClsName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt;</a></strong>
								</div> 
								<div class="list-item hide"> 
									<ul class="itemleft"> 
										<dl>  
											<dd class="cate_detail_con">
											        <c:forEach var="sonTClass" items="${tClass.sonTClasses}">
													    <a class="cate_detail_con_lk" href="${ctx}/productCtrl/toProjectListPage.do?f_clsId=${sonTClass.F_ClsId}">${sonTClass.F_ClsName}</a>  
													</c:forEach>
											</dd> 
										</dl>  
									</ul>  
								</div> 
							</li>
					    </c:forEach>   
						</ul> 
					</div> 
				</div>

				<div class="navCon-menu fl"> 
					<ul> 
						<li><a class="curMenu" href="${ctx}/homePageCtrl/toHomePage.do">首页</a></li>
                       <!--  <li><a href="javascript:alert('功能暂未开放')">团购场</a></li> 
						<li><a href="javascript:alert('功能暂未开放')">自营超市</a></li> 
						<li><a href="javascript:alert('功能暂未开放')">名家鉴赏</a></li> 
						<li><a href="javascript:alert('功能暂未开放')">闪购</a></li> 
						<li><a href="javascript:alert('功能暂未开放')">VIP专场</a></li>  -->
					</ul>  
			</div>  
		</div>
     </div>  
	</div>
</div>
</div>