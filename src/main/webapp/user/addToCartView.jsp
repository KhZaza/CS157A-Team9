<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="at.favre.lib.crypto.bcrypt.BCrypt" %>
<%@ page import="java.util.Random" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;
                                            charset=UTF-8">
    <title>Partly</title>
</head>
<body>

<%
    //Grab from url
    String s_partID = request.getParameter("partID");
    String s_qty = request.getParameter("quantity");
    int partID = Integer.parseInt(s_partID);
    int qty = Integer.parseInt(s_qty);

    String username = (String) session.getAttribute("user");


    String db = "team9";
    String admin = "root";
    String adminPassword = "ivanachen";
    String cartID = "";



    PreparedStatement psAdd = null;
    PreparedStatement psAccess = null;
    PreparedStatement psCart = null;
    PreparedStatement ps_newAccess = null;
    PreparedStatement psCartID = null;
    ResultSet rsAccess = null;
    ResultSet rsCartID = null;
    Connection con = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin,adminPassword);

        //First, check if user has a cart or not. If doesnt have a cart, then create a cart

        String queryAccess = "SELECT EXISTS(SELECT * FROM Access WHERE Username = ? AND currentCart = 1)";
        psAccess = con.prepareStatement(queryAccess);
        psAccess.setString(1, username);
        rsAccess = psAccess.executeQuery();
        int cartExist = 0; // -1 for checking.
        while(rsAccess.next()){
            cartExist = rsAccess.getInt(1);
        }
        if (cartExist == 1){
            //1 means it exists so then grab the cartID
            String queryCartID = "SELECT CartID FROM Access WHERE Username = ? AND currentCart=1";
            psCartID = con.prepareStatement(queryCartID);
            psCartID.setString(1,username);
            rsCartID = psCartID.executeQuery();
            while(rsCartID.next()){
                cartID = rsCartID.getString(1);
            }
            //cartID = resultset from above
        }
        else{
            //Else it doesn't exist, so we want to create a cartID and make it the currentcart (if currentcart = 1)
            //First create a cartID.
            Random rand = new Random();
            int randomNum = rand.nextInt(10000); // random range of 10000.
            cartID = Integer.toString(randomNum);
            String queryCart = "INSERT INTO Cart(CartID) VALUES(?)";
            psCart = con.prepareStatement(queryCart);
            psCart.setString(1,cartID);
            psCart.execute();

            //Now insert this value into Access, currentCart is 1 because it will be our currentCart now.
            String query_newAccess = "INSERT INTO Access(Username,CartID,currentCart) VALUES(?,?,1)";

            ps_newAccess = con.prepareStatement(query_newAccess);
            ps_newAccess.setString(1,username);
            ps_newAccess.setString(2,cartID);

            ps_newAccess.execute();

        }
        //NOT Becomes yet. We will do that when User press the "submit" button in Cart.

        //Now take the Part and add it to the corresponding cartID
        String queryAdd = "INSERT INTO `Added To`(PartID, CartID, Qty) VALUES(?,?,?)";
        psAdd = con.prepareStatement(queryAdd);
        psAdd.setInt(1,partID);
        psAdd.setString(2,cartID);
        psAdd.setInt(3,qty);

        psAdd.execute();



    } catch (ClassNotFoundException | SQLException e) {
        out.println("error in addtocartview" + e);
    }
    finally{
        try { if (psAdd != null) psAdd.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if ( ps_newAccess != null)  ps_newAccess.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if ( psCart != null)  psCart.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if ( ps_newAccess != null)  ps_newAccess.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if ( rsCartID != null)  rsCartID.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if ( psCartID != null)  psCartID.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (con != null) con.close(); } catch (SQLException e) {e.printStackTrace(); }
    }
%>
<script>
   alert("Successfully added to cart! Redirecting back to Catalog page.");
   window.location.href = " http://localhost:8080/user/Catalog.jsp";

</script>

</body>

</html>

