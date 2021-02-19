<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>书库</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet">
    <style>
        main {
            height: 100%;
            width: 100%;
        }
        .truncate{
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
        }
        dd .btn,ul .list-inline-item{
            -webkit-border-radius: 20px;
            -moz-border-radius: 20px;
            border-radius: 20px;
        }



    </style>
</head>
<body>
<header id="header"></header>
<main class="d-flex">
    <!--书库栏-->
    <div class="container-fluid  ml-2 shadow-sm">
        <!--分类-->
        <div class="container mt-4">
            <dl class="row  ">
                <dt class="col-sm-3 my-auto text-center">全部分类</dt>
                <dd class="col-sm-9" id="allCategory">
                    <button type="button" class="btn btn-outline-dark">null</button>
                </dd>

                <dt class="col-sm-3 my-auto text-center">作品标签</dt>
                <dd class="col-sm-9" id="u_tag">
                    <button type="button" class="btn btn-outline-dark">null</button>
                </dd>

                <dt class="col-sm-3 my-auto text-center">出版社</dt>
                <dd class="col-sm-9" id="publish">
                    <button type="button" class="btn btn-outline-dark">null</button>
                </dd>

                <dt class="col-sm-3 my-auto text-center">时间</dt>
                <dd class="col-sm-9" id="pdate">
                    <but111111ton type="button" class="btn btn-outline-dark">null</but111111ton>
                </dd>

                <dt class="col-sm-3 my-auto text-center">其他</dt>
                <dd class="col-sm-9">
                    <button type="button" class="btn btn-outline-dark">null</button>
                </dd>

            </dl>
        </div>

<%--搜索--%>
        <div class="row  border-dark  p-4 w-100 text-center  border-dark">
            <form action="${pageContext.request.contextPath}/public/index?method=searchByCondition" method="post">
                <div class="row ">
                    <div class="col-sm">
                        <label for="bId" class="col-form-label">图书ID</label>
                        <input type="text" class="form-control" id="bId" aria-describedby="bIdHelp"
                               placeholder="Book ID" name="b_id">
                        <small id="bIdeHelp" class="form-text text-muted">请输入图书ID-可选</small>
                    </div>

                    <div class="col-sm">
                        <label for="bpdate" class="col-form-label">出版日期</label>
                        <input type="text" class="form-control" id="bpdate" aria-describedby="bpdateHelp"
                               placeholder="Book Date" name="b_pdate">
                        <small id="bpdateHelp" class="form-text text-muted">请输入图书ID-可选</small>
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

                    <div class="col-md-1">
                        <label for="uTag" class="col-form-label">用户标签</label>
                        <input type="text" class="form-control" id="uTag" aria-describedby="uTagHelp" name="u_tag"
                               placeholder="User Tag">
                        <small id="uTagHelp" class="form-text text-muted">请输入用户标签-可选</small>
                    </div>


                    <div class="row align-self-center m-auto">
                        <button type="submit" class="btn btn-dark " id="search">搜索</button>
                    </div>

                </div>
            </form>
        </div>
        <!--书籍显示-->
        <div class="container border-top border-dark">
            <div class="accordion " id="blist">
                <c:forEach var="i" items="${books}"  varStatus="idxStatus">
                    <div class="card">
                        <div class="card-header bg-transparent shadow-sm" id="head${idxStatus.index}">
                            <h2 class="mb-0">
                                <button class="btn btn-link text-dark p-2  " type="button" data-toggle="collapse"
                                        data-target="#content${idxStatus.index}" aria-expanded="true" aria-controls="collapseOne">
                                <span class="row">
                                《<span class="">${i.b_name}</span>》
                              &nbsp; &nbsp;&nbsp; 作者:&nbsp; <span class="">${i.b_author}</span>
                               &nbsp; &nbsp;&nbsp;图书ID:&nbsp; <span class="">${i.b_id}</span>
                               &nbsp; &nbsp;&nbsp;出版社: &nbsp;<span class="">${i.b_publish}</span>
                              &nbsp; &nbsp;&nbsp; 标签:&nbsp; <span class="">${i.u_tag}</span>
                                </span>
                                </button>
<!--修改书籍信息-->
                                <div id="adminAlter${idxStatus.index}" class="adminLimit">
                                    <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#adminAlterData${idxStatus.index}">
                                        修改书籍信息
                                    </button>
                                    <div class="modal fade" id="adminAlterData${idxStatus.index}" tabindex="-1" role="dialog" aria-labelledby="alter" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="modal${idxStatus.index}Title">修改书籍信息</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body" style="font-size: 18px">
                                                    <form>
                                                        <div class="form-group" >
                                                            <input type="hidden" class="form-control abid"  value="${i.b_id}"
                                                                   >

                                                            <label for="bNameAlter${idxStatus.index}" class="col-form-label">图书名</label>
                                                            <input type="text" class="form-control abname" id="bNameAlter${idxStatus.index}" aria-describedby="bNameAlter" value="${i.b_name}"
                                                                   placeholder="图书名">

                                                            <label for="bCategoryAlter${idxStatus.index}" class="col-form-label">类别号</label>
                                                            <input type="text" class="form-control abcid" id="bCategoryAlter${idxStatus.index}" aria-describedby="bCategoryAlter" value="${i.c_id}"
                                                                   placeholder="类别">

                                                            <label for="bAutorAlter${idxStatus.index}" class="col-form-label">作者</label>
                                                            <input type="text" class="form-control abauthor" id="bAutorAlter${idxStatus.index}" aria-describedby="bAutorAlter" value="${i.b_author}"
                                                                   placeholder="作者">

                                                            <label for="bPublishAlter${idxStatus.index}" class="col-form-label">出版社</label>
                                                            <input type="text" class="form-control abpublish" id="bPublishAlter${idxStatus.index}" aria-describedby="bPublishAlter" value="${i.b_publish}"
                                                                   placeholder="出版社">

                                                            <label for="bInfoAlter${idxStatus.index}" class="col-form-label">简介</label>
                                                            <input type="text" class="form-control abinfo" id="bInfoAlter${idxStatus.index}" aria-describedby="bInfoAlter" value="${i.b_info}"
                                                                   placeholder="简介">

                                                            <label for="blanAlter${idxStatus.index}" class="col-form-label">语种</label>
                                                            <input type="text" class="form-control ablan" id="blanAlter${idxStatus.index}" aria-describedby="blanAlter" value="${i.b_language}"
                                                                   placeholder="语种">


                                                            <label for="bpriceAlter${idxStatus.index}" class="col-form-label">价格</label>
                                                            <input type="text" class="form-control abprice" id="bpriceAlter${idxStatus.index}" aria-describedby="bpriceAlter" value="${i.b_price}"
                                                                   placeholder="介个">

                                                            <label for="bdateAlter${idxStatus.index}" class="col-form-label">出版日期</label>
                                                            <input type="date" class="form-control abdate" id="bdateAlter${idxStatus.index}" aria-describedby="bdateAlter" value="${i.b_pdate}"
                                                                   placeholder="出版日期">

<%--                                                            <div class="container">--%>
<%--                                                                <label for="bTagAlter${idxStatus.index}" class="col-form-label">Tag</label>--%>
<%--                                                                <ul class="list-inline " id="bTagAlter${idxStatus.index}">--%>
<%--                                                                    <li class="list-inline-item m-1 border p-2 d-inline-block ">--%>
<%--                                                                        <span class="my-auto">aaaaaaa</span>--%>
<%--                                                                        <button type="button" class="btn btn-outline-danger border-0 ">X</button>--%>
<%--                                                                    </li>--%>
<%--                                                                </ul>--%>
<%--                                                            </div>--%>
                                                        </div>

                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                                    <button type="button" class="btn btn-primary absave" data-dismiss="modal">保存</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </h2>
                        </div>
                        <div id="content${idxStatus.index}" class="collapse " aria-labelledby="headingOne"
                             data-parent="#blist">
                            <div class="card-body ">
                                <div class="row no-gutters">
                                    <div class="col-md-2">
                                        <a href="#">  <img class="card-img-top w-50 m-auto" src="${pageContext.request.contextPath}/static/images/book.jfif"
                                                           alt="Card image cap"></a>
                                    </div>
                                    <div class="col-md-8 truncate">
                                        <a >${i.b_info}</a>

                                    </div>
                                    <a href="${pageContext.request.contextPath}/public/index?method=searchByBid&b_id=${i.b_id}"> <img src="${pageContext.request.contextPath}/static/images/Go.png" width="25" height="25" class=""></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</main>
</div>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
<script>
  $("#header").load("${pageContext.request.contextPath}/public/header.jsp");
  loadCategory();
  window.load = function () {
      loadCategory();
  };
  function loadCategory(){
      $.ajax({
          url: "${pageContext.request.contextPath}/public/index?method=searchAllCategory",
          type: "POST",
          data: "",
          dataType: "text",
          success: function (data) {
              let splitData = data.split("---");
              let bclass = splitData[0];
              let tag = splitData[1];
              let publish = splitData[2];
              let pdate = splitData[3];
              let bcontent = "";
              let tcontent = "";
              let pcontent = "";
              let dcontent = "";
              $.each(JSON.parse(bclass),function (index, val) {
                  bcontent += "<a href=\"${pageContext.request.contextPath}/public/index?method=searchByConditionCategory&c_name="+val.c_name+"\"><button type=\"button\" class=\"btn btn-outline-dark ml-1\" >"+val.c_name+"</button></a>"
              });
              $.each(JSON.parse(tag),function (index, val) {
                  tcontent += "<a href=\"${pageContext.request.contextPath}/public/index?method=searchByCondition&u_tag="+val.u_tag+"\"><button type=\"button\" class=\"btn btn-outline-dark ml-1\">"+val.u_tag+"</button></a>"
              });
              $.each(JSON.parse(publish),function (index, val) {
                  pcontent += "<a href=\"${pageContext.request.contextPath}/public/index?method=searchByCondition&b_publish="+val.b_publish+"\"><button type=\"button\" class=\"btn btn-outline-dark ml-1\">"+val.b_publish+"</button></a>"
              });
              $.each(JSON.parse(pdate),function (index, val) {
                  dcontent += "<a href=\"${pageContext.request.contextPath}/public/index?method=searchByCondition&b_pdate="+val.b_pdate+"\"><button type=\"button\" class=\"btn btn-outline-dark ml-1\">"+val.b_pdate+"</button></a>"
              });
              $("#allCategory").html(bcontent);
              $("#u_tag").html(tcontent);
              $("#publish").html(pcontent);
              $("#pdate").html(dcontent);
          }, error: function () {
              console.log(this.url);
              alert("请求失败loadCategory");
          }
      })
  }

  //获得要修改书籍的信息


  //管理员功能
  $(".adminLimit").click(function (e){
      if ("${admin}" == "" || "${admin}" == null) {
          alert("非管理员不能修改信息");
          e.stopPropagation();
      }
  });

  $(".absave").click(function (){
      console.log(1);
      let bid = $(".abid").val();
      let bname = $(".abname").val();
      let bcid = $(".abcid").val();
      let bauthor = $(".abauthor").val();
      let publish = $(".abpublish").val();
      let info = $(".abinfo").val();
      let lan = $(".ablan").val();
      let bdate = $(".abdate").val();
      let abprice = $(".abprice").val();
      $.ajax({
          url: "${pageContext.request.contextPath}/public/admin?method=updateBook",
          type: "POST",
          data: {"b_id":bid,"b_name":bname,"c_id":bcid,"b_author":bauthor,"b_publish":publish,"b_info":info,"b_language":lan,"b_pdate":bdate,"b_price":abprice},
          dataType: "text",
          success: function (data) {
            alert(data);
          }, error: function () {
              alert("修改失败");
          }
      })
  });

</script>
</body>
</html>