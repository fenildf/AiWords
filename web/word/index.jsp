<%@ page import="dao.BaseWordDao" %>
<%@ page import="dao.BaseWordDaoImpl" %>
<%@ page import="domain.Word" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@include file="../header/meta.jsp" %>

    <title>AiWords</title>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../header/nav.jsp" %>
<%
    response.sendRedirect(request.getContextPath() + "/wordlist");
%>
<div class="container-fluid">
    <table id="mytable" class="table table-striped table-hover">
        <tr>
            <td class="wordnum">序号</td>
            <td class="wordword">单词</td>
            <td class="wordsymbol">音标</td>
            <td class="wordmeaning" style="display: none">释义</td>
            <%--<td class="wordmeaning">释义</td>--%>
        </tr>
        <%
            int id = -1;
            HttpSession httpSession = request.getSession();
            Object object = httpSession.getAttribute("userID");
            if (object != null) {
                id = Integer.parseInt((String) object);
            }
            BaseWordDao baseWordDao = new BaseWordDaoImpl();
            List<Word> words = baseWordDao.getWordsByUserId(id);
            int i = 1;
            request.setAttribute("words", words);
        %>
        <c:if test="<%=words!=null%>">
            <c:forEach var="word" items="${words}">
                <tr onclick="click1(${word.getId()})">
                    <td class="wordnum"><%=(i++)%>
                    </td>
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