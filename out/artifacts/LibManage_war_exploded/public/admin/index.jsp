<%--
  Created by IntelliJ IDEA.
  User: 90815
  Date: 2021/1/15
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet">

</head>

<body>
<header id="header"></header>

<main class="container">
    <%--留言查询--%>
<div class="container">
        <div class="alert alert-warning" role="alert">
            留言查询模块
        </div>
    <form class="text-center row p-2">
        <div class="form-inline m-2 col-md-4">
            <input type="text" class="form-control" id="searchMsgByDate" aria-describedby="searchMsgByDate" placeholder="按日期查询">
            <button type="submit" class="btn btn-primary ml-2">查询</button>
        </div>

        <div class="form-inline m-2 col-md-4">
            <input type="text" class="form-control" id="searchMsgById" aria-describedby="searchMsgByID" placeholder="按ID查询">
            <button type="submit" class="btn btn-primary ml-2">查询</button>
        </div>
    </form>
        <div class="row border-top border-dark ">
            <div class="col-md-4">
                <div class="list-group" id="myList" role="tablist">
                    <a class="list-group-item list-group-item-action active" data-toggle="list" href="#home" role="tab">Home</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#profile" role="tab">Profile</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#messages" role="tab">Messages</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#settings" role="tab">Settings</a>
                </div>
            </div>
            <div class="col-md-6">
            <div class="tab-content">
                <textarea class="tab-pane active form-control" id="home" role="tabpanel">1</textarea>
                <textarea class="tab-pane form-control" id="profile" role="tabpanel">2</textarea>
                <textarea class="tab-pane form-control" id="messages" role="tabpanel">3</textarea>
                <textarea class="tab-pane form-control" id="settings" role="tabpanel">4</textarea>
            </div>
            </div>
            <div class="col-md-2">
                <button class="btn btn-dark">保存</button>
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteMsgBtn">
                    删除
                </button>
                <div class="modal fade" id="deleteMsgBtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteMsgBtnTitle">是否删除此条留言？</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                此操作不可逆
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="YMsg">否</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal" id="NMsg">是</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
</div>
        <%--留言查询结束--%>
<%--用户查询--%>
    <div class="container mt-4">
        <div class="alert alert-danger" role="alert">
            用户查询模块
        </div>
        <form class="text-center row p-2">
            <div class="form-inline m-2 col-md-4">
                <input type="text" class="form-control" id="searchUserByUName" aria-describedby="searchUserByUName" placeholder="按姓名查询">
                <button type="submit" class="btn btn-primary ml-2">查询</button>
            </div>
            <div class="form-inline m-2 col-md-4">
                <input type="text" class="form-control" id="searchUserById" aria-describedby="searchUserByID" placeholder="按ID查询">
                <button type="submit" class="btn btn-primary ml-2">查询</button>
            </div>
        </form>

        <div class="row border-top border-dark ">
            <div class="col-md-4">
                <div class="list-group" id="myList1" role="tablist">
                    <a class="list-group-item list-group-item-action active" data-toggle="list" href="#home1" role="tab">Home</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#profile1" role="tab">Profile</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#messages1" role="tab">Messages</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#settings1" role="tab">Settings</a>
                </div>
            </div>
            <div class="col-md-6">
                <div class="tab-content">
                    <div class="tab-pane active " id="home1" role="tabpanel">1</div>
                    <div class="tab-pane " id="profile1" role="tabpanel">2</div>
                    <div class="tab-pane " id="messages1" role="tabpanel">3</div>
                    <div class="tab-pane " id="settings1" role="tabpanel">4</div>
                </div>
            </div>
            <div class="col-md-2">

                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteMsgBtn1">
                    删除
                </button>
                <div class="modal fade" id="deleteMsgBtn1" tabindex="-1" role="dialog" aria-labelledby=""exampleModalCenterTitle aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteMsgBtnTitle1">是否删除此用户？</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                此操作不可逆
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="YMsg1">否</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal" id="NMsg1">是</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
<%--用户查询结束--%>
</main>


<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
<script>
    $("#header").load("${pageContext.request.contextPath}/public/header.jsp")
</script>
</body>
</html>
