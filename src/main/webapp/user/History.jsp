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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .navbar {
            border-radius: 0; /* Remove border radius for a flat design */
            margin-bottom: 0; /* Remove default bottom margin */
        }
        .navbar .container-fluid {
            padding-left: 0; /* Remove padding for full width */
            padding-right: 0; /* Remove padding for full width */
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
            <a class="navbar-brand" style="margin-left: 2px" href="#">Partly</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="LogOut.html"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
                <li><a href="Cart.html"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
            </ul>
        </div>
    </div>
</nav>
<%

    String db = "team9";
    String admin = "root";
    String adminPassword = "ivanachen";

    PreparedStatement psCount = null; //Count number of total orders a customer has
    PreparedStatement psPart = null;
    PreparedStatement psAll = null; // query it all because of innerjoin
    Connection con = null;
    ResultSet rsData = null;
    ResultSet rsCount = null;
    String user = (String)session.getAttribute("user");
    int numOrders = 0;
    List<Integer> partIDList = new ArrayList<>();
    List<Integer> qtyList = new ArrayList<>();
    List<Integer> orderIDList = new ArrayList<>();
    List<String> shippingList = new ArrayList<>();
    List<Integer> totalPriceList = new ArrayList<>();
    List<Integer> partPriceList = new ArrayList<>();
    List<String> urlList = new ArrayList<>();
    int countRows = 0; // Using this instead of order#

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin, adminPassword);
    /*
        //First, See how many past orders a customer has.
        String queryCount = """
                SELECT  Count(*)
                FROM customer
                INNER JOIN `order` o ON o.CustomerID = Username
                WHERE Username = ?""";

        psCount = con.prepareStatement(queryCount);
        psCount.setString(1,user);
        rsCount = psCount.executeQuery();
        while(rsCount.next()){
            numOrders = rsCount.getInt(1); // not using for now but this counts the Total order num user has
        }

     */
       String queryData = "SELECT  \n" +
               "    p.PartID AS PartID,\n" +
               "    ad.QTY,\n" +
               "    o.OrderID,\n" +
               "    o.`shipping address`,\n" +
               "    p.`Sell Price`,\n" +
               "    ca.`Total Price`,\n" +
               "    p.url\n" +
               "FROM Customer c\n" +
               "INNER JOIN Access a ON c.Username = a.Username\n" +
               "INNER JOIN Cart ca ON a.CartID = ca.CartID\n" +
               "INNER JOIN Becomes b ON ca.CartID = b.CartID\n" +
               "INNER JOIN `order` o ON b.OrderID = o.OrderID\n" +
               "INNER JOIN `Added to` ad ON ca.CartID = ad.CartID\n" +
               "INNER JOIN Part p ON ad.PartID = p.PartID\n" +
               "WHERE c.username = ?\n" +
               "ORDER BY OrderID DESC;\n";


        psAll = con.prepareStatement(queryData);
        psAll.setString(1,user);
        rsData = psAll.executeQuery();
        while(rsData.next()){
            //Put everything into lists to print
            partIDList.add(rsData.getInt("PartID"));
            qtyList.add(rsData.getInt("QTY"));
            orderIDList.add(rsData.getInt("OrderID"));
            shippingList.add(rsData.getString("shipping address"));
            partPriceList.add(rsData.getInt("sell price"));
            totalPriceList.add(rsData.getInt("Total Price")); // currently wrong in db since cart not work
            urlList.add(rsData.getString("url"));
            countRows++;
        }

        if(countRows == 0){
            out.println("<div class=\"container\">\n" +
                    "    <h1 class=\"my-3\">No history available</h1>\n" +
                    "</div>");
        }

        out.println("<div class=\"container\">\n" +
                "    <h1 class=\"my-3\">Complete Order History</h1>");
        //Print everything out using a loop, using the number of rows
        for(int i = 0; i < countRows; i++){
            out.println( "<div class=\"card mb-3\">\n" +
                    "        <div class=\"card-header bg-primary text-white\">\n" +
                    "            Order " + orderIDList.get(i) + "-" +
                    "Shipping Address: " + shippingList.get(i) + "-" +
                    "        </div>\n" +
                    "        <ul class=\"list-group list-group-flush\">\n" +
                    "            <li class=\"list-group-item\">\n" +
                    "                <img src= \"" + urlList.get(i) + "\"" +
                    "alt=\"Item 1\" " +
                    "style=\"width:100px;\">\n" +
                    "                Item " + partIDList.get(i) + " - $" +
                    partPriceList.get(i) + "- QTY: " + qtyList.get(i) +
                    "  </li> </ul>  </div>");
        }
        out.println("</div>"); // container


    } catch (ClassNotFoundException | SQLException e) {
        System.out.println("error in Update Stock" + e) ;
    }
    finally {
        //close in opposite order bc resources dependecy order
        try { if (rsData != null) rsData .close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (psAll != null) psAll.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>


</body>
</html>
