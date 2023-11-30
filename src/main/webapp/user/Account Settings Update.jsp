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
    String adminPassword = "ivanachen";


    //Current user accessing page
    HttpSession sess = (HttpSession) request.getSession(true);
    String username = (String)sess.getAttribute("user");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin,adminPassword);

        //sql insert statement
        String query = "UPDATE customer SET FName = ?, LName = ?,Email = ?, Address = ?  WHERE Username = ?;";
        PreparedStatement preparedStatement = con.prepareStatement(query);
        preparedStatement.setString(1,firstName);
        preparedStatement.setString(2,lastName);
        preparedStatement.setString(3,email);
        preparedStatement.setString(4,address);
        preparedStatement.setString(5,username);

        preparedStatement.execute();
        preparedStatement.close();
        con.close();

        //Sends the user to the login page after creation
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Changed Information');");
        out.println("</script>");
        response.sendRedirect("Catalog.jsp");

    } catch (ClassNotFoundException | SQLException e) {
        out.println("Error while signing up");
        out.println(e);
        //response.sendRedirect("SignUp.html");
    }
%>

</body>
</html>
