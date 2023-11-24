<%--
  Created by IntelliJ IDEA.
  User: ivanachen
  Date: 11/19/23
  Time: 10:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Partly</title>

</head>
<body>
<%
    /*
    This file will just hold the below implementation to check if user is an admin or not.
    It is in another file so that we can just access it in our jsp AND html files instead of just
    having it repeat in all our files.
     */

    HttpSession session1 = (HttpSession) request.getSession();
    if (session1.getAttribute("admin") == null) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('NOTICE: Only Admin can access!');");
        out.println(" window.location.replace('http://localhost:8080/user/AdminLogin.jsp')");
        out.println("</script>");
    }
%>

</body>
</html>
