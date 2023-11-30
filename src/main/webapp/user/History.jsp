<%@ page import="java.sql.*" %><%--
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
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

<div class="container">
    <h1 class="my-3">Order History</h1>
    <div class="card mb-3">
        <div class="card-header bg-primary text-white">
            Order 1: (Shipping address used, Status, Total Price)
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">
                <img src="item1.jpg" alt="Item 1" style="width:100px;">
                Item 1 - $20.00 - Quantity: 2
            </li>
            <li class="list-group-item">
                <img src="item2.jpg" alt="Item 2" style="width:100px;">
                Item 2 - $15.00 - Quantity: 1
            </li>
        </ul>
    </div>
    <div class="card mb-3">
        <div class="card-header bg-primary text-white">
            Order 2: (Shipping address used, Status, Total Price)
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">
                <img src="item3.jpg" alt="Item 3" style="width:100px;">
                Item 3 - $30.00 - Quantity: 1
            </li>
            <li class="list-group-item">
                <img src="item4.jpg" alt="Item 4" style="width:100px;">
                Item 4 - $25.00 - Quantity: 3
            </li>
        </ul>
    </div>
</div>


</body>
</html>
