<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;
                                            charset=UTF-8">
</head>
<body>
<%-- Here we fetch the data using the name attribute
     of the text from the previous signup.html page
--%>
<%
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String password = request.getParameter("password");
    String address = request.getParameter("address");
    String db = "team9";
    String admin = "root";
    String adminPassword = "cs157a@zaza";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin,adminPassword);

        //sql insert statement
        String query = "INSERT INTO CUSTOMER(Username, FName, LName, Email, Password, Address) VALUES(?,?,?,?,?,?)";

        //sql insert prepated statements
        PreparedStatement preparedStatement = con.prepareStatement(query);
        preparedStatement.setString(1,username);
        preparedStatement.setString(2,firstName);
        preparedStatement.setString(3,lastName);
        preparedStatement.setString(4,email);
        preparedStatement.setString(5,password);
        preparedStatement.setString(6,address);

        preparedStatement.execute();

        con.close();

        response.sendRedirect("LogIn.html");

    } catch (ClassNotFoundException | SQLException e) {
        response.sendRedirect("SignUp.html");
    }
%>
</body>

</html>