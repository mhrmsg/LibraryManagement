<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>MHR 图书管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet">
<style>

</style>
</head>
<body>

<header id="header"></header>


<main role="main" class="container-fluid" id="main">
    <div class="container p-3">
        <!--消息公告开始-->
        <nav>
            <div class="nav nav-tabs border-0" id="headtab" role="tablist">
                <a class="nav-item nav-link active text-dark font-weight-bold  " id="headNotice" data-toggle="tab"
                   href="#headNoticeConent"
                   role="tab" aria-controls="headNoticeConent" aria-selected="true">重要通知</a>
                <a class="nav-item nav-link text-primary text-dark font-weight-bold" id="headAdminNotice"
                   data-toggle="tab" href="#headAdminNoticeContent"
                   role="tab" aria-controls="headAdminNoticeContent" aria-selected="false">管理员公告</a>
                <a class="nav-item nav-link text-dark font-weight-bold" id="headStudentMessage" data-toggle="tab"
                   href="#headStudentMessageContent"
                   role="tab" aria-controls="headStudentMessageContent" aria-selected="false">学生留言</a>
            </div>
        </nav>
        <!--内容-->
        <div class="tab-content" id="headtabContent">
             <div class="tab-pane fade show active " id="headNoticeConent" role="tabpanel"
                 aria-labelledby="headNoticeConent">
                <!--内容中使用卡片组-->
                <div class="card-group row no-gutters ">
                    <%--每一项--%>
                        <div class="card-group row col-md-9  no-gutters " id="getmsgMainDeatil">

                        </div>
                        <div class="card ml-2 mt-2 col-md-3 bg-transparent border-bottom-0 border-right-0"
                             style="width: 18rem;">
                            <ul class="list-group list-group-flush " id="getmsgMainEasy">
                            </ul>
                        </div>
                        <%--每一项结束,重要通知结束--%>
                </div>
             </div>


                <div class="tab-pane fade" id="headAdminNoticeContent" role="tabpanel"
                     aria-labelledby="headAdminNoticeContent">
                    <div class="card-group row no-gutters ">
                        <div class="card-group row col-md-9 no-gutters " id="getmsgSecDeatil">
                        </div>
                        <div class="card ml-2 mt-2 col-md-3 bg-transparent border-bottom-0 border-right-0"
                             style="width: 18rem;">
                            <div class="list-group list-group-flush " id="getmsgSecEasy">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="headStudentMessageContent" role="tabpanel"
                     aria-labelledby="headStudentMessageContent">
                    <div class="card-group row no-gutters ">
                        <div class="card-group row col-md-9 no-gutters " id="getmsgThiDeatil">
                        </div>
                        <div class="card ml-2 mt-2 col-md-3 bg-transparent border-bottom-0 border-right-0"
                             style="width: 18rem;">
                            <ul class="list-group list-group-flush " id="getmsgThiEasy">
                            </ul>
                        </div>
                    </div>
                </div>

        </div>
        <!--消息公告结束-->
        <!--本地图书开始-->
        <div class="container mt-3">
            <div class="card row bg-transparent border-0">
                <div class="card-header bg-white  shadow-sm">
                    <span class="ml-md-3 font-weight-bold" style="font-size: 22px">本地图书</span>
                    <div class="d-inline ml-2" id="refreshBook">
                        <a class="btn-link">随机换一批</a>
                        <img id="refreshImg" src="${pageContext.request.contextPath}/static/images/refresh.png"
                             width="28"
                             height="28">
                    </div>

                    <form class="form-inline float-md-right  mt-auto mb-auto" action="${pageContext.request.contextPath}/public/index?method=searchByCondition" method="post">
                        <input class="form-control mr-sm-2" type="text" placeholder="搜索(书名)" name="b_name" aria-label="搜索(书名)">
                        <button class="btn btn-outline-dark" type="submit">Search</button>
                    </form>
                </div>

                <div class="card-body row ml-2  mt-3" id="refreshContent">
                    <%--content--%>
                </div>
            </div>

        </div>
        <!--本地图书结束-->
        <div class="container">
        </div>
    </div>
</main>

<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/main.js"></script>

<%--ajax随机换一批--%>
<script>
    let num = 5, name = null;
    window.onload = function () {
        refresh();
        getmsg(0, "#getmsgMainDeatil", "#getmsgMainEasy");
    };



    $("#refreshImg").click(refresh);
    $("#headNotice").click(getmsg(0, "#getmsgMainDeatil", "#getmsgMainEasy"));
    $("#headAdminNotice").click(getmsg(1, "#getmsgSecDeatil", "#getmsgSecEasy"));
    $("#headStudentMessage").click(getmsg(2, "#getmsgThiDeatil", "#getmsgThiEasy"));

    function refresh() {
        $.ajax({
            url: "index?method=searchBookByRandom",
            type: "POST",
            data: {"num": num, "name": name},
            dataType: 'json',
            success: function (data) {
                var refreshContent = "";
                $.each(data, function (index, val) {
                    refreshContent += "<div class=\"card col-md-2 p-1  text-center ml-4  border-0\"   >\n" +
                        "                        <img class=\"card-img-top w-50 m-auto\" src=\"${pageContext.request.contextPath}/static/images/book.jfif\" alt=\"Card image cap\">\n" +
                        "                        <div class=\"card-body\">\n" +
                        "                            <h5 class=\"card-title\"><a class=\"text-dark\" href=\"${pageContext.request.contextPath}/public/index?method=searchByBid&b_id="+val.b_id+"\">" + val.b_name + "</a></h5>\n" +
                        "                            <p class=\"card-text\">" + val.b_info + "</p>\n" +
                        "                            <p class=\"card-text\"><small class=\"text-muted\">" + val.b_pdate + "</small></p>\n" +
                        "                        </div>\n" +
                        "                    </div>"
                });

                $("#refreshContent").html(refreshContent);
                //阴影
                $(".card-img-top").hover(function () {
                    $(this).addClass("shadow");
                }, function () {
                    $(this).removeClass("shadow");
                });
            }, error: function () {
                console.log(this.url);
                alert("请求失败refresh");
            }
        })
    }


    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + seperator1 + month + seperator1 + strDate;
        return currentdate;
    }

    //信息获取
    function getmsg(limit, detailId, easyId) {
        $.ajax({
            url: "index?method=searchMsgByDate",
            type: "POST",
            data: {"date": getNowFormatDate(), "name": name, "limit": limit},
            dataType: 'json',
            success: function (data) {
                let getmsgcontentDetail = "";
                let getmsgcontentEasy = "";
                $.each(data, function (index, val) {
                    let splitContent = val.msg.split("headerend");
                    let head = splitContent[0];
                    let content = splitContent[1];
                    let date = val.date;
                    console.log(index);
                    if (index < 3) {
                        getmsgcontentDetail += "<div class=\"card border-dark ml-2 mt-2 col-md-3 bg-transparent   border-left-0 border-right-0\"" +
                            "                         style=\"max-width: 20rem;max-height: 22rem;min-height: 17rem;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;\">" +
                            "                        <div class=\"card-header bg-transparent border-dark\" style = \" white-space: nowrap;overflow: hidden;text-overflow: ellipsis; \"  >" + head + "</div>" +
                            "                        <div class=\"card-body text-dark\" >" +
                            "                            <div class=\"card-title\"    style = \" white-space: nowrap;overflow: hidden;text-overflow: ellipsis; font-weight: bold;\">" + head + "</div>" +
                            "                            <div class=\"card-text\" style = \" white-space: normal;overflow: hidden;text-overflow: ellipsis; \">" + content + "</div>" +
                            "                        </div>" +
                            "                        <div class=\"card-footer bg-transparent border-dark\">" + date + "</div>" +
                            "                    </div>";
                    } else {
                        getmsgcontentEasy += "<li class=\"list-group-item  bg-transparent\" style='white-space: nowrap;overflow: hidden;text-overflow: ellipsis;'>" + head + "</li>";
                    }

                });
                $(detailId).html(getmsgcontentDetail);
                $(easyId).html(getmsgcontentEasy);

            }, error: function () {
                console.log(this.url);
                alert("请求失败Msg");
            }
        })
    }
</script>

</body>
</html>
