<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>旧书管理</title>

    <!-- Bootstrap core CSS -->
    <link href="../../static/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../static/css/main.css" rel="stylesheet">
    <style>
        main{
            height: 100%;
            width: 100%;
        }
        td .btn{
            -webkit-border-radius: 20px;
            -moz-border-radius: 20px;
            border-radius: 20px;
        }
    </style>
</head>
<body>

<header id="header"></header>

<main class="container d-flex">
<div class="container ">
    <div class="row ">
        <form>
            <div class="row ">
                <div class="col-sm">
                    <label for="bId" class="col-form-label">图书ID</label>
                    <input type="text" class="form-control" id="bId" aria-describedby="bIdHelp"
                           placeholder="Book ID">
                    <small id="bIdeHelp" class="form-text text-muted">请输入图书ID-可选</small>
                </div>

                <div class="col-md-2">
                    <label for="bName" class="col-form-label">图书名</label>
                    <input type="text" class="form-control" id="bName" aria-describedby="BNameHelp"
                           placeholder="Book Name">
                    <small id="bNameHelp" class="form-text text-muted">请输入图书名-可选</small>
                </div>

                <div class="col-md-2">
                    <label for="bCategory" class="col-form-label">图书名</label>
                    <input type="text" class="form-control" id="bCategory" aria-describedby="bCategoryHelp"
                           placeholder="Book Category">
                    <small id="bCategoryHelp" class="form-text text-muted">请输入图书类别-可选</small>
                </div>

                <div class="col-md-2">
                    <label for="bAutor" class="col-form-label">作者</label>
                    <input type="text" class="form-control" id="bAutor" aria-describedby="bAutorHelp"
                           placeholder="Book Autor">
                    <small id="bAutorHelp" class="form-text text-muted">请输入作者名称-可选</small>
                </div>

                <div class="col-md-2">
                    <label for="bPublish" class="col-form-label">出版社</label>
                    <input type="text" class="form-control" id="bPublish" aria-describedby="bPublishHelp"
                           placeholder="Book publish">
                    <small id="bPublishHelp" class="form-text text-muted">请输入出版社名称-可选</small>
                </div>

                <div class="row align-self-center m-auto">
                    <button type="submit" class="btn btn-dark " id="search">Submit</button>
                </div>

            </div>
        </form>
    </div>

    <div class="row" >
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">图书ID</th>
                <th scope="col">图书名</th>
                <th scope="col">作者</th>
                <th scope="col">出版社</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
                <td>
                    <button class="btn btn-danger">Delete</button>
                </td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td colspan="2">Larry the Bird</td>
                <td>@twitter</td>
            </tr>

            </tbody>
        </table>
    </div>
</div>
</main>

<script src="../../static/js/jquery-3.4.1.min.js"></script>
<script src="../../static/js/bootstrap.bundle.min.js"></script>
<script>
  $("#header").load("../header.jsp");
</script>
</body>
</html>