<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/view/commons/taglib.jsp" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title></title>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/neat.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/public/css/my_common.css"/>
    <link rel="stylesheet" href="${ctxStaticB}/wapjiuji/login/css/login.css"/>
</head>
<body>
    <header>
        <i class="return-btn"></i>
        <h1 class="header-title ">找回密码</h1>
    </header>
    <div id="wrapper" class="content">
        <div class="content-padded">
            <div class="login-panel">
                <div class="input-row">
                    <i class="person-icon"></i>
                    <input type="text" placeholder="输入手机号码" class="input-clear user-account"/>
                </div>
                <div class="input-row">
                    <i class="code-icon"></i>
                    <input type="text" placeholder="输入验证码" class="input-clear verification-code"/>
                    <input type="button" class="get-code" id="get-code-btn" value="获取验证码" />
                </div>
                <div class="input-row">
                    <i class="lock-icon"></i>
                    <input type="password" placeholder="重置密码" class="input-clear reset-password"/>
                    <i class="eye-hidden-icon"></i>
                </div>
            </div>
            <button class="primary-btn submit-btn">提交</button>
        </div>
    </div>
    <script src="${ctxStaticB}/wapjiuji/public/js/jquery.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/jump.js"></script>
    <script src="${ctxStaticB}/wapjiuji/login/js/login_about.js"></script>
</body>
</html>