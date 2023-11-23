<%--
  Created by IntelliJ IDEA.
  User: ivanachen
  Date: 11/9/23
  Time: 5:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="AdminCheck.jsp"/>

<html>
<head>
    <title>Admin</title>

</head>
<body>
<h1>Welcome Admin.</h1>

<a href="<%=request.getContextPath()%>/LogOutServlet">Logout</a>
<a href="AddStock.html">Add Stock</a>
<a href ="DeleteStock.html">Remove Stock</a>
<a href = "UpdateStock.html">Update Stock</a>

</body>
</html>
