<%--
  Created by IntelliJ IDEA.
  User: ivanachen
  Date: 11/9/23
  Time: 1:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Partly</title>
</head>
<body>
<%
    String email = request.getParameter("email");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String password = request.getParameter("password"); // no touch yet.
    String address = request.getParameter("address");
    String db = "team9";
    String admin = "root";
    String adminPassword = "cs157a@zaza";

    HttpSession sess = (HttpSession) request.getSession(true);
    String username = (String)sess.getAttribute("user");

    Connection con = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin, adminPassword);

        StringBuilder query = new StringBuilder("UPDATE customer SET ");
        boolean first = true;

        if (firstName != null && !firstName.isEmpty()) {
            query.append("FName = ?");
            first = false;
        }
        if (lastName != null && !lastName.isEmpty()) {
            if (!first) query.append(", ");
            query.append("LName = ?");
            first = false;
        }
        if (email != null && !email.isEmpty()) {
            if (!first) query.append(", ");
            query.append("Email = ?");
            first = false;
        }
        if (address != null && !address.isEmpty()) {
            if (!first) query.append(", ");
            query.append("Address = ?");
        }
        query.append(" WHERE Username = ?;");

        preparedStatement = con.prepareStatement(query.toString());

        int paramIndex = 1;
        if (firstName != null && !firstName.isEmpty()) {
            preparedStatement.setString(paramIndex++, firstName);
        }
        if (lastName != null && !lastName.isEmpty()) {
            preparedStatement.setString(paramIndex++, lastName);
        }
        if (email != null && !email.isEmpty()) {
            preparedStatement.setString(paramIndex++, email);
        }
        if (address != null && !address.isEmpty()) {
            preparedStatement.setString(paramIndex++, address);
        }
        preparedStatement.setString(paramIndex, username);

        if (paramIndex > 1) { // Indicates that at least one field was set
            preparedStatement.execute();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Changed Information');");
            out.println("</script>");
            response.sendRedirect("Catalog.jsp");
        } else {
            // No fields to update
            out.println("<script type=\"text/javascript\">");
            out.println("alert('No Information to Change');");
            out.println("</script>");
            // Redirect or handle as needed
        }
    } catch (ClassNotFoundException | SQLException e) {
        out.println("Error while signing up");
        out.println(e);
        //response.sendRedirect("SignUp.html");
    } finally {
        if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException e) { /* ignored */ }
        if (con != null) try { con.close(); } catch (SQLException e) { /* ignored */ }
    }
%>


</body>
</html>
