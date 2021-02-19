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
        .col-md-12 .btn {
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
                    <div class="col-md-8 text-center">
                        <div class="row no-gutters ">
                            <div><h2 class="d-block"><a href="${pageContext.request.contextPath}/public/index?method=searchByCondition&b_name=${book.b_name}" class="text-dark">${book.b_name}</a></h2></div>
                        </div>
                        <div class="row no-gutters">
                            <div class="">
                                <div class="" style="font-size: 20px"><a href="${pageContext.request.contextPath}/public/index?method=searchByCondition&b_author=${book.b_author}" class="text-primary mt-1">${book.b_author}</a><span>著</span>
                                </div>
                            </div>
                        </div>
                        <div class="row no-gutters  mt-2">
                            <span style="font-size: 18px;">出版社: <a href="${pageContext.request.contextPath}/public/index?method=searchByCondition&b_publish=${book.b_publish}" class="text-primary">${book.b_publish}</a></span>
                        </div>
                        <div class="row no-gutters mt-2">
                            <span style="font-size: 18px;">语言: <a href="#" class="text-dark">${book.b_language}</a></span>
                        </div>
                        <div class="row no-gutters mt-2">
                            <span style="font-size: 18px;">价格: <a href="#" class="text-dark">${book.b_price} 元</a></span>
                        </div>
                        <div class="row no-gutters mt-2">
                            <span style="font-size: 18px;">出版日期: <a href="#" class="text-dark ">${book.b_pdate}</a></span>
                        </div>
                        <div class="row no-gutters mt-2">
                            <span style="font-size: 18px;">剩余数量: <a href="#" class="text-dark">${book.b_num} 本</a></span>
                        </div>
                        <div class="row no-gutters mt-2">
                            <span style="font-size: 18px;">类型: <a href="#" class="text-dark">${book.c_id} ${c_name}</a></span>
                        </div>
                    </div>
                </div>
                <div class="container-fluid mt-4">
                    <div class="row">
                        <div class="col-md-12" id="utag">
                            <button type="button" class="btn btn-outline-dark">null</button>
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
                                ${book.b_info}
                            </div>
                        </div>
                    </div>
                </div>

<%--用户评价--%>
                <div class="row mt-5 ">
                    <div class="list-group w-50" id="ucomment">
                    </div>

                </div>
                <div class="row">
                    <div class="w-50 " >
                        评论:<input type="text" class="form-control" name="content" id="comment">
<%--                        <input type="hidden" name="b_id" value="${b_id}">--%>
<%--                        <input type="hidden" name="u_id" value="${u_id}">--%>

                        <button class="btn btn-dark" id="commentAdd" >提交</button>

                    </div>
                </div>
<%--用户评价结束--%>
            </div>

    <div class="col-md-4">
                <div class="w-50">
                    <ul class="list-group  text-center">
                        <li class="list-group-item border-0" id="Blend" >借出与归还</li>

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

    let utag = " ${book.u_tag} ";
    let split = utag.split(",");

    //评论展开
    let tagContent = "";
    for (i = 0  ; i < split.length ; i++){
        tagContent += "<a href=\"${pageContext.request.contextPath}/public/index?method=searchByCondition&u_tag="+split[i]+"\"><button type=\"button\" class=\"btn btn-outline-dark ml-1\">"+split[i]+"</button></a>"
    }
    let getname = "";
    function getUName(uid) {
        $.ajax({
            url: "${pageContext.request.contextPath}/public/index?method=searchUNameById",
            type: "POST",
            async:false,
            data: {"u_id":uid},
            dataType: "text",
            success: function (data) {
                getname = data;

            }, error: function () {
                console.log(this.url);
                alert("请求失败uname");
            }
        })
    }


    //评论功能
    $("#commentAdd").click(function (){
        if ("${admin}" != "")
            alert("管理员暂未开通评论");
        else
        $.ajax({
            url: "${pageContext.request.contextPath}/public/index?method=addComment",
            type: "POST",
            data: {"b_id":"${book.b_id}","u_id":"${user.u_id}","content":$("#comment").val()},
            dataType: "text",
            success: function (data) {
                alert(data);
                $("#comment").val("");
            }, error: function () {
                console.log(this.url);
                alert("请求失败评论");
            }
        })
    });

    let u_commentlist = "${book.u_comment}".split(",");
    let commentHtml = "";
    if ( u_commentlist.length > 0 )
    for(i = 0 ;  i < u_commentlist.length ; i++){
        if (u_commentlist[i] == ""){
            continue;
        }
        let splitContent =  u_commentlist[i].split(":");
        let u_id = splitContent[0];
        getUName(u_id);
        let uname = getname;
        let content = splitContent[1];
        commentHtml += "<a href=\"#\" class=\"list-group-item list-group-item-action flex-column align-items-start\"><div class=\"d-flex w-100 justify-content-between\">"+
            "<h5 class=\"mb-1\">"+uname+"</h5></div><p class=\"mb-1\">"+content+"</p></a>";
    }
    $("#ucomment").html(commentHtml);

    $("#utag").html(tagContent);



    //借出与归还
    let lendContent = "";
    function searchBLend(){
        $.ajax({
            url: "${pageContext.request.contextPath}/public/index?method=searchBLend",
            type: "POST",
            async:false,
            data: {"b_id":"${book.b_id}"},
            dataType: "JSON",
            success: function (data) {
                if (data == "")
                    lendContent +=  " <li class=\"list-group-item list-group-item-action\" >"+"暂无记录" +" <a href=\"#\" class=\"badge badge-dark\">可借</a></li>" ;
                else
                $.each(data,function (index, val) {
                    if (index == 0)
                        lendContent += " <li class=\"list-group-item list-group-item-action\" >"+val.u_name +" <a href=\"#\" class=\"badge badge-danger\">在借</a></li>";
                    else if (index <= 4)
                    lendContent += " <li class=\"list-group-item list-group-item-action\" >"+val.u_name +" <a href=\"#\" class=\"badge badge-info\">已归还</a></li>";
                    //限制为4个内
                });
                $("#Blend").after(lendContent);
            }, error: function () {
                console.log(this.url);
                alert("请求失败lendContent");
            }
        })
    }
    searchBLend();

</script>
</body>
</html>
