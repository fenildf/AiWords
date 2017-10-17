<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../header/meta.jsp" %>
    <title>注册</title>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../header/usernav.jsp" %>
<div class="jumbotron" id="jum">
    <div class="container">
        <h2 class="text-center">申请用户</h2>
        <hr/>
        <form class="form-horizontal" method="post" id="registerForm" action="${pageContext.request.contextPath}/register">
            <div class="form-group">
                <label class="control-label col-sm-1" for="username">用户名:</label>
                <div class="col-sm-10">
                    <input type="text" required="required" id="username" name="username" class="form-control" placeholder="请输入用户名">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-1" for="password1">密码:</label>
                <div class="col-sm-10">
                    <input type="password" id="password1" name="password" class="form-control" placeholder="请输入密码">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-1" for="password2">再次输入密码:</label>
                <div class="col-sm-10">
                    <input type="password" id="password2" name="password" class="form-control" placeholder="再次输入密码">
                </div>
            </div>
            <br>
        </form>
        <div class="text-center">
            <h4 style="color: #ac2925" id="response"></h4>
        </div>
        <div class="text-center">
            <div class="col-sm-5"></div>
            <input type="button" class="btn btn-primary col-sm-2" onclick="check1()" value="提交"/>
        </div>
    </div>
</div>
</body>
<script>
    $("#register").addClass("active");
    function check1() {
        $("#registerForm")[0].submit();
    }
</script>
</html>
