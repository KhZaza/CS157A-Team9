<%@ page import="java.sql.*"%>
<%@ page import="javax.xml.transform.Result" %>
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
<%!
    String noExist(){
        return "Incorrect credentials!";
    }
    String exist(){
        return "Successfully logged in.";
    }
%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String db = "team9";
    String admin = "root";
    String adminPassword = "cs157a@zaza";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin,adminPassword);

        //sql insert statement. 1 means exists, 0 means doesn't
        out.println(username + password);
        String query = "SELECT username, password FROM customer WHERE username= ? AND password = ?";

        //sql insert prepared statements
        PreparedStatement preparedStatement = con.prepareStatement(query);
        preparedStatement.setString(1,username);
        preparedStatement.setString(2,password);

        ResultSet rs = preparedStatement.executeQuery();

        if(rs.next()){ // exists
            out.println("Its in the database!");

        }
        else{ // doesn't exist
            out.println("Incorrect Creds."); // Maybe redirect this back to login?
        }



        //To here, can't get it to see if creds are right or not.
        // The table should give the value 1 for exists, and 0 if not exists
        rs.close();
        preparedStatement.close();
        con.close();

        //response.sendRedirect("LogIn.html");

    } catch (ClassNotFoundException | SQLException e) {
        //response.sendRedirect("SignUp.html");
    }
%>
</body>

</html>