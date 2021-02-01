<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--nav导航栏-->
<nav class="navbar navbar-expand-md navbar-light bg-white border-bottom shadow-sm fixed-top">
    <a class="navbar-brand  font-weight-bold ml-5" href="${pageContext.request.contextPath}/public/index.jsp">图书管理系统<span class="sr-only">图书管理系统</span></a>
    <!--适配下的按钮、找到navbar所在的div将该div内容进行显示-->
    <button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#navbar"
            aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle mav">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbar">
        <!-- 各导航内容-->
        <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown">
                <!--下拉列表-->
                <a class="nav-link dropdown-toggle" href="#" id="navdropdownManage" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">图书管理</a>
                <div class="dropdown-menu" aria-labelledby="dropdown01">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/public/bManage/ManageAll.jsp">全部书库</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/public/bManage/ManageNew.jsp">新书管理</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/public/bManage/ManageOld.jsp">旧书管理</a>
                </div>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navdropdownInfo" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">资讯</a>
                <div class="dropdown-menu" aria-labelledby="dropdown01">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/public/bInfo/InfoBook.jsp">图书资讯</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/public/bInfo/InfoStudyRoom.jsp">自习室资讯</a>
                </div>
            </li>

            <li class="nav-item ">
                <a class="nav-link " href="${pageContext.request.contextPath}/public/bFeedBack/FeedBackIndex.jsp" id="navdropdownFeedback" >反馈</a>
            </li>


            <li class="nav-item ">
                <a class="nav-link " href="${pageContext.request.contextPath}/public/index?method=userIndex" id="navdropdownMy" >我的</a>
            </li>

        </ul>
        <!--徽章 信息提示-->
        <button type="button" class="btn btn-outline-dark btn-sm ml-auto">
            信息 <span class="badge badge-dark">9</span>
            <span class="sr-only">unread messages</span>
        </button>
        <!--头像-->
        <figure style="width: 30px;height: 30px;" class="mt-2 mb-2 ml-2" id="myfigure">
            <a  href="${pageContext.request.contextPath}/public/index?method=userIndex">
            <img class="mb-3 rounded-circle shadow myImage" src="${pageContext.request.contextPath}/static/images/login_logo.jpg " alt="我"
                 width="30" height="30">
            </a>
        </figure>
    </div>

</nav>

<script>
    $(".myImage").hover(function (){
        $(this).addClass("imagerotate")
      },
      function (){
        $(this).removeClass("imagerotate")
      });
    let onResize = function() {
      // apply dynamic padding at the top of the body according to the fixed navbar height
      $("body").css("margin-top", $(".navbar").height()+18);
    };

    // attach the function to the window resize event
    $(window).resize(onResize);
    // call it also when the page is ready after load or reload



    $(function() {
      onResize();

    });


</script>

<script id="ribbon" size="150" alpha='0.3' zIndex="-2" src="${pageContext.request.contextPath}/static/js/canvas-ribbon.min.js"></script>