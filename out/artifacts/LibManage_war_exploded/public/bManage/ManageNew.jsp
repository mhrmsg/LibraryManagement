<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>书库</title>

    <!-- Bootstrap core CSS -->
    <link href="../../static/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../static/css/main.css" rel="stylesheet">
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
    <form class="row text-center p-4 border border-dark shadow">
        <div class="form-group  col-md-6" >
            <label for="bNameAdd" class="col-form-label">图书名</label>
            <input type="text" class="form-control" id="bNameAdd" aria-describedby="bNameAdd"
                   placeholder="图书名">

            <label for="bCategoryAdd" class="col-form-label">类别名</label>
            <input type="text" class="form-control" id="bCategoryAdd" aria-describedby="bCategoryAdd"
                   placeholder="类别新增、多类别">
            <select class="form-control" id="bCategorySelect">
                <option>选择类别</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
            </select>

            <label for="bAutorAdd" class="col-form-label">作者</label>
            <input type="text" class="form-control" id="bAutorAdd" aria-describedby="bAutorAdd"
                   placeholder="作者">

            <label for="bPublishAdd" class="col-form-label">出版社</label>
            <input type="text" class="form-control" id="bPublishAdd" aria-describedby="bPublishAlter"
                   placeholder="出版社">

            <label for="bTagAdd" class="col-form-label">Tag</label>
            <input type="text" class="form-control" id="bTagAdd" aria-describedby="bTagAdd"
                   placeholder="Tag">
        </div>
        <div class="form-group p-2 col-md-6 align-middle ">
        <label for="bImageAdd">上传图片</label>
        <input type="file" class="form-control-file" id="bImageAdd">
        </div>

        <div class="col-md-12 ">
        <button class="btn  btn-outline-danger w-50" type="submit">Button</button>
        </div>
    </form>
    </div>
</main>


<script src="../../static/js/jquery-3.4.1.min.js"></script>
<script src="../../static/js/bootstrap.bundle.min.js"></script>
<script>
    $("#header").load("../header.jsp");
</script>
</body>
</html>