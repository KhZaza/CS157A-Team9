<%@ page import="java.util.Objects" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: ivanachen
  Date: 11/19/23
  Time: 3:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="AdminCheck.jsp"/>

<html>
<head>
    <title>Parlty Update</title>

    <!--First, check if user incorrectly logged in-->
    <%
        //  HttpSession session = request.getSession(false);
        String errorMessage = Objects.nonNull(session) ? (String) session.getAttribute("errorMessage") : null;
        if(Objects.nonNull(errorMessage)) {
            out.println("<p style = 'color: RED;'>" + errorMessage + "</p>");
            session.removeAttribute("errorMessage"); // need to clear the error message
        }

    %>
    <style>
        /* Style for the container box */
        #container {
            border: 1px solid #ccc;
            padding: 20px;
            margin: 20px;
            text-align: center;
        }

        /* Style for the buttons */
        .action-button {
            margin: 10px;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%
    String db = "team9";
    String admin = "root";
    String adminPassword = "cs157a@zaza";
    String id = request.getParameter("id");
    String category = request.getParameter("category");
    String name = request.getParameter("name");
    String price = request.getParameter("price");
    String description = request.getParameter("description");
    String url = request.getParameter("url");;
    boolean updateSuccessful = false; //Checks to see if the query was executed properly or not.

    PreparedStatement psUpdate = null;
    Connection con = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin, adminPassword);

        String queryUpdate = "UPDATE Part SET Category = ?, Name = ?, `Sell Price` = ?, Description = ?, URL = ? WHERE partID =" + id;
        psUpdate = con.prepareStatement(queryUpdate);

        //Check to make sure there is no nulls and if the admin enters nothing, then no updates
            if (category != null && !category.isEmpty()) {psUpdate.setString(1, category);}
            if (name != null && !name.isEmpty()) {psUpdate.setString(2, name);}
            if (price != null && !price.isEmpty()) {psUpdate.setInt(3, Integer.parseInt(price));}
            if (description != null && !description.isEmpty()) {psUpdate.setString(4, description);}
            if (url!= null && !url.isEmpty()) {psUpdate.setString(5, url);}

            // Execute the update
            psUpdate.executeUpdate();
            //If we reach here, the update was successful.
            updateSuccessful = true;

    } catch (ClassNotFoundException | SQLException e) {
        System.out.println("error in Update Stock" + e) ;
    }
    finally {
        //close in opposite order bc resources dependecy order
        try { if (psUpdate != null) psUpdate.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

%>
<!-- This will be the prompt that we ask the admin after. -->
<div id="container">
    <h2>Update Result</h2>

    <% if (updateSuccessful) { %>
    <p>Successfully updated a part.</p>
    <button class="action-button" onclick="updateAnotherPart()">Update Another Part?</button>
    <button class="action-button" onclick="homePage()">Home Page</button>
    <% } else {
    out.println("<script type=\"text/javascript\">");
            out.println("alert('Incorrect credentials. Try again!');");
            out.println("window.location.href = 'UpdateStock.jsp'");
            out.println("</script>");
     } %>
</div>

<!-- Handles the button clicks -->
<script>
    function updateAnotherPart() {
        // Redirect the user back to the same page (update page)
        window.location.href = "UpdateStock.jsp";
    }

    function homePage() {
        // Redirect the user to another page
        window.location.href = "AdminHome.jsp";
    }
</script>
</body>
</html>
