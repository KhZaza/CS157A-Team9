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
</head>
<body>

<%

    String db = "team9";
    String admin = "root";
    String adminPassword = "ivanachen";
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
                admin,adminPassword);

        //First, check if user has a cart or not. If doesnt have a cart, then create a cart

        String queryAccess = "SELECT EXISTS(SELECT * FROM Access WHERE Username = ? AND currentCart = 1)";
        psAccess = con.prepareStatement(queryAccess);
        psAccess.setString(1, username);
        rsAccess = psAccess.executeQuery();
        int cartExist = 0; // 0 means doesn't exist
        while(rsAccess.next()){
            cartExist = rsAccess.getInt(1); // would grab 1 if a current cart exist
        }
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
            int totalPrice = 0;
            for (int i = 0; i < idList.size(); i++) {
                totalPrice += priceList.get(i) * qtyList.get(i);
            }
            String queryCartPrice = "INSERT INTO Cart(CartID, `Total Price`) Values(?,?)";
            PreparedStatement psCartPrice = con.prepareStatement(queryCartPrice);
            psCartPrice.setString(1,cartID);
            psCartPrice.setInt(2, totalPrice);
            psCartPrice.execute();
            psCartPrice.close();

        }

            /*************************************
             * ADD THE HTML FOR CART HERE. SAME AS CATALOG!
             * ~~~~ the lists to print are on top or like a few lines above this comment
             */


        /*************************************
         * The code below this is the case where the user clicks "submit" in the cart. So like when a user "checksout"
         *So we will need a button that will enter this code or idk if you want to add to different jsp
         * ?might not need this if we have checkout.jsp? not too sure
         */


            //First need to create an orderID with that customerID
        String queryOrder = "INSERT INTO ORDER(CustomerID) VALUES(?)";
        psOrder = con.prepareStatement(queryOrder, Statement.RETURN_GENERATED_KEYS);
        psOrder.setString(1,username);

        int affectedRows = psOrder.executeUpdate();

        if (affectedRows > 0) { // checks if anything was inserted or not
            // Retrieve the generated keys
            rs_generatedKeys = psOrder.getGeneratedKeys(); // get the pk
            if (rs_generatedKeys.next()) {
                // Access the auto-incremented primary key value
                int generatedKey = rs_generatedKeys.getInt(1);

                //Now insert into Becomes.
                String queryBecomes = "INSERT INTO becomes(CartID, OrderID, `Order Date`) VALUES(?, ?, ?)";
                LocalDate currentDate = LocalDate.now(); // Grab the current date now

                psBecomes = con.prepareStatement(queryBecomes);
                psBecomes.setString(1, cartID);
                psBecomes.setInt(2, generatedKey);
                psBecomes.setDate(3, Date.valueOf(currentDate)); // maybe no work?

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
