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

<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>

<main class="container-fluid no-gutters">
    <div class="row">
<!--左侧栏开始-->
        <div class="col-md-3 text-center " >
            <div class="card mt-5 ml-4 p-2 bg-white shadow-sm myCard" style="width: 18rem;" >
                <div class="align-self-center">
                    <img src="${pageContext.request.contextPath}/static/images/login_logo.jpg" class="rounded-circle shadow mt-2 myImage" alt="我" width="72"
                         height="72">
                </div>
                <div class="card-body">
                    <h5 class="card-title">User</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>

            <div class="card mt-5 ml-4 p-2 bg-white shadow-sm myCard" style="width: 18rem;" >
                <div class="card-body">
                    <ul class="list-group">
                        <li class="list-group-item border-0" >借出与归还</li>
                        <li class="list-group-item list-group-item-action" >借出与归还 <a href="#" class="badge badge-danger">逾期</a></li>
                        <li class="list-group-item list-group-item-action" >借出与归还</li>
                        <li class="list-group-item list-group-item-action" >借出与归还</li>
                    </ul>
                </div>
            </div>

            <div class="card mt-5 ml-4 p-2 bg-white shadow-sm myCard" style="width: 18rem;" >
                <div class="card-body">
                    <h5 class="card-title">Message <span class="badge badge-dark">9</span> <span class="sr-only">unread messages</span></h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        ard's content.
                    </p>

                </div>
            </div>
        </div>
<!-- 左侧栏结束-->
<!-- 右侧栏开始-->
        <div class="col-md-6">
<!--历史卡片-->
            <div class="card mt-5 p-2 bg-white shadow-sm myCard  " >
                <div class="row no-gutters p-2  border-bottom">
                    <div class="col-md-3 ">
                      <a href="#" class="text-dark">  <img src="${pageContext.request.contextPath}/static/images/book.jfif" class="card-img img-fluid w-50 offset-1 mt-2 " alt="..." ></a>
                    </div>
                    <div class="col-md-9">
                        <div class="card-body">
                            <h5 class="card-title"><a href="#" class="text-dark">Card title</a></h5>
                            <p class="card-text"><a href="#" class="text-dark">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</a></p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>

                <div class="row no-gutters p-2">
                    <div class="col-md-3">
                        <img src="${pageContext.request.contextPath}/static/images/book.jfif" class="card-img img-fluid w-50 offset-1 mt-2 " alt="..." >
                    </div>
                    <div class="col-md-9">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
            </div>
<!--历史卡片结束 -->
        </div>
<!--留言-->
        <div class="col-md-2">

            <div class="card mt-5 p-2 bg-white shadow-sm myCard  " >
                <div class="row no-gutters   ">
                    <div class="col-md-9">
                        <div class="card-body">
                            <h5 class="card-title"><a href="#" class="text-dark">Card title</a></h5>
                            <p class="card-text"><a href="#" class="text-dark">你的评论</a></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mt-5  bg-white shadow-sm myCard  text-center" >
                <div class="row no-gutters">
                        <div class="card-body">
                            <form action="">

                            <h5 class="card-title">留言标题<input type="text" class="form-control" aria-label="留言"></h5>
                            <p class="card-text">内容<textarea class="form-control" aria-label="comment"></textarea>
                            </p>
                                <button type="submit" class="btn btn-primary">提交</button>
                            </form>
                        </div>
                </div>
            </div>

        </div>
<!--右侧栏结束-->
    </div>
</main>

<footer class="text-center mt-2">
    ©2020 By MHR
</footer>

<script>
  $("#header").load("${pageContext.request.contextPath}/public/header.jsp");
  //添加个人卡片样式
  $(".myCard").hover(function () {
    $(this).addClass("shadow")
  },function () {
    $(this).removeClass("shadow")
  });
</script>
</body>
</html>