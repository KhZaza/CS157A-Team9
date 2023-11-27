<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="at.favre.lib.crypto.bcrypt.BCrypt" %>
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
</head>
<body>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    HttpSession sess = (HttpSession) request.getSession();
    sess.setAttribute("user",username);


    String db = "team9";
    String admin = "root";
    String adminPassword = "cs157a@zaza";
    String db_password = "";
    boolean isPassword = false;

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
           isPassword = BCrypt.verifyer().verify(password.toCharArray(),db_password.toCharArray()).verified;

        }
        if(isPassword){
            out.println("Its in the database!");
            session.setAttribute("username", username);
            response.sendRedirect("LogOut.html?username=" + URLEncoder.encode(username, "UTF-8"));
            //If user signed in, then add the 'cookies' part so username will be saved.

        }
        else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Incorrect Creds.');");
            out.println("window.location.href = 'SignUp.html';");
            out.println("</script>");
        }



        rs_username.close();
        psUsername.close();
        con.close();


    } catch (ClassNotFoundException | SQLException e) {
        response.sendRedirect("SignUp.html");
    }
%>
</body>

</html>
