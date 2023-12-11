<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="AdminCheck.jsp"/>

<html>
<head>
    <title>Partly</title>
</head>
<body style = "background-color: #3498db;">
<%
    // varible is called "variableName"
%>

<%
    String db = "team9";
    String admin = "root";
    String adminPassword = "ivanachen";
    String partToDelete = request.getParameter("id");


    PreparedStatement psDelete = null;
    PreparedStatement psManage = null;
    Connection con = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin, adminPassword);

        //Delete Manage first because foreign key
        String queryManage = "DELETE FROM Manage where PartID = ?";

        psManage = con.prepareStatement(queryManage);
        psManage.setString(1,partToDelete);
        psManage.execute();

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

response.sendRedirect("AdminHome.jsp");
%>


</body>
</html>
