<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: ivanachen
  Date: 11/21/23
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Partly</title>
</head>
<body>

<%
    String db = "team9";
    String admin = "root";
    String adminPassword = "cs157a@zaza";
    boolean feedbackSuccess = false;

    PreparedStatement psFeedback = null;
    Connection con = null;
    ResultSet rsData = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin, adminPassword);

        //Only let the admin view one feedback at a time.
        String queryFeedback = "SELECT * FROM Feedback LIMIT 1";

        psFeedback = con.prepareStatement(queryFeedback);
        rsData = psFeedback.executeQuery();

        while (rsData.next()) {
            out.println("Subject: " + rsData.getString("Subject"));
            out.println("Body: " + rsData.getString("Body"));
        }
        //out.println("<button class='action-button' onclick='deleteFeedback()'>Delete</button>");

        feedbackSuccess = true;

    } catch (ClassNotFoundException | SQLException e) {
        System.out.println("error in Delete Stock" + e) ;
    }
    finally {
        //close in opposite order bc resources dependecy order
        try { if (rsData != null) rsData.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (psFeedback != null) psFeedback.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
<div id="container">
    <h2>Admin Feedback</h2>

    <% if (feedbackSuccess) { %>
    <p>Successfully updated a part.</p>
    <button class="action-button" onclick="nextFeedback()">Next Feedback</button>
    <button class="action-button" onclick="homePage()">Home Page</button>
    <% } else {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Incorrect credentials. Try again!');");
        out.println("window.location.href = 'AdminFeedback.jsp'");
        out.println("</script>");
    } %>
</div>

<!-- Handles the button clicks -->
<script>
    function nextFeedback() {
        // Redirect the user back to the same page (update page)
        window.location.href = "AdminFeedback.jsp";
    }

    function homePage() {
        // Redirect the user to another page
        window.location.href = "AdminHome.jsp";
    }
</script>

</body>
</html>
