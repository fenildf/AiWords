<%@ page import="dao.BaseWordDao" %>
<%@ page import="dao.BaseWordDaoImpl" %>
<%@ page import="domain.Word" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../header/meta.jsp" %>
    <title>Title</title>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../header/nav.jsp" %>
<%
    int id = Integer.parseInt(request.getParameter("wid"));
    BaseWordDao base = new BaseWordDaoImpl();
    Word word = base.getWordById(id);
    if (word == null) {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>
<div id="alert1" style="display:none" class="alert alert-success" role="alert"></div>
<div class="container-fluid">
    <form class="form-horizontal" id="form1" method="post">
        <div class="form-group">
            <label for="word" class="col-lg-1 col-sm-2 control-label">单词</label>
            <div class="col-sm-10 col-lg-11">
                <input type="text" class="form-control" id="word" name="word" value="<%=word.getWord()%>">
            </div>
        </div>
        <div class="form-group">
            <label for="symbol" class="col-lg-1 col-sm-2 control-label">音标</label>
            <div class="col-sm-10 col-lg-11">
                <input type="text" class="form-control" id="symbol" name="symbol" value="<%=word.getSymbol()%>">
            </div>
        </div>
        <div class="form-group">
            <label for="meaning" class="col-sm-2 col-lg-1 control-label">释义</label>
            <div class="col-sm-10 col-lg-11">
                <textarea id="meaning" class="form-control" rows="3" name="meaning"><%=word.getMeaning()%></textarea>
            </div>
        </div>
    </form>
    <div class="dropup" align="center">
        <div class="btn-group">
            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                编辑
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                <li><a onclick="save1()">保存</a></li>
                <li><a onclick="delete1()">删除</a></li>
                <li><a onclick="exit1()">退出</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
<script>
    function save1() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/update",
            data:"id=<%=id%>&uid=<%=word.getUid()%>&word="+$("#word").val()+"&symbol="+$("#symbol").val()+"&meaning="+$("#meaning").val(),
            success:function () {
                $("#alert1").html("修改成功!");
                $("#alert1").show();
                setTimeout(function () {
                    $("#alert1").hide();
                }, 3000);
            }
        });
    }
    function delete1() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/delete",
            data:"wid=<%=id%>",
            success:function () {
                $("#alert1").html("删除成功!");
                $("#alert1").show();
                setTimeout(function () {
                    window.location.href = "../";
                }, 1000);
            }
        });
    }
    function exit1() {
        window.location.href = "../";
    }
</script>
</html>
