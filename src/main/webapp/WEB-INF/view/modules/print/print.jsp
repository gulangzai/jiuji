<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%>

<html>
<script src='http://172.21.20.107:8000/CLodopfuncs.js'></script>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>打印</title>
</head>

<script>
  
   function demoPrint(toPrview){ 
       var strHTML=document.getElementsByTagName("html")[0].innerHTML;
       LODOP.PRINT_INITA(10,20,810,610,"测试C-Lodop远程打印四步骤");  
       LODOP.ADD_PRINT_TEXT(1,1,300,200,"下面输出的是本页源代码及其展现效果：");
       LODOP.ADD_PRINT_TEXT(20,10,"90%","95%",strHTML);
       LODOP.SET_PRINT_STYLEA(0,"ItemType",4);
       LODOP.NewPageA();
       LODOP.ADD_PRINT_HTM(20,10,"90%","95%",strHTML);
       if (toPrview)
           LODOP.PREVIEW();
       else
           LODOP.PRINT();
   };

</script>

<body>
 <div id="itopform" >
     <form>
       <h1>欢迎使用C-Lodop打印服务系统
	   <span class="small">The Cloud Web Service System for Lodop HTML Print</span>
	</h1><hr>
    </form>
 </div> 
  <a href="javascript:demoPrint(true);">打印预览</a>  
 
 <textarea rows="7" id="text01" cols="100">
  var strHTML=document.getElementsByTagName("html")[0].innerHTML;
  LODOP.PRINT_INITA(1,1,770,660,"测试预览功能");
  LODOP.ADD_PRINT_TEXT(10,60,300,200,"这是测试的纯文本，下面是超文本:");
  LODOP.ADD_PRINT_HTM(30,5,"100%","80%",strHTML);
  LODOP.PREVIEW();
</textarea><br><br>

</body>


</html>