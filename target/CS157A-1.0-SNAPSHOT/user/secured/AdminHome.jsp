<%--
  Created by IntelliJ IDEA.
  User: ivanachen
  Date: 11/9/23
  Time: 5:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
</head>
<body>
<% HttpSession session1 = (HttpSession) request.getSession();
 if (session1.getAttribute("admin") == null) {
    response.sendRedirect("AdminLogin.html");
 } %>

<h1>Welcome Admin.</h1>

<a href="<%=request.getContextPath()%>/LogOutServlet">Logout</a>

</body>
</html>
