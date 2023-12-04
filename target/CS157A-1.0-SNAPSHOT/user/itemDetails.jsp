<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ivanachen
  Date: 11/29/23
  Time: 11:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Partly</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .navbar {
            margin-bottom: 50px;
            border-radius: 0;
        }
        .item-details {
            border: 1px solid #ddd;
            padding: 20px;
            margin-top: 20px;
            border-radius: 5px;
            background-color: #f9f9f9;
            max-width: 500px;
            margin: 20px auto;
        }
        .item-details img {
            max-width: 100%;
            height: auto;
            margin-bottom: 15px;
        }
        .item-details h2 {
            color: #333;
            margin-bottom: 10px;
        }
        .item-details p {
            color: #666;
        }
        .item-details form {
            margin-top: 15px;
        }
        .item-details button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }
        .item-details button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="Catalog.jsp">Catalog</a>
            <%
                HttpSession sess2 = (HttpSession) request.getSession();
                String usernameid = (String)sess2.getAttribute("user");
                out.println("<a class=\"navbar-brand\" >Hi, " + usernameid + "</a>");
            %>


        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="Account.html"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
            <li><a href="Home.html"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
            <li><a href="Cart2.html"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>

        </ul>
    </div>
    </div>
</nav>
<%
    String db = "team9";
    String admin = "root";
    String adminPassword = "ivanachen";

    String partID = request.getParameter("partID");

    try {
        // Database connection setup
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", admin, adminPassword);

        // Query to get item details
        String query = "SELECT * FROM part WHERE PartID = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, Integer.parseInt(partID));
        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            // Displaying the item details
            out.println("<div class='item-details'>");
            out.println("<img src='" + rs.getString("URL") + "' alt='Item Image' />");
            out.println("<h2>" + rs.getString("Name") + "</h2>");
            out.println("<p>Price: $" + rs.getInt("Sell Price") + "</p>");
            out.println("<p>" + rs.getString("Description") + "</p>");

            // Add to Cart form
            out.println("<form action='addToCartView.jsp' method='post'>");
            out.println("<input type='number' name='quantity' value='1' min='1'/>");
            out.println("<input type='hidden' name='partID' value='" + partID + "'/>");
            out.println("<button type='submit'>Add to Cart</button>");
            out.println("</form>");

            out.println("</div>");
        }

        // Close resources
        rs.close();
        ps.close();
        con.close();

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>



</body>
</html>