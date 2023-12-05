<%@ page import="java.sql.*" %>
<%@ page import="javax.xml.transform.Result" %>
<%@ page import="com.mysql.cj.protocol.Resultset" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: ivanachen
  Date: 12/4/23
  Time: 4:15 AM
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
        .cart-container {
            width: 80%;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
        }

        .cart-table th, .cart-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .cart-table th {
            background-color: #f4f4f4;
        }

        .cart-total {
            margin-top: 20px;
            text-align: right;
        }

        .checkout-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            margin: 10px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .checkout-button:hover {
            background-color: #45a049;
        }
        .navbar {
            margin-bottom: 50px;
            border-radius: 0;
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
            <li><a href="delete_after.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>

        </ul>
    </div>
    </div>
</nav>
<%

    String db = "team9";
    String admin = "root";
    String adminPassword = "cs157a@zaza";
    String cartID = "";

    Connection con = null;

    PreparedStatement psAccess = null;
    ResultSet rsAccess = null;
    PreparedStatement  psCartID = null;
    ResultSet rsCartID = null;
    PreparedStatement psData = null;
    PreparedStatement psBecomes = null;
    PreparedStatement psOrder = null;
    ResultSet rs_generatedKeys = null;

    //Keep whatever you want to show in cart, delete the rest.
    List<String> categoryList = new ArrayList<>();
    List<String> nameList = new ArrayList<>();
    List<Integer> priceList = new ArrayList<>();
    List<String> descriptionList = new ArrayList<>();
    List<String> urlList = new ArrayList<>();
    List<Integer> idList = new ArrayList<>();
    List<Integer> qtyList = new ArrayList<>();


    String username = (String) session.getAttribute("user");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin, adminPassword);

        //First, check if user has a cart or not. If doesnt have a cart, then create a cart

        String queryAccess = "SELECT EXISTS(SELECT * FROM Access WHERE Username = ? AND currentCart = 1)";
        psAccess = con.prepareStatement(queryAccess);
        psAccess.setString(1, username);
        rsAccess = psAccess.executeQuery();
        int cartExist = 0; // 0 means doesn't exist
        while (rsAccess.next()) {
            cartExist = rsAccess.getInt(1); // would grab 1 if a current cart exist
        }
        int totalPrice = 0;
        if (cartExist == 1) {
            //1 means it exists so then grab the cartID
            String queryCartID = "SELECT CartID FROM Access WHERE Username = ? AND currentCart=1";
            psCartID = con.prepareStatement(queryCartID);
            psCartID.setString(1, username);
            rsCartID = psCartID.executeQuery();
            while (rsCartID.next()) {
                cartID = rsCartID.getString(1);
            }

            //Grab all the partIDs from AddedTo. Use Inner join to grab all the stuff.
            String queryJoin_PartAdd = "SELECT * from `Added To` INNER JOIN Part ON `Added To`.PartID = Part.PartID WHERE `Added To`.CartID = ?;";

            psData = con.prepareStatement(queryJoin_PartAdd);
            psData.setString(1, cartID);


            ResultSet rsData = psData.executeQuery();

            while (rsData.next()) {
                idList.add(rsData.getInt("PartID"));
                categoryList.add(rsData.getString("Category"));
                nameList.add(rsData.getString("Name"));
                priceList.add(rsData.getInt("Sell Price"));
                descriptionList.add(rsData.getString("Description"));
                urlList.add(rsData.getString("URL"));
                qtyList.add(rsData.getInt("Qty"));
            }

            //Loop to get the total sum of the items
            // aka Multiply sell price by QTY of each item and add them all together
            for (int i = 0; i < idList.size(); i++) {
                totalPrice += priceList.get(i) * qtyList.get(i);
            }
            String queryCartPrice = "UPDATE Cart SET `Total Price` = ? WHERE cartID = ?";
            PreparedStatement psCartPrice = con.prepareStatement(queryCartPrice);
            psCartPrice.setString(2, cartID);
            psCartPrice.setInt(1,totalPrice);
            psCartPrice.execute();
            psCartPrice.close();

        }

        out.println("<div class='cart-container'>");
        out.println("<h2>Your Cart</h2>");
        out.println("<table class='cart-table'>");
        out.println("<thead>");
        out.println("<tr>");
        out.println("<th>Item</th>");
        out.println("<th>Price</th>");
        out.println("<th>Quantity</th>");
        out.println("<th>Total</th>");
        out.println("</tr>");
        out.println("</thead>");
        out.println("<tbody>");

        for (int i = 0; i < nameList.size(); i++) {
            out.println("<tr>");
            out.println("<td>" + nameList.get(i) + "</td>");
            out.println("<td>$" + priceList.get(i) + "</td>");
            out.println("<td>" + qtyList.get(i) + "</td>");
            out.println("<td>$" + (priceList.get(i) * qtyList.get(i)) + "</td>");
            out.println("<td><button type='submit' class='checkout-button'>Delete</button></td>");
            out.println("</tr>");
        }

        out.println("</tbody>");
        out.println("</table>");
        out.println("<div class='cart-total'>");
        out.println("<p>Total Price: $" + totalPrice + "</p>");
        out.println("<form method='post' action='Checkout.html'>");
        out.println("<a href='Checkout.html?CartID=" + cartID + "' class='checkout-button'>Submit Order</a>");
        out.println("</form>");
        out.println("</div>");
        out.println("</div>");


        //First need to create an orderID with that customerID
        String queryOrder = "INSERT INTO `ORDER`(CustomerID) VALUES(?)";
        psOrder = con.prepareStatement(queryOrder, Statement.RETURN_GENERATED_KEYS);
        psOrder.setString(1, username);

        int affectedRows = psOrder.executeUpdate();

        if (affectedRows > 0) { // checks if anything was inserted or not
            // Retrieve the generated keys
            rs_generatedKeys = psOrder.getGeneratedKeys(); // get the pk
            if (rs_generatedKeys.next()) {
                // Access the auto-incremented primary key value
                int generatedKey = rs_generatedKeys.getInt(1);

                //Now insert into Becomes.
                String queryBecomes = "INSERT INTO becomes(CartID, OrderID, Order_Date) VALUES(?, ?, ?)";
                LocalDate currentDate = LocalDate.now();
                String currentDateStr = currentDate.toString();

                psBecomes = con.prepareStatement(queryBecomes);
                psBecomes.setString(1, cartID);
                psBecomes.setInt(2, generatedKey);
                psBecomes.setString(3, currentDateStr); // This should work now


                psBecomes.execute();
                psBecomes.close();
                rs_generatedKeys.close();
            }


        }


    } catch (ClassNotFoundException | SQLException e) {
        out.println("error in delete-after" + e);
    }
    finally{

        try { if (psData != null) psData.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if ( rsCartID != null)  rsCartID.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if ( psCartID != null)  psCartID.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if ( rsAccess != null)  rsAccess.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if ( psAccess != null)  psAccess.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (con != null) con.close(); } catch (SQLException e) {e.printStackTrace(); }

    }

%>

</body>
</html>
