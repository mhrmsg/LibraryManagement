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
    <style>
        .col-md-3 .btn {
            -webkit-border-radius: 20px;
            -moz-border-radius: 20px;
            border-radius: 20px;
        }
    </style>
</head>

<body>
<header id="header"></header>

<main class="d-flex">
    <%--图书详情--%>
    <div class="container-fluid mt-5">
        <%--图书界面--%>
        <div class="row">
<%--图书信息--%>
            <div class="col-md-6 offset-2">
                <div class="row no-gutters p-2">
                    <div class="col-md-4">
                        <div id="img" class="" style="width: 15em;height: 20em;">
                            <img class="card-img-top h-100 w-100"
                                 src="${pageContext.request.contextPath}/static/images/book.jfif">
                        </div>
                    </div>
                    <div class="col-md-4 text-center ">
                        <div class="row no-gutters ">
                            <div><h2 class="d-block"><a href="#" class="text-dark">b_name</a></h2></div>
                        </div>
                        <div class="row no-gutters">
                            <div class="">
                                <div class="" style="font-size: 20px"><a href="#"
                                                                         class="text-dark mt-1">b_author</a><span>著</span>
                                </div>
                            </div>
                        </div>
                        <div class="row no-gutters">
                            <span style="font-size: 18px;">出版社: <a href="#" class="text-dark">b_publish</a></span>
                        </div>
                        <div class="row no-gutters">
                            <span style="font-size: 18px;">语言: <a href="#" class="text-dark">b_language</a></span>
                        </div>
                        <div class="row no-gutters">
                            <span style="font-size: 18px;">价格: <a href="#" class="text-dark">b_price</a></span>
                        </div>
                        <div class="row no-gutters">
                            <span style="font-size: 18px;">出版日期: <a href="#" class="text-dark">b_pdate</a></span>
                        </div>
                        <div class="row no-gutters">
                            <span style="font-size: 18px;">剩余数量: <a href="#" class="text-dark">b_num</a></span>
                        </div>
                        <div class="row no-gutters">
                            <span style="font-size: 18px;">类型: <a href="#" class="text-dark">c_id</a></span>
                        </div>
                    </div>
                </div>
                <div class="container-fluid mt-4">
                    <div class="row">
                        <div class="col-md-3">
                            用户标签:
                            <button type="button" class="btn btn-outline-dark">Dark</button>
                        </div>
                    </div>
                    <div class="row border-bottom border-dark mt-2">
                        <div class="col-md-3">
                        <h4>作品简介</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div id="content" >
                            <div style="font-size: 18px">
                                info
                            </div>
                        </div>
                    </div>
                </div>

<%--用户评价--%>
                <div class="row mt-5">
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">List group item heading</h5>
                                <small>3 days ago</small>
                            </div>
                            <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                            <small>Donec id elit non mi porta.</small>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">List group item heading</h5>
                                <small class="text-muted">3 days ago</small>
                            </div>
                            <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                            <small class="text-muted">Donec id elit non mi porta.</small>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">List group item heading</h5>
                                <small class="text-muted">3 days ago</small>
                            </div>
                            <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                            <small class="text-muted">Donec id elit non mi porta.</small>
                        </a>

                        <div href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                            <div class="d-flex w-100 justify-content-between">
                                <input type="text" class="form-control">
                            </div>
                            <button class=" btn btn-dark">submit</button>
                        </div>
                    </div>
                </div>
                <%--用户评价结束--%>
            </div>
            <div class="col-md-4">
                <div class="w-50">
                    <ul class="list-group  text-center">
                        <li class="list-group-item border-0" >借出与归还</li>
                        <li class="list-group-item list-group-item-action" >借出与归还 <a href="#" class="badge badge-info">在借</a></li>
                        <li class="list-group-item list-group-item-action" >借出与归还</li>
                        <li class="list-group-item list-group-item-action" >借出与归还</li>
                    </ul>
                </div>
            </div>
        </div>


    </div>
</main>

<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
<script>
    $("#header").load("${pageContext.request.contextPath}/public/header.jsp");
    $("#img").hover(function () {
        $(this).addClass("shadow-lg");
    }, function () {
        $(this).removeClass("shadow-lg");
    });

</script>
</body>
</html>
