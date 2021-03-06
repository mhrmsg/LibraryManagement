<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>自习室资讯</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet">

</head>
<body>

<header id="header"></header>
<main class="container ">
        <ul class="row">
            <li class="list-group-item d-flex justify-content-between align-items-center col-md-3 mt-5">
                Cras justo odio
                <span class="badge badge-primary badge-pill">14</span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center col-md-3 offset-1 mt-5">
                Dapibus ac facilisis in
                <span class="badge badge-primary badge-pill">2</span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center col-md-3 offset-1 mt-5">
                Morbi leo risus
                <span class="badge badge-primary badge-pill">1</span>
            </li>
        </ul>

    <div class="row text-center  ">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">一楼</th>
                <th scope="col"><span>第一列</span> <span class="badge badge-danger">New !</span></th>
                <th scope="col"><span>第一列</span> <span class="badge badge-danger">New !</span></th>
                <th scope="col"><span>第一列</span> <span class="badge badge-danger">New !</span></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">第一行</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
            </tr>
            <tr>
                <th scope="row">第二行</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
            </tr>
            <tr>
                <th scope="row">第一行</th>
                <td >Larry the Bird</td>
                <td >Larry the Bird</td>
                <td>@twitter</td>
            </tr>
            </tbody>
        </table>
    </div>

        <hr >


    <div class="row text-center ">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">二楼</th>
                <th scope="col"><span>第一列</span> <span class="badge badge-danger">New !</span></th>
                <th scope="col"><span>第一列</span> <span class="badge badge-danger">New !</span></th>
                <th scope="col"><span>第一列</span> <span class="badge badge-danger">New !</span></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">第一行</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
            </tr>
            <tr>
                <th scope="row">第二行</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
            </tr>
            <tr>
                <th scope="row">第一行</th>
                <td >Larry the Bird</td>
                <td >Larry the Bird</td>
                <td>@twitter</td>
            </tr>
            </tbody>
        </table>
    </div>
</main>

<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
<script>
  $("#header").load("${pageContext.request.contextPath}/public/header.jsp");
</script>
</body>
</html>