<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../header/meta.jsp" %>
    <title>登录</title>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../header/usernav.jsp" %>
<div class="container" id="jum">
    <div class="row">
        <section>
            <div class="page-header">
                <h1>登录</h1>
            </div>
            <div id="alertsuccess1" class="alert alert-success" role="alert" style="display: none">
                <strong>登录成功:</strong>浏览器将自动跳转...
            </div>
            <div id="alertdanger1" class="alert alert-danger" role="alert" style="display: none"><strong>登录失败:</strong>用户名或密码错误!
            </div>
            <form id="formLogin" action="${pageContext.request.contextPath}/login" method="post" class="form-horizontal"
                  role="form">
                <div class="form-group">
                    <label for="usernamei" class="col-sm-1 control-label">用户名:</label>
                    <div class="col-sm-10">
                        <input type="text" name="username" class="form-control" id="usernamei" placeholder="请输入账号">
                    </div>
                </div>
                <br/>
                <br/>
                <div class="form-group">
                    <label for="password" class="control-label col-sm-1">密码:</label>
                    <div class="col-sm-10">
                        <input type="password" name="password" class="form-control" id="password" placeholder="请输入用户名">
                    </div>
                </div>
                <br/>
                <%--<a href="javascript:void(0)" class="btn btn-default btn-lg" onclick="img1()">看不清,换一张</a>--%>
                <%--<br/>--%>
                <%--<br/>--%>
                <%--<div class="form-group">--%>
                <%--<label for="codein" class="control-label col-sm-1">验证码:</label>--%>
                <%--<div class="col-sm-10">--%>
                <%--<input type="text" class="form-control " name="code" id="codein">--%>
                <%--</div>--%>
                <%--</div>--%>
                <br/>
                <div class="text-center">
                    <input id="button1" type="button" class="btn btn-info btn-lg" value="登录" onclick="submit1()"/>
                </div>
            </form>
        </section>
    </div>
</div>
</body>
<script>
    $("#login").addClass("active");
    function submit1() {
        $("#button1")[0].value = "登录中...";
        $.ajax({
            async: true,
            type: "POST",
            url: "${pageContext.request.contextPath}/login",
            data: $("#formLogin").serialize(),
            dataType: "json",
            success: function (data) {
                $("#button1")[0].value = "登录";
                var speed = 300;
                if (data.valid) {
//                    $("#alertsuccess1").show();
                    $("#alertsuccess1").slideToggle(speed);
                    setTimeout(function () {
//                        $("#alertsuccess1").hide();
                        $("#alertsuccess1").slideToggle(speed);
                    }, 3000);
                    setTimeout(function () {
                        window.location.href = "${pageContext.request.contextPath}/word/";
                    }, 200);
                } else {
//                    $("#alertdanger1").show();
                    $("#alertdanger1").slideToggle(speed);
                    setTimeout(function () {
//                        $("#alertdanger1").hide();
                        $("#alertdanger1").slideToggle(speed);
                    }, 3000);
                }
            }
        });
    }
</script>
</html>