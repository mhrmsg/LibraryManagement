<%--
  Created by IntelliJ IDEA.
  User: 90815
  Date: 2021/1/23
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书详情</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet">
</head>
<body>
<header id="header"></header>

<main class="d-flex">
<%--图书详情--%>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 ">
                <div id="img">
                    <img class="card-img-top w-25 m-auto" src="${pageContext.request.contextPath}/static/images/book2.jpg"
                         alt="Card image cap"></a>
                </div>
            </div>
            <div class="col-md-8">

            </div>
        </div>
    </div>
</main>

<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
<script>
    $("#header").load("${pageContext.request.contextPath}/public/header.jsp")
</script>
</body>
</html>
