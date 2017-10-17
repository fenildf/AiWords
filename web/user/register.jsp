<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <%@include file="../header/meta.jsp" %>
    <title>注册</title>

    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/bootstrapValidator.css"/>

    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/bootstrapValidator.js"></script>
</head>
<body>
<%@ include file="../header/usernav.jsp" %>
<div class="container">
    <div class="row">
        <!-- form: -->
        <section>
            <div class="page-header">
                <h1>注册</h1>
            </div>

            <div class="col-lg-8 col-lg-offset-2">
                <form id="defaultForm" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/register">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">用户名</label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="username" autocomplete="off"/>
                        </div>
                    </div>

                    <!--<div class="form-group">-->
                        <!--<label class="col-lg-3 control-label">Email</label>-->
                        <!--<div class="col-lg-5">-->
                            <!--<input type="text" class="form-control" name="email[]" autocomplete="off"/>-->
                        <!--</div>-->
                    <!--</div>-->

                    <div class="form-group">
                        <label class="col-lg-3 control-label">密码</label>
                        <div class="col-lg-5">
                            <input type="password" class="form-control" name="password"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">重复密码</label>
                        <div class="col-lg-5">
                            <input type="password" class="form-control" name="confirmPassword"/>
                        </div>
                    </div>

                        <div class="text-center col-lg-9 col-lg-offset-3">
                            <button type="submit" class="btn btn-primary">提交</button>
                        </div>
                </form>
            </div>
        </section>
        <!-- :form -->
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
                username: {
                    message: '无效的用户名',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 4,
                            max: 30,
                            message: '用户名最少4位,不超过30位'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '用户名只能由数字,字母和下划线组成'
                        },
                        remote: {
                            type: 'POST',
                            url: '${pageContext.request.contextPath}/userRegisterConfirm',
                            message: '用户名已存在',
                            delay: 500
                        }
                    }
                },
//                'email[]': {
//                    validators: {
//                        notEmpty: {
//                            message: 'Email不能为空'
//                        },
//                        emailAddress: {
//                            message: 'Email输入不合法'
//                        }
//                    }
//                },
                password: {
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
                confirmPassword: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        identical: {
                            field: 'password',
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
</html>
