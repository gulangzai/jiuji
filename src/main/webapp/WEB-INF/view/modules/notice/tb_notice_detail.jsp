<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/view/commons/taglib.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" /> 
<meta name="description" content="啾唧网 方便快捷，物美价廉，更快送达，诚信服务" />
<meta name="keywords" content="啾唧帮助" />
<title>啾唧-新手帮助</title>  

<link rel="stylesheet" href="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/css/bootstrap.css" type="text/css" /> 
<link rel="shortcut icon" href="${ctxStaticB}/images/logo.ico" type="image/x-icon" /> 
<link rel="stylesheet" href="${ctxStaticB}/module/head/css/head.css" type="text/css" />
<link rel="stylesheet" href="${ctxStaticB}/module/homepage/css/base.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctxStaticB}/module/main/css/main.css"/> 
<link rel="stylesheet" href="${ctxStatic}/plugin/jqueryui/jquery-ui-1.12.1.custom/jquery-ui.css">  

<script src="${ctxStatic}/plugin/jquery/jquery-1.11.3/jquery-1.11.3.min.js"></script>
<script src="${ctxStatic}/plugin/bootstrap/bootstrap-3.3.0/js/bootstrap.js"></script>
<script src="${ctxStatic}/plugin/jqueryui/jquery-ui-1.12.1.custom/jquery-ui.js"></script>


</head>


 <%
String rootFile = request.getScheme()+"://"+request.getServerName()+":8088/file";
String rootFileApp = request.getScheme()+"://"+request.getServerName()+":8088/app"; 
String F_NOTICE_UID = request.getParameter("F_NOTICE_UID");
%>


<jsp:include page="/WEB-INF/view/modules/homemain/headerThree.jsp"/>
 
<div class="container">

	<div class="row">
			
			
  <jsp:include page="/WEB-INF/view/modules/notice/left.jsp"/>
			


			<div class="col-xs-9">
				<!-- 导航写 -->
				<div class="row">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="${ctx}">首页</a></li>
 
							<li><a href="${ctx}/homePageCtrl/help/toIndex.do">公告中心</a></li>
							<li class="active">查看公告</li>

						</ol>
					</div>
				</div>

				 
				 
			  <div class="row">
				<div class="col-xs-12">
				 
				 	      <form class="form-horizontal" action="${ctx}/tbnotice/tbNoticeController/edit.do" role="form" name="Form" id="detailForm" method="post">
				           	 <input type="hidden" name="F_NOTICE_UID" id="F_NOTICE_UID" value="<%=F_NOTICE_UID%>"/>
				           	 
				           	 <div class="form-group">
										<label class="col-sm-2 control-label">公告主题:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="F_NOTICE_TITLE"
												name="F_NOTICE_TITLE" value="${pd.F_NOTICE_TITLE}"
												placeholder="请填写公告主题" title="用户账号">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">公告内容:</label>
										<div class="col-sm-10">
											<textarea  rows="4" class="form-control" id="F_NOTICE_CONTENT"
												name="F_NOTICE_CONTENT" value="${pd.F_NOTICE_CONTENT}"
												placeholder="请填写公告内容" title="商品id">
										             </textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">公告类型:</label>
										<div class="col-sm-2">
											<select class="form-control" id="F_NOTICE_TYPE" name="F_NOTICE_TYPE">
											    <option value="PTGG">平台公告</option>
											    <option value="HYGG">会员公告</option>
												<option value="XTXX">系统消息</option>
												<option value="DDTZ">订单通知</option>
												<option value="QTTZ">其他通知</option>
											</select>
										</div>
									</div>
				
									<div class="form-group">
										<label class="col-sm-2 control-label">公告等级:</label>
										<div class="col-sm-2">
											<select class="form-control" id="F_NOTICE_LEVEL" name="F_NOTICE_LEVEL">
												<option value="1">重要</option>
												<option value="0">一般</option>
											</select>
										</div>
									</div>
				 
				 
						      
				        </form>
				     
                </div>
			</div>
				
				
		 </div>

	 </div>
</div>
	
 
 <jsp:include page="/WEB-INF/view/modules/homemain/footer.jsp"/> 
<script type="text/javascript" src="${ctx}/ckeditor4.7/ckeditor.js"></script> 
<script type="text/javascript" src="${ctx}/ckfinder2.6.2/ckfinder.js"></script>
<script type="text/javascript" src="${ctxStaticB}/module/tbnotice/js/tbnotice_detail.js"> </script>
</html>