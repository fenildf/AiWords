<%@ page import="dao.BaseUserDao" %>
<%@ page import="dao.BaseUserDaoImpl" %>
<%@ page import="domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../header/meta.jsp" %>
    <title>修改信息</title>

    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/bootstrapValidator.css"/>

    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/bootstrapValidator.js"></script>
</head>
<body>
<%@ include file="../header/nav.jsp" %>
<div class="container">
    <div class="row">
        <!-- form: -->
        <section>
            <div class="page-header">
                <h1>注册</h1>
            </div>
            <div id="alertsuccess1" class="alert alert-success" role="alert" style="display: none"><strong>修改成功</strong></div>
            <div id="alertdanger1" class="alert alert-danger" role="alert" style="display: none"><strong>修改失败:</strong>用户名或密码错误!</div>

            <div class="col-lg-8 col-lg-offset-2">
                <form id="defaultForm" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/register">
                    <%
                        int id = -1;
                        HttpSession httpSession = request.getSession();
                        Object object = httpSession.getAttribute("userID");
                        if (object != null) {
                            id = Integer.parseInt((String) object);
                        }
                        BaseUserDao baseUserDao = new BaseUserDaoImpl();
                        User user = baseUserDao.getUserById(id);
                    %>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">用户名</label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="username" autocomplete="off" value="<%=user.getUsername()%>" readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">原密码</label>
                        <div class="col-lg-5">
                            <input type="password" class="form-control" name="password"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">新密码</label>
                        <div class="col-lg-5">
                            <input type="password" class="form-control" name="newPassword"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">重复新密码</label>
                        <div class="col-lg-5">
                            <input type="password" class="form-control" name="confirmNewPassword"/>
                        </div>
                    </div>

                    <div class="text-center col-lg-9 col-lg-offset-3">
                        <button type="button" class="btn btn-primary" onclick="submit1()">保存</button>
                    </div>
                </form>
            </div>
        </section>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#register").addClass("active");
        $('#defaultForm').bootstrapValidator({
            message: 'This value is not valid',
//        live: 'disabled',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                newPassword: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '密码不少于6位'
                        }
                    }
                },
                confirmNewPassword: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        identical: {
                            field: 'newPassword',
                            message: '两次密码输入不匹配'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '密码不少于6位'
                        }
                    }
                }
            }
        });
    });
</script>
</body>
<script>
    function submit1() {
        $.ajax({
            async: true,
            type:"POST",
            url: "${pageContext.request.contextPath}/useredit",
            data:$("#defaultForm").serialize(),
            dataType: "json",
            success:function (data) {
                if (data.valid) {
                    $("#alertsuccess1").show();
                    setTimeout(function () {
                        $("#alertsuccess1").hide();
                    }, 3000);
                }else {
                    $("#alertdanger1").show();
                    setTimeout(function () {
                        $("#alertdanger1").hide();
                    }, 3000);
                }
            }
        });
    }
</script>
</html>
