<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../header/meta.jsp" %>

    <title>添加单词</title>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../header/nav.jsp" %>
<div class="container-fluid">
    <form class="form-horizontal" action="${pageContext.request.contextPath}/add" method="post">
        <div class="form-group">
            <label for="word" class="col-lg-1 col-sm-2 control-label">单词</label>
            <div class="col-sm-10 col-lg-11">
                <input type="text" class="form-control" id="word" name="word">
            </div>
        </div>
        <div class="form-group">
            <label for="symbol" class="col-lg-1 col-sm-2 control-label">音标</label>
            <div class="col-sm-10 col-lg-11">
                <input type="text" class="form-control" id="symbol" name="symbol">
            </div>
        </div>
        <div class="form-group">
            <label for="meaning" class="col-sm-2 col-lg-1 control-label">释义</label>
            <div class="col-sm-10 col-lg-11">
                <textarea id="meaning" class="form-control" rows="3" name="meaning"></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-10 col-lg-10" align="center">
                <button type="submit" class="btn btn-info">确定</button>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    $("#addword").addClass("active");
</script>
</html>