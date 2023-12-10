<%--
  Created by IntelliJ IDEA.
  User: ivanachen
  Date: 11/9/23
  Time: 5:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="AdminCheck.jsp"/>

<html>
<head>
    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #333333;
        }
        .admin-homepage {
            width: 80%;
            margin: 0 auto;
        }
        .admin-homepage h1 {
            text-align: center;
            color:white;
        }
        .admin-homepage a {
            display: block;
            background-color: #3498db;
            color: #212529;
            padding: 12px;
            margin-bottom: 10px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .admin-homepage a:hover {
            background-color: #3a71a9;
            color: #fff;
        }
        .person-container {
            display:block;
            text-align: center;
            background-color:#3498db;
            padding: 10px;
            border-radius:5px;
            color:white;
            width: 80%;
            margin: 0 auto;
        }
        .person-container i{
            margin:0.5%;
            font-size:2em;
        }


    </style>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>
<body>
<div class="admin-homepage">
    <h1>Admin Homepage</h1>
    <a href="<%=request.getContextPath()%>/LogOutServlet">Logout</a>
    <a href="AddStock.html">Add Stock</a>
    <a href ="DeleteStock.html">Remove Stock</a>
    <a href = "AdminUpdateStock.html">Update Stock</a>
    <a href = "AdminCatalog.jsp">View Parts</a>
    <a href = "AdminFeedbackView.jsp">View Feedback</a>
    <a href = "AdminViewUsers.jsp">View users</a>
    <a href = "AdminOrdersHistory.jsp">Order History</a>



</div>
<%
    String db = "team9";
    String admin = "root";
    String adminPassword = "cs157a@zaza";

    PreparedStatement psCookies = null;
    ResultSet rs_Cookies = null;
    Connection con = null;
    int users_logged_in = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin, adminPassword);

        String queryCookies = "SELECT COUNT(*) FROM Cookies";

        psCookies = con.prepareStatement(queryCookies);

        rs_Cookies = psCookies.executeQuery();
        if(rs_Cookies.next()){
            users_logged_in = rs_Cookies.getInt(1);
        }
        out.print("<div class='person-container'>");
        out.print("<p> Users Logged In: ");
        //Loop based on how many users are online
        for(int i = 0; i<users_logged_in;i++) {
            out.print("<i class='fa fa-solid fa-car' title='User'></i>");
        }
        out.print("</p></div>");




    } catch (ClassNotFoundException | SQLException e) {
        System.out.println("error in AdminHome :(");
    }
    finally {
        //close in opposite order bc resources dependecy order
        try { if ( rs_Cookies!= null) rs_Cookies.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (psCookies != null) psCookies.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>



</body>
</html>
