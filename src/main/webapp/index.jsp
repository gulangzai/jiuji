<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %> 
<html>
<body> 
</body> 
<script type="text/javascript">
	
	//window.location="${ctx}/homePageCtrl/page/wapjiuji/index.do";
	
	function redirectPage() {

	    var url_else = "http://www.163.com/"; 
		var url="${ctx}/homePageCtrl/toWapHomePage.do";
		var winWidth = window.innerWidth; 
		var winHeight = window.innerHeight; 
		//alert(winHeight+"--"+winWidth);
		//if ((winWidth < 800) && (winHeight < 600)){}
		if(!IsPC()){
			window.location.href = url;  
		} else{
			window.location="${ctx}/homePageCtrl/toHomePage.do";
		}	
    }

	function IsPC()  
	{  
	           var userAgentInfo = navigator.userAgent;  
	           var Agents = new Array("Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod");  
	           var flag = true;  
	           for (var v = 0; v < Agents.length; v++) {  
	               if (userAgentInfo.indexOf(Agents[v]) > 0) { flag = false; break; }  
	           }  
	           return flag;  
	}

    redirectPage();

</script>
</html>
