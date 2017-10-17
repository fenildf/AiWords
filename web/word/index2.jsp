<%@ page import="dao.BaseWordDao" %>
<%@ page import="dao.BaseWordDaoImpl" %>
<%@ page import="domain.Word" %>
<%@ page import="java.util.List" %>
<%@ page import="domain.Page" %>
<%@ page import="java.util.StringJoiner" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <title>AiWords</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<body>
<%@ include file="../header/nav.jsp" %>
<div class="container-fluid">
    <table id="mytable" class="table table-striped table-hover">
        <tr>
            <td class="wordword">单词</td>
            <td class="wordsymbol">音标</td>
            <td class="wordmeaning" style="display: none">释义</td>
            <%--<td class="wordmeaning">释义</td>--%>
        </tr>
        <%
            List<Word> words = (List<Word>) request.getAttribute("words");
            request.setAttribute("words", words);
            Page page1 = (Page) request.getAttribute("page");
            int maxPage = Integer.parseInt((String) request.getAttribute("maxpage"));
        %>
        <c:if test="<%=words!=null%>">
            <c:forEach var="word" items="${words}">
                <tr onclick="click1(${word.getId()})">
                    <td class="wordword">${word.getWord()}
                    </td>
                    <td class="wordsymbol">${word.getSymbol()}
                    </td>
                    <td class="wordmeaning" style="display: none">${word.getMeaning()}
                    </td>
                        <%--<td class="wordmeaning"><%=word.getMeaning()%>--%>
                        <%--</td>--%>
                </tr>
            </c:forEach>
        </c:if>
    </table>
</div>
<div class="container text-center">
    <nav>
        <ul class="pagination">
            <%
                if (page1.getPage() > 1) {
            %>
            <li>
                <a href="${pageContext.request.contextPath}/wordlist?page=<%=page1.getPage()-1%>" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <%
                }
            %>
            <li><a href="${pageContext.request.contextPath}/wordlist?page=<%=page1.getPage()%>">第<%=page1.getPage()%>
                页</a></li>
            <%--<li><a href="#">2</a></li>--%>
            <%--<li><a href="#">3</a></li>--%>
            <%--<li><a href="#">4</a></li>--%>
            <%--<li><a href="#">5</a></li>--%>
            <%
                if (page1.getPage() < maxPage) {
            %>
            <li>
                <a href="${pageContext.request.contextPath}/wordlist?page=<%=page1.getPage()+1%>" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
            <%
                }
            %>
        </ul>
    </nav>
</div>
</body>
<script>
    $("#wordlist").addClass("active");
    //    $("#searchwords").show();
    $("#wordListSetting").show();
    function click1(i) {
        window.location.href = "${pageContext.request.contextPath}/word/update.jsp?wid=" + i;
    }
    function wordnum1() {
        $(".wordnum").toggle();
    }
    function wordword1() {
        $(".wordword").toggle();
    }
    function wordmeaning1() {
        $(".wordmeaning").toggle();
    }
    function wordsymbol1() {
        $(".wordsymbol").toggle();
    }
</script>
</html>