<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="at.favre.lib.crypto.bcrypt.BCrypt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;
                                            charset=UTF-8">
    <title>Partly</title>
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

    ResultSet rs_username = null;
    PreparedStatement psUsername = null;
    Connection con = null;


    //Need to do it so that if the user doesnt have an account yet, then we
    // need to create a cartID with the specified information.
    // We need to have another attribute in Cart that specifies if the Cart turned into orders or not
    // Like a boolean, if this is 0 = user doesnt have a cart yet so make one
    // If 1 = user already has a cart so we will add the parts to that cart
    // When the user clicks the order, then we will change the cart to 0.

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin,adminPassword);

        //First, check if user has a cart or not. If doesnt have a cart, then create a cart
        //

        String queryCart = "INSERT INTO Cart(CartID, Items, VALUES()";
        psUsername = con.prepareStatement(q_username);
        psUsername.setString(1,username);
        rs_username = psUsername.executeQuery();

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





    } catch (ClassNotFoundException | SQLException e) {
        response.sendRedirect("SignUp.html");
    }
    finally{
        try { if (rs_username != null) rs_username .close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (psUsername != null) psUsername.close(); } catch (SQLException e) {e.printStackTrace(); }
        try { if (con != null) con.close(); } catch (SQLException e) {e.printStackTrace(); }

    }
%>
</body>

</html>
