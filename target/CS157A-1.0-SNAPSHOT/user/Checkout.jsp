<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %><%--
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
    //Always grab this information!
    String fName = request.getParameter("fName");
    String lName = request.getParameter("lName");
    String email = request.getParameter("email");
    String cartID = request.getParameter("CartID"); // given in url
    String user = (String) session.getAttribute("user");
    PreparedStatement psBecomes = null;
    String adr = " ";
    String city = "";
    String state = "";
    String zip = "";

    //See if the 'checkbox' is checked or not
    String checkboxValue = request.getParameter("same_adr");
    boolean notChecked = (checkboxValue == null); // true if not checked, false if checked
    ResultSet rs_generatedKeys = null;

    if(notChecked){
        adr = request.getParameter("ship_adr");
        city = request.getParameter("ship_city");
        state = request.getParameter("ship_state");
        zip  = request.getParameter("ship_zip");
    }
    else{
        adr = request.getParameter("adr");
        city = request.getParameter("city");
        state = request.getParameter("state");
        zip  = request.getParameter("zip");
    }

    //We aren't going to do anything with the cc information since security risk :(.

    PreparedStatement psOrder = null;
    PreparedStatement psView = null;
    Connection con = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin, adminPassword);

        //First need to create an orderID with that customerID
        String queryOrder = "INSERT INTO `order` (`Contact Info`, `Shipping Address`, CustomerID) VALUES (?,?,?)";
        psOrder = con.prepareStatement(queryOrder, Statement.RETURN_GENERATED_KEYS);
        psOrder.setString(1,email);
        String shipAdr = adr + ", " + city + ", " + state + " " + zip;
        psOrder.setString(2,shipAdr);
        psOrder.setString(3,user);

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

                String queryView = "INSERT INTO `view`(Username,OrderID) VALUES('?',?)";
                psView = con.prepareStatement(queryView);
                psView.setString(1,user);
                psView.setInt(2,generatedKey);

                psView.execute();

                psView.close();
                psBecomes.close();
                rs_generatedKeys.close();
            }
            //Now, need to set Access's currentCart to 0 because the cart is old now.
            String queryAccess = "UPDATE ACCESS SET currentCart = 0 WHERE CartID = ? AND Username = ?";
            PreparedStatement psAccess = con.prepareStatement(queryAccess);
            psAccess.setString(1,cartID);
            psAccess.setString(2,user);

            psAccess.execute();
            psAccess.close();

        }



    } catch (ClassNotFoundException | SQLException e) {
        System.out.println("error in Checkout" + e) ;
    }
    finally {
        //close in opposite order bc resources dependecy order
        try { if (psView != null) psView.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (rs_generatedKeys != null) rs_generatedKeys.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (psOrder != null) psOrder.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
</body>
<script>
    alert("Thanks for shopping with Partly!");
    alert("Redirecting user back to Catalog page.");
    window.location.href = "http://localhost:8080/user/Catalog.jsp";

</script>

</html>