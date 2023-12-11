<%@ page import="java.util.Objects" %>
<%@ page import="java.sql.*" %><%--


  Created by IntelliJ IDEA.
  User: ivanachen
  Date: 11/19/23
  Time: 3:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="AdminCheck.jsp"/>

    <title>Partly Update</title>

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
    String adminPassword = "ivanachen";
    String id = request.getParameter("partId");
    String category = request.getParameter("category");
    String name = request.getParameter("name");
    String price = request.getParameter("price");
    int s_price; // variable to hold price as an int. Separate because will need to check nulls with string price
    String description = request.getParameter("description");
    String url = request.getParameter("url");;
    boolean updateSuccessful = false; //Checks to see if the query was executed properly or not.

    PreparedStatement psUpdate = null;
    PreparedStatement psPart = null;
    Connection con = null;
    ResultSet rsPart = null;


    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false",
                admin, adminPassword);

        //First, get the old information of the part
        String queryPart = "SELECT Category,Name,`Sell Price`, Description, URL FROM Part WHERE PartID = " + id;
        System.out.print(queryPart);
        psPart = con.prepareStatement(queryPart);
        rsPart = psPart.executeQuery();

        String queryUpdate = "UPDATE Part SET Category = ?, Name = ?, `Sell Price` = ?, Description = ?, URL = ? WHERE partID =" + id;
        psUpdate = con.prepareStatement(queryUpdate);

        //Loop the old part. If the admin didn't enter anything or it's null, then we will use the
        // old part when we update.
        while (rsPart.next()) {
            //Check to make sure there is no nulls and if the admin enters nothing, then no updates
            //aka, we will use the old part query as part of our update.
            if (category == null || category.isEmpty()) {category = rsPart.getString(1); }
            if (name == null || name.isEmpty()) {name = rsPart.getString(2);}
            if (price == null || price.isEmpty()) {price = String.valueOf(rsPart.getInt(3));}
            if (description == null || description.isEmpty()) {description = rsPart.getString(4);}
            if (url == null || url.isEmpty()) {url = rsPart.getString(5);}
        }

        psUpdate.setString(1, category);
        psUpdate.setString(2, name);
        psUpdate.setString(3, price);
        psUpdate.setString(4, description);
        psUpdate.setString(5, url);

        psUpdate.execute();
        //If we reach here, the update was successful.
        updateSuccessful = true;

    } catch (ClassNotFoundException | SQLException e) {
        System.out.println("error in Update Stock" + e) ;
    }
    finally {
        //close in opposite order bc resources dependecy order
        try { if (psUpdate != null) psUpdate.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (rsPart != null) rsPart.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (psPart != null) psPart.close(); } catch (SQLException e) {e.printStackTrace(); }
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
            out.println("alert('Update was unsuccessful. Try again!');");
            out.println("window.location.href = 'UpdateStock.html'");
            out.println("</script>");
     } %>
</div>

<!-- Handles the button clicks -->
<script>
    function updateAnotherPart() {
        // Redirect the user back to the same page (update page)
        window.location.href = "AdminUpdateStock.html";
    }

    function homePage() {
        // Redirect the user to another page
        window.location.href = "AdminHome.jsp";
    }
</script>
</body>
</html>
