<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%> 

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
			     <a href="${ctx}/logout" target="_self">登出</a> 
			</c:otherwise>
			</c:choose> 
			<%-- <a href="?language=zh_CN">中文</a> | <a href="?language=en_US">英文</a><br/>
			 ${welcome} --%>
       </div>
       <div class="vip_center">
       	<a href="${ctx}/homePageCtrl/toInformation.do">会员中心</a>
           <%-- <a rel="erweima" href="<%=appSystem%>/H54B3F430_0802221451.apk">手机下载</a> --%>
       </div>
   </section> 