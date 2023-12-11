
<%@ page import="java.sql.*,at.favre.lib.crypto.bcrypt.BCrypt "%>
<%@ page import="static java.awt.SystemColor.window" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;
                                            charset=UTF-8">
    <%
        //prevents caching at the proxy server so it updates after refreshing
        response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
        response.setHeader("Pragma","no-cache"); //HTTP 1.0
        response.setDateHeader ("Expires", 0);

    %>
</head>s
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
   String passwordConfirm = request.getParameter("passwordConfirm");
    String address = request.getParameter("address");
    String db = "team9";
    String admin = "root";
    String adminPassword = "ivanachen";
    String hashedPassword = "";

    //First thing is to see if the password and passwordConfirm matches, else redirect them.
    if(!password.equals(passwordConfirm)){
        out.println("Passwords don't match!");
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Incorrect Creds.');");
        out.println(" window.location.replace('http://localhost:8080/user/SignUp.html')");
        out.println("</script>");
    }


    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin,adminPassword);

        //sql insert statement
        String query = "INSERT INTO CUSTOMER(Username, FName, LName, Email, Password, Address) VALUES(?,?,?,?,?,?)";

        //Decryption for passwords
        //12 is just cost factor. we can increase or decrease as needed for protection vs performance
        hashedPassword = BCrypt.withDefaults().hashToString(12,password.toCharArray());

        //sql insert prepated statements
        PreparedStatement preparedStatement = con.prepareStatement(query);
        preparedStatement.setString(1,username);
        preparedStatement.setString(2,firstName);
        preparedStatement.setString(3,lastName);
        preparedStatement.setString(4,email);
        preparedStatement.setString(5,hashedPassword);
        preparedStatement.setString(6,address);

        preparedStatement.execute();

        con.close();

        //Sends the user to the login page after creation
        response.sendRedirect("LogIn.html");

    } catch (ClassNotFoundException | SQLException e) {
        out.println("Error while signing up");
        out.println(e);
        //response.sendRedirect("SignUp.html");
    }
%>
</body>

</html>
