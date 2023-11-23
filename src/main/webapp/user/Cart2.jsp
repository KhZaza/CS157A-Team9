<%--
  Created by IntelliJ IDEA.
  User: ivanachen
  Date: 11/8/23
  Time: 4:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>

<html>
<head>
  <meta charset="UTF-8">
  <title>Responsive Shopping Cart design</title>
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="Cart2.css" rel="stylesheet"></head>
<body>
<%
  String db = "team9";
  String admin = "root";
  String adminPassword = "cs157a@zaza";

  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
            admin, adminPassword);


    List<String> nameList = new java.util.ArrayList<String>();
    List<Integer> priceList = new java.util.ArrayList<Integer>();
    List<String> urlList = new java.util.ArrayList<String>();

    String queryData = "SELECT * FROM part";
    PreparedStatement psData = con.prepareStatement(queryData);
    ResultSet rsData = psData.executeQuery();


    while (rsData.next()) { // iterates through table and adds to array
      nameList.add(rsData.getString("Name"));
      priceList.add(rsData.getInt("Sell Price"));
      urlList.add(rsData.getString("URL"));
    }




  }catch (ClassNotFoundException | SQLException e) {
    out.println("Error from cart");
    out.println(e);
  }





%>

</body>
</html>
