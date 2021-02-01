<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>MHR 图书管理系统 登入</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/static/css/login.css" rel="stylesheet">
</head>

<body class="text-center">

<form class="form-signin" action="login" method="post">

    <img class="mb-3 rounded-circle shadow " src="${pageContext.request.contextPath}/static/images/login_logo.jpg " alt="Logo" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">账号登录</h1>
    <label for="uname" class="sr-only">邮箱</label>
    <input type="text" id="uname" name="uname" class="form-control" placeholder="邮箱|用户名|手机号" required autofocus>
    <label for="inputPassword" class="sr-only">密码</label>
    <input type="password" id="inputPassword" name="pwd" class="form-control" placeholder="密码" required>
    <div class="checkbox mb-3">
        <label class="mr-3">
            <input type="checkbox" value="remember-me" name="remember-me"> 一周之内免密登录
            <a href="#" class="text-muted ml-2">忘记了</a>
            <span style="color: red">${msg}</span>
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">登 入</button>
</form>

<footer class="mb-3 text-muted fixed-bottom">&copy; 2017-2020</footer>

<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
</body>
</html>
