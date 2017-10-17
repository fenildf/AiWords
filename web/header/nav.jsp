<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container" style="margin-bottom: 66px">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">AiWords</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li id="wordlist"><a href="${pageContext.request.contextPath}/">单词列表 <span class="sr-only">(current)</span></a></li>
                    <li id="addword"><a href="${pageContext.request.contextPath}/word/add.jsp">添加单词</a></li>
                    <li id="wordListSetting" class="dropdown" style="display: none">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">选项<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">显示</li>
                            <li><a onclick="wordnum1()">单词序号</a></li>
                            <li><a onclick="wordword1()">单词</a></li>
                            <li><a onclick="wordsymbol1()">音标</a></li>
                            <li><a onclick="wordmeaning1()">释义</a></li>
                        </ul>
                    </li>
                </ul>
                <form id="searchwords" style="display: none" class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">用户<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">用户</li>
                            <li><a href="${pageContext.request.contextPath}/user/edituser.jsp">编辑</a></li>
                            <li><a href="${pageContext.request.contextPath}/userexit">退出登录</a></li>
                            <%--<li><a href="#">Something else here</a></li>--%>
                            <%--<li role="separator" class="divider"></li>--%>
                            <%--<li><a href="#">Separated link</a></li>--%>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>