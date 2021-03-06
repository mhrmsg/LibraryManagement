<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>个人界面</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet">

    <style>
        main{
            width: 100%;
            height: 100%;
        }
        footer{
            width: 100%;
        }
    </style>
</head>
<body>

<header id="header"></header>



<main class="d-flex">
    <div class="container mt-5 border border-light-50 shadow-lg text-center">
        <div class="p-2 text-center">

            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text">学院反馈</span>
                </div>
                <textarea class="form-control" aria-label="学院反馈"></textarea>
            </div>

            <div class="input-group mt-2">
                <div class="input-group-prepend">
                    <span class="input-group-text">管理员反馈</span>
                </div>
                <textarea class="form-control" aria-label="学院反馈"></textarea>
            </div>

            <div class="input-group mt-2">
                <div class="input-group-prepend">
                    <span class="input-group-text">图书反馈</span>
                </div>
                <textarea class="form-control" aria-label="学院反馈"></textarea>
            </div>
            <button class="btn btn-danger mt-2" type="submit">提交</button>
            <div class="jumbotron mt-2">
                <h1 class="display-3 text-danger">重要!</h1>
                <p class="lead">匿名提交邮箱: XXXXXX@XXX.com</p>
                <hr class="my-4">
                <p>如发现违规行为请反馈给我们，我们一定会严加处理.</p>
                <p class="lead">
                    <a class="btn btn-primary btn-lg" href="#" role="button">About More</a>
                </p>
            </div>

        </div>
    </div>
</main>

<footer class="text-center mt-2">
    ©2020 By MHR
</footer>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
<script>
  $("#header").load("${pageContext.request.contextPath}/public/header.jsp");

</script>
</body>
</html>