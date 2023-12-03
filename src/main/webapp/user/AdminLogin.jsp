<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: ivanachen
  Date: 11/17/23
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../styles.css">
    <link rel="stylesheet" href="AdminLogin.css">


    <title>Partly</title>
</head>
<body onload = "hamburgerMenu();">
<!-- NavBar -->
<header >
    <h1> <a href="../index.html" style="width: 20%; text-decoration: none; color: #00cfff;">Partly</a></h1>
    <div class="hamburger">
        <div class="line"></div>
        <div class="line"></div>
        <div class="line"></div>
    </div>
    <nav class="nav-bar">

    </nav>
</header>

<!--First, check if user incorrectly logged in-->
<%
  //  HttpSession session = request.getSession(false);
    String errorMessage = Objects.nonNull(session) ? (String) session.getAttribute("errorMessage") : null;
    if(Objects.nonNull(errorMessage)) {
        out.println("<p style = 'color: RED;'>" + errorMessage + "</p>");
        session.removeAttribute("errorMessage"); // need to clear the error message
    }

%>

<div class="bg-img">
<div class="login-box">
    <h2>Admin Login</h2>
    <form action ="AdminServlet" method = "POST">
        <div class="user-box">
            <input type="text" id="username" name="username" required><br>
            <label for="username">Username:</label>
        </div>
        <div class="user-box">
            <input type="password" id="password" name="password" required><br>
            <label for="password">Password:</label>
        </div>
        <a>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <input type="submit" value="Login">

        </a>
    </form>
</div>
</div>
</body>
</html>
