<%@ page import="java.sql.*"%>
<%@ page import="javax.xml.transform.Result" %>
<%@ page import="at.favre.lib.crypto.bcrypt.BCrypt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;
                                            charset=UTF-8">
</head>
<body>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String db = "team9";
    String admin = "root";
    String adminPassword = "ivanachen";
    Boolean usernameExists = false;
    String db_password = "";
    boolean isPassword = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin,adminPassword);

        //Check for password based on the encrypted password.
        //Grab the current password from the db
        String queryPass = "SELECT password FROM customer WHERE username = ?";

        //Need to verify that username exists first.
        String q_username = "SELECT username,password FROM customer WHERE username = ?";
        PreparedStatement psUsername = con.prepareStatement(q_username);
        psUsername.setString(1,username);
        ResultSet rs_username = psUsername.executeQuery();

        //usernameExists = rs_username.next(); // returns true if exists.

        //Continue if username exists, else prompt user that they have incorrect credentials
        while(rs_username.next()){
           db_password = rs_username.getString(2);
           isPassword = BCrypt.verifyer().verify(password.toCharArray(),db_password.toCharArray()).verified;

        }
        if(isPassword){
            out.println("Its in the database!");

        }
        else{
            out.println("Its NOT in the database!"); // redirect user?
        }
/*


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
 */
        rs_username.close();
        psUsername.close();
        con.close();


    } catch (ClassNotFoundException | SQLException e) {
        response.sendRedirect("SignUp.html");
    }
%>
</body>

</html>