<%--
  Created by IntelliJ IDEA.
  User: 马浩然
  Date: 2021/1/15
  Time: 11:27
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
    <div class="text-center row p-2" >
        <div class="form-inline m-2 col-md-3">
            <input type="date" class="form-control" id="searchMsgByDate" aria-describedby="searchMsgByDate" placeholder="按日期查询" name="date">
        </div>

        <div class="form-inline m-2 col-md-3">
            <input type="text" class="form-control" id="searchMsgById" aria-describedby="searchMsgByID" placeholder="按ID查询" name="mid">
        </div>
        <div class="col-md-2 m-2">
            <button type="submit" class="btn btn-primary searchMsg">查询</button>
        </div>

    </div>
<%--留言查询--%>
        <div class="row border-top border-dark ">
            <div class="col-md-4">
                <div class="list-group" id="myList" role="tablist">
                </div>
            </div>
            <div class="col-md-6">
            <div class="tab-content" id="listcontent">

            </div>
            </div>

            <div class="col-md-2">
                <button class="btn btn-dark" id="msgSave">保存</button>
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteMsgBtn" >
                    删除
                </button>

                <div class="modal fade" id="deleteMsgBtn" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
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
                                <button type="button" class="btn btn-secondary" data-dismiss="modal" >否</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal" id="msgDel">是</button>
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
        <div class="text-center row p-2">
            <div class="form-inline m-2 col-md-3">
                <input type="text" class="form-control" id="searchUserByUName" aria-describedby="searchUserByUName" placeholder="按姓名查询">
            </div>
            <div class="form-inline m-2 col-md-3">
                <input type="text" class="form-control" id="searchUserById" aria-describedby="searchUserByID" placeholder="按ID查询">
            </div>
            <div class="col-md-2 m-2">
                <button type="submit" class="btn btn-primary searchUser">查询</button>
            </div>
        </div>

        <div class="row border-top border-dark ">
            <div class="col-md-4">
                <div class="list-group" id="userlist" role="tablist">
                </div>
            </div>
            <div class="col-md-6">
                <div class="tab-content" id="ulistContent">

                </div>
            </div>
            <div class="col-md-2">

                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delUser">
                    删除
                </button>
                <div class="modal fade" id="delUser" tabindex="-1" role="dialog"  aria-hidden="true">
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
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">否</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal" id="userdel">是</button>
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
    $("#header").load("${pageContext.request.contextPath}/public/header.jsp");

    //信息查询
    $(".searchMsg").click(function (){
        let sdate = $("#searchMsgByDate").val();
        let sid = $("#searchMsgById").val();
        let msgacontent = "";
        let msgtcontent = "";
        $.ajax({
            url: "${pageContext.request.contextPath}/public/admin?method=searchMsg",
            type: "POST",
            data: {"date":sdate,"mid":sid},
            dataType: "JSON",
            success: function (data) {
                $.each(data,function (index, val) {
                    //索引为 0 时 active
                    if (index == 0) {
                        //msg表中有admin_id 以及 u_id
                        //admin不为空
                        if (val.admin_id != "") {
                            msgacontent += "<a class=\"list-group-item list-group-item-action active \" data-toggle=\"list\" href=\"#msg" + index + "\" role=\"tab\">"+val.date +"~"+ val.admin_id+"</a>";
                            msgtcontent += "<textarea class=\"tab-pane active  form-control\" style='height: 12rem' id=\"msg" + index + "\" role=\"tabpanel\">" + val.msg + "</textarea> ";
                        } else {
                            msgacontent += "<a class=\"list-group-item list-group-item-action active\" data-toggle=\"list\" href=\"#msg" + index + "\" role=\"tab\">"+ val.date +"~" +  val.u_id + "</a>";
                            msgtcontent += "<textarea class=\"tab-pane active  form-control\" style='height: 12rem' id=\"msg" + index + "\" role=\"tabpanel\">" + val.msg + "</textarea> ";
                        }
                    }
                    else {
                        if (val.admin_id != "") {
                            msgacontent += "<a class=\"list-group-item list-group-item-action \" data-toggle=\"list\" href=\"#msg" + index + "\" role=\"tab\">"+val.date +"~"+ val.admin_id+"</a>"
                            msgtcontent += "<textarea class=\"tab-pane  form-control\" style='height: 12rem'  id=\"msg" + index + "\" role=\"tabpanel\">" + val.msg + "</textarea> ";
                        }
                        else {
                            msgacontent += "<a class=\"list-group-item list-group-item-action \" data-toggle=\"list\" href=\"#msg" + index + "\" role=\"tab\">"+ val.date +"~" +  val.u_id + "</a>";
                            msgtcontent += "<textarea class=\"tab-pane  form-control\" style='height: 12rem' id=\"msg" + index + "\" role=\"tabpanel\">" + val.msg + "</textarea> ";
                        }
                    }

                });
                $("#myList").html(msgacontent);
                $("#listcontent").html(msgtcontent);


            }, error: function () {
                console.log(this.url);
                alert("操作失败");
            }
        });
    });
    let mstate = "";
    let mid = "";
    let mcontent = "";
    let mdate = "";
    function msgoperation(state,id,content){
        $.ajax({
            url: "${pageContext.request.contextPath}/public/admin?method=msgoperation",
            type: "POST",
            data: {"state":state,"id":id,"msgcontent":content,"date":mdate},
            dataType: "text",
            success: function (data) {
                alert(data);
                window.location.href = "${pageContext.request.contextPath}/public/admin/index.jsp";
            }, error: function () {
                console.log(this.url);
                alert("操作失败");
            }
        });
    }

    $("#msgSave").click(function (){
        if ($("#myList > a.list-group-item.list-group-item-action.active").html() != "") {
            mid = $("#myList > a.list-group-item.list-group-item-action.active").html().split("~")[1];
            mdate =$("#myList > a.list-group-item.list-group-item-action.active").html().split("~")[0];
        }
        mcontent = $("#listcontent > textarea.active").val();
        mstate = "update";
        msgoperation(mstate,mid,mcontent,mdate);
    });

    $("#msgDel").click(function (){
        if ($("#myList > a.list-group-item.list-group-item-action.active").html() != "") {
            mid = $("#myList > a.list-group-item.list-group-item-action.active").html().split("~")[1];
            mdate =$("#myList > a.list-group-item.list-group-item-action.active").html().split("~")[0];
        }
        mstate = "del";
        msgoperation(mstate,mid,"",mdate);
    });

    //用户查询
    $(".searchUser").click(function (){
        let uname = $("#searchUserByUName").val();
        let uid = $("#searchUserById").val();
        let useracontent = "";
        let usertcontent = "";
        $.ajax({
            url: "${pageContext.request.contextPath}/public/admin?method=searchUser",
            type: "POST",
            data: {"uname":uname,"uid":uid},
            dataType: "JSON",
            success: function (data) {
                $.each(data,function (index, val) {
                    if (index == 0) {
                         useracontent += "<a class=\"list-group-item list-group-item-action active \" data-toggle=\"list\" href=\"#user" + index + "\" role=\"tab\">"+val.u_id +"~"+ val.u_name+ "</a>";
                         usertcontent += "<div class=\"tab-pane active \" id=\"user"+ index+" \" role=\"tabpanel\">" + val.u_name + "---" + val.u_sex + "---" + val.u_address + "---" + val.s_id + "</div>";
                        }
                    else {
                        useracontent += "<a class=\"list-group-item list-group-item-action  \" data-toggle=\"list\" href=\"#user" + index + "\" role=\"tab\">"+val.u_id +"~"+ val.u_name+"</a>";
                        usertcontent += "<div class=\"tab-pane  \" id=\"user"+ index+"\" role=\"tabpanel\">" + val.u_name + "---" + val.u_sex + "---" + val.u_address + "---" + val.s_id + "</div>";
                    }
                });
                $("#userlist").html(useracontent);
                $("#ulistContent").html(usertcontent);

            }, error: function () {
                console.log(this.url);
                alert("操作失败");
            }
        });
    });

    //用户删除
    $("#userdel").click(function(){
        let uid = "";
        if ($("#userlist > a.list-group-item.list-group-item-action.active").html() != "") {
            uid = $("#userlist > a.list-group-item.list-group-item-action.active").html().split("~")[0];
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/public/admin?method=delUser",
            type: "POST",
            data: {"uid":uid},
            dataType: "text",
            success: function (data) {
                alert(data);
                window.location.href = "${pageContext.request.contextPath}/public/admin/index.jsp";
            }, error: function () {
                console.log(this.url);
                alert("操作失败");
            }
        });
    });
</script>
</body>
</html>
