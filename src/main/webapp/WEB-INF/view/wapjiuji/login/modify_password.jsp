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
        <h1 class="header-title ">修改密码</h1>
    </header>
    <div id="wrapper" class="content">
        <div class="content-padded">
            <div class="login-panel">
                <div class="input-row">
                    <i class="lock-icon"></i>
                    <input type="password" placeholder="输入原密码" class="input-clear login-password"/>
                    <i class="eye-hidden-icon" ></i>
                </div>
                <div class="input-row">
                    <i class="lock-icon"></i>
                    <input type="password" placeholder="输入新密码" class="input-clear new-password"/>
                    <i class="eye-hidden-icon" ></i>
                </div>
                <div class="input-row">
                    <i class="lock-icon"></i>
                    <input type="password" placeholder="确认密码" class="input-clear new-password"/>
                    <i class="eye-hidden-icon" ></i>
                </div>
            </div>
            <button class="primary-btn submit-btn">提交</button>
        </div>
    </div>
    <script src="${ctxStaticB}/wapjiuji/public/js/jquery.js"></script>
    <script src="${ctxStaticB}/wapjiuji/public/js/jump.js"></script>
    
</body>
</html>