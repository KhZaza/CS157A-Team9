<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %><%--
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
    String adminPassword = "ivanachen";

    PreparedStatement psFeedback = null;
    PreparedStatement psManage = null;
    Connection con = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin, adminPassword);

        //Only let the admin view one feedback at a time.
        String queryFeedback = "SELECT * FROM Feedback LIMIT 1";

        psFeedback = con.prepareStatement(queryFeedback);
        psFeedback.execute();




        //Now delete from Part
        String queryPart = "DELETE FROM Part where PartID = ?";

        psDelete = con.prepareStatement(queryPart);
        psDelete.setString(1,partToDelete);
        psDelete.execute();

    } catch (ClassNotFoundException | SQLException e) {
        System.out.println("error in Delete Stock" + e) ;
    }
    finally {
        //close in opposite order bc resources dependecy order
        try { if (psDelete != null) psDelete.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (psManage != null) psManage.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }




%>


</body>
</html>
