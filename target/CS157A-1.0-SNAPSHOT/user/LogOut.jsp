<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- may be you want to change this -->
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.sql.*" %>

<%
    if (session != null) {
        //Remove from Cookies table
        String db = "team9";
        String admin = "root";
        String adminPassword = "ivanachen";
        PreparedStatement psCookies = null;
        Connection con = null;
        PreparedStatement psUsername = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                    admin, adminPassword);
            request.getSession(true);
            String username = (String)session.getAttribute("user");
            String queryCookies = "DELETE FROM Cookies Where Username = ?";

            psUsername = con.prepareStatement(queryCookies);
            psUsername.setString(1, username);

            psUsername.execute();

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("error in Logout");
        }
        finally {
            //close in opposite order bc resources dependecy order
            try { if (psUsername != null) psUsername.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }


        session.invalidate();



    }
    response.sendRedirect("../user/LogIn.html");
%>