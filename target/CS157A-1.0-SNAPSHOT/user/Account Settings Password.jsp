<%--
  Created by IntelliJ IDEA.
  User: ivanachen
  Date: 11/9/23
  Time: 1:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*"%>
<%@ page import="at.favre.lib.crypto.bcrypt.BCrypt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Partly</title>
</head>
<body>
<%
    String oldPassword = request.getParameter("oldPassword");
    String newPassword = request.getParameter("newPassword");
    String confirmPassword = request.getParameter("confirmPassword");
    String db = "team9";
    String admin = "root";
    String adminPassword = "cs157a@zaza";
    String hashedPassword = "";
    //Current user accessing page
    HttpSession sess = (HttpSession) request.getSession(true);
    String username = (String)sess.getAttribute("user");
    String db_password = "";
    boolean isPassword = false;

    //First check if newPassword matches the confirmPassword:
    //First thing is to see if the password and passwordConfirm matches, else redirect them.
    if(!newPassword.equals(confirmPassword)){
        out.println("New Passwords don't match!");
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Incorrect Creds.');");
        out.println(" window.location.replace('http://localhost:8080/user/SignUp.html')");
        out.println("</script>");
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin,adminPassword);

        String q_username = "SELECT username,password FROM customer WHERE username = ?";
        PreparedStatement psUsername = con.prepareStatement(q_username);
        psUsername.setString(1,username);
        ResultSet rs_username = psUsername.executeQuery();

        while(rs_username.next()){
            db_password = rs_username.getString(2);
            isPassword = BCrypt.verifyer().verify(oldPassword.toCharArray(),db_password.toCharArray()).verified;

        }
        if(isPassword){ // Means that the old password they inputted matches the one in db. if it doesn't redirect user
            hashedPassword = BCrypt.withDefaults().hashToString(12,password.toCharArray());
            String queryPasswords = "UPDATE customer SET password = '?' WHERE Username = '?'; ";
            PreparedStatement ps = con.prepareStatement(queryPasswords);
            ps.setString(1,hashedPassword);
            ps.setString(2,username);
            ps.execute();
            ps.close();

        }
        else{
            out.println("Old Passwords don't match!");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Try again');");
            out.println(" window.location.replace('http://localhost:8080/user/Account%20Settings.html')");
            out.println("</script>");
        }
        rs_username.close();
        psUsername.close();
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
