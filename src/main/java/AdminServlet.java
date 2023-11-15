
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
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");


        // Check credentials
        if (isValidUser(username, password)) {
            // Grant access to secured pages
            request.getSession().setAttribute("admin", username);
            response.sendRedirect("secured/AdminHome.jsp");
        } else {
            // Invalid credentials, redirect back to login page
            response.sendRedirect("AdminLogin.html");
        }
    }

    private boolean isValidUser(String username, String password) {
        String db = "team9";
        String admin = "root";
        String adminPassword = "cs157a@zaza";
        String db_password = "";
        String adminName = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                    admin, adminPassword);

            //Query the Admin table
            String queryAdmin = "SELECT Name, Password FROM Admin WHERE AdminID = ?";

            PreparedStatement psUsername = con.prepareStatement(queryAdmin);
            psUsername.setString(1, username);

            ResultSet rs_username = psUsername.executeQuery();

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

            rs_username.close();
            psUsername.close();
            con.close();

            return true;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("error in adminservlet");
        }
        return false;
    }

}