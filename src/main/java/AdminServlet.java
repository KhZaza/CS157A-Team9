
import com.mysql.cj.protocol.Resultset;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

//test
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Grab the fields from html
        String username = request.getParameter("username");
        String password = request.getParameter("password");


        // Check credentials
        if (isValidUser(username, password)) {
            // Grant access to secured pages
            request.getSession().setAttribute("admin", username);
            response.sendRedirect("secured/AdminHome.jsp");
        } else {
            // Invalid credentials, redirect back to login page and handle message
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Incorrect credentials");
            response.sendRedirect("AdminLogin.jsp");
        }
    }

    private boolean isValidUser(String username, String password) {
        String db = "team9";
        String admin = "root";
        String adminPassword = "ivanachen";
        String db_password = "";
        String adminName = "";
        ResultSet rs_username = null;
        PreparedStatement psUsername = null;
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                    admin, adminPassword);

            //Query the Admin table
            String queryAdmin = "SELECT Name, Password FROM Admin WHERE AdminID = ?";

            psUsername = con.prepareStatement(queryAdmin);
            psUsername.setString(1, username);

            rs_username = psUsername.executeQuery();

            while (rs_username.next()) {
                adminName = rs_username.getString(1);
                db_password = rs_username.getString(2);
            }
            //Check to make sure they match
            if(!adminName.equals(username)){
                return false;
            }
            if(!db_password.equals(password)){
                return false;
            }

            return true;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("error in adminservlet");
        }
        finally {
            //close in opposite order bc resources dependecy order
            try { if (rs_username != null) rs_username.close(); } catch (SQLException e) {e.printStackTrace(); }
            try { if (psUsername != null) psUsername.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        return false;
    }

}