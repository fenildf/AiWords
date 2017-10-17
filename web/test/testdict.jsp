<%@ page import="dict.DictReader" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    DictReader dictReader = new DictReader(request.getSession().getServletContext()
            .getRealPath("/WEB-INF/dict/ViconEnglish2Chinese.xml"));
    int i = 0;
    for (Map.Entry<String, String> entry : dictReader.getMap().entrySet()) {
        if (++i == 10900) {
            break;
        }
%>
<h4><%=entry.getKey()%>
</h4>
<h5><%=entry.getValue()%>
</h5>
<%
    }
%>
</body>
</html>
