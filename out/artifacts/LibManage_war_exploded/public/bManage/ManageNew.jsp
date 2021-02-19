<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
main{
    height: 100%;
    width: 100%;
}
</style>
</head>
<body>

<header id="header"></header>

<main class="container d-flex ">
    <div class="container mt-5  ">
    <form class="row text-center p-4 border border-dark shadow" action="${pageContext.request.contextPath}/public/index?method=addNewBook" method="post">
        <div class="form-group  col-md-6" >
            <label for="bNameAdd" class="col-form-label">图书名</label>
            <input type="text" class="form-control" id="bNameAdd" aria-describedby="bNameAdd" name="b_name"
                   placeholder="图书名">
            <label for="bCategoryAdd" class="col-form-label">类别名</label>
            <input type="text" class="form-control" id="bCategoryAdd" aria-describedby="bCategoryAdd"
                   placeholder="类别新增、多类别" name="newclass">
            <select class="form-control"  name="c_id">
                <option id="bCategorySelect">选择类别</option>
            </select>

            <label for="bAutorAdd" class="col-form-label">作者</label>
            <input type="text" class="form-control" id="bAutorAdd" aria-describedby="bAutorAdd" name="b_author"
                   placeholder="作者">

            <label for="bPublishAdd" class="col-form-label">出版社</label>
            <input type="text" class="form-control" id="bPublishAdd" aria-describedby="bPublishAlter" name="b_publish"
                   placeholder="出版社">

            <label for="bTagAdd" class="col-form-label">Tag</label>
            <input type="text" class="form-control" id="bTagAdd" aria-describedby="bTagAdd" name="u_tag"
                   placeholder="Tag">
        </div>

        <div class="form-group p-2 col-md-6 align-middle ">
        <label for="bImageAdd">上传图片</label>
        <input type="file" class="form-control-file" id="bImageAdd">

            <label for="binfo" class="col-form-label">简介</label>
            <input type="text" class="form-control" id="binfo" aria-describedby="binfo" name="b_info"
                   placeholder="info">

            <label for="binfo" class="col-form-label">价格 - 元</label>
            <input type="text" class="form-control" id="bprice" aria-describedby="binfo" name="b_price"
                   placeholder="price">

            <label for="binfo" class="col-form-label">出版日期 2021-2-1</label>
            <input type="text" class="form-control" id="bpdate" aria-describedby="binfo" name="b_pdate"
                   placeholder="date">

            <label for="binfo" class="col-form-label">总数量</label>
            <input type="text" class="form-control" id="bnum" aria-describedby="binfo" name="b_num"
                   placeholder="num">


        </div>

        <div class="col-md-12 ">
        <button class="btn  btn-outline-danger w-50" type="submit" id="commit">提交</button>
        </div>
    </form>
    </div>
</main>


<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
<script>
    $("#header").load("${pageContext.request.contextPath}/public/header.jsp");
    getCategory();
    function getCategory() {
        $.ajax({
            url: "${pageContext.request.contextPath}/public/index?method=searchAllClass",
            type: "POST",
            data: "",
            dataType: "JSON",
            success: function (data) {
                let categoryContent = "";
                $.each(data, function (index, val) {
                    categoryContent += "<option>"+val.c_id +": "+ val.c_name+"</option>";
                });
                $("#bCategorySelect").after(categoryContent);
            }, error: function () {
                console.log(this.url);
                alert("请求失败getCategory");
            }
        })
    }

    if("${msg}" != ""){
        alert("${msg}");
    }
</script>
</body>
</html>