<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>旧书管理</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
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
        <form action="${pageContext.request.contextPath}/public/index?method=searchDelBook" method="post">
            <div class="row ">
                <div class="col-sm">
                    <label for="bId" class="col-form-label">图书ID</label>
                    <input type="text" class="form-control" id="bId" aria-describedby="bIdHelp" name="b_id"
                           placeholder="Book ID">
                    <small id="bIdeHelp" class="form-text text-muted">请输入图书ID-可选</small>
                </div>

                <div class="col-md-2">
                    <label for="bName" class="col-form-label">图书名</label>
                    <input type="text" class="form-control" id="bName" aria-describedby="BNameHelp" name="b_name"
                           placeholder="Book Name">
                    <small id="bNameHelp" class="form-text text-muted">请输入图书名-可选</small>
                </div>

                <div class="col-md-2">
                    <label for="bCategory" class="col-form-label">类别号</label>
                    <input type="text" class="form-control" id="bCategory" aria-describedby="bCategoryHelp" name="c_id"
                           placeholder="Book Category">
                    <small id="bCategoryHelp" class="form-text text-muted">请输入图书类别-可选</small>
                </div>

                <div class="col-md-2">
                    <label for="bAutor" class="col-form-label">作者</label>
                    <input type="text" class="form-control" id="bAutor" aria-describedby="bAutorHelp" name="b_author"
                           placeholder="Book Autor">
                    <small id="bAutorHelp" class="form-text text-muted">请输入作者名称-可选</small>
                </div>

                <div class="col-md-2">
                    <label for="bPublish" class="col-form-label">出版社</label>
                    <input type="text" class="form-control" id="bPublish" aria-describedby="bPublishHelp" name="b_publish"
                           placeholder="Book publish">
                    <small id="bPublishHelp" class="form-text text-muted">请输入出版社名称-可选</small>
                </div>

                <div class="row align-self-center m-auto">
                    <button type="submit" class="btn btn-dark " id="search">搜索</button>
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
            <c:forEach var="i" items="${books}"  varStatus="idxStatus">
            <tr>
                <th scope="row">${i.b_id}</th>
                <td>${i.b_name}</td>
                <td>${i.b_author}</td>
                <td>${i.b_publish}</td>
                <td>
                    <button class="btn btn-danger"  data-toggle="modal" data-target="#deleteBookBtn${idxStatus.index}">Delete</button>
                    <div class="modal fade" id="deleteBookBtn${idxStatus.index}" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="deleteMsgBtnTitle${idxStatus.index}">是否删除此书？</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    此操作不可逆
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="NMsg${idxStatus.index}">否</button>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal"   id="YMsg${idxStatus.index}">是</button>
                                    <script>
                                        $("#YMsg${idxStatus.index}").click(function (){
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/public/index?method=delBook",
                                                type: "POST",
                                                data: {b_id:"${i.b_id}"},
                                                dataType: "text",
                                                success: function (data) {

                                                    setTimeout(function (){
                                                        if (data != ""){
                                                            alert(data);
                                                        }
                                                        window.location.href = "${pageContext.request.contextPath}/public/bManage/ManageOld.jsp";
                                                    }, 500);

                                                }, error: function () {
                                                    console.log(this.url);
                                                    alert("删除失败");
                                                }
                                            })
                                        });
                                    </script>

                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>
</main>



<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
<script>

    if("${msg}" != ""){
        alert("${msg}");
    };

    $("#header").load("${pageContext.request.contextPath}/public/header.jsp");

</script>
</body>
</html>