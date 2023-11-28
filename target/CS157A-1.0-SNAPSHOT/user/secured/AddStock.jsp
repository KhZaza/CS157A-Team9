<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: ivanachen
  Date: 11/15/23
  Time: 1:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="AdminCheck.jsp"/>

<html>
<head>
    <title>Partly</title>
</head>
<body>
<%
    String db = "team9";
    String admin = "root";
    String adminPassword = "cs157a@zaza";
    String name = request.getParameter("name");
    String category = request.getParameter("category");
    int price = Integer.parseInt(request.getParameter("price"));
    int qty = Integer.parseInt(request.getParameter("qty"));
    String description = request.getParameter("description");
    String url = request.getParameter("url");

    PreparedStatement psInsert = null;
    PreparedStatement psManage = null;
    ResultSet rs_generatedKeys = null;
    Connection con = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin, adminPassword);



        String queryPart = "INSERT INTO Part(Category, Name, `Sell Price`, Description, URL) VALUES(?,?,?,?,?)";


        psInsert = con.prepareStatement(queryPart, Statement.RETURN_GENERATED_KEYS);
        psInsert.setString(1, category);
        psInsert.setString(2, name);
        psInsert.setInt(3, price);
        psInsert.setString(4, description);
        psInsert.setString(5, url);

        int affectedRows = psInsert.executeUpdate();

        if (affectedRows > 0) { // checks if anything was inserted or not
            // Retrieve the generated keys
            rs_generatedKeys = psInsert.getGeneratedKeys(); // get the pk

            if (rs_generatedKeys.next()) {
                // Access the auto-incremented primary key value
                int generatedKey = rs_generatedKeys.getInt(1);

                //Add the PK to the DB
                String queryManage = "INSERT INTO Manage(AdminID_M, PartID, QTY) VALUES(?,?,?)";
                psManage = con.prepareStatement(queryManage);
                psManage.setString(1,(String)session1.getAttribute("admin")); // admin id is stored in session
                psManage.setInt(2,generatedKey);
                psManage.setInt(3,qty);

                psManage.execute(); // ? or executeQuery ?

            }
        }
    } catch (ClassNotFoundException | SQLException e) {
        System.out.println("error in addstock :(");
    }
    finally {
        //close in opposite order bc resources dependecy order
        try { if (psManage != null) psManage.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (rs_generatedKeys != null) rs_generatedKeys.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (psInsert != null) psInsert.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<h1>Where would you like to go now?</h1>
<a href="AddStock.html">Add Stock</a>
<a href ="DeleteStock.html">Remove Stock</a>
<a href ="AdminUpdateStock.html">Update Stock</a>
<a href="AdminHome.jsp">Home</a>
</body>
</html>
