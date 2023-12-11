import at.favre.lib.crypto.bcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.*;
import java.util.Base64;


@WebServlet(name = "CookiesServlet", value = "/CookiesServlet")
public class CookiesServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Authenticate user against the User table in the database.
        boolean authenticated = authenticateUser(username, password);

        if (authenticated) {
            // Generate a unique session token.
            String sessionToken = generateSessionToken();

            // Store the session token in the "cookies" table in your database.
            storeSessionToken(username, sessionToken);

            // Create a new cookie with the session token.
            Cookie sessionCookie = new Cookie("sessionToken", sessionToken);

            // Make the cookie secure and set its path.
            sessionCookie.setSecure(true);
            sessionCookie.setPath("/");

            // Add the cookie to the response.
            response.addCookie(sessionCookie);

            HttpSession sess = request.getSession();
            sess.setAttribute("user",username);

            // Redirect to the user's cart page or any other page.
            response.sendRedirect("Catalog.jsp");
        } else {
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Incorrect credentials. Try again!');");
            out.println("window.location.replace('http://localhost:8080/user/LogIn.html')");
            out.println("</script>");

        }
    }

    private boolean authenticateUser(String username, String password) {
        //Checks to make sure the user is in the database or not. True = in database. False = not.
        String db = "team9";
        String admin = "root";
        String adminPassword = "ivanachen";
        Boolean usernameExists = false;
        String db_password = "";
        boolean isPassword = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                    admin, adminPassword);

            //Check for password based on the encrypted password.
            //Grab the current password from the db
            String queryPass = "SELECT password FROM customer WHERE username = ?";
            PreparedStatement psUsername = con.prepareStatement(queryPass);
            psUsername.setString(1, username);
            ResultSet rs_username = psUsername.executeQuery();


            //Continue if username exists, else prompt user that they have incorrect credentials
            while (rs_username.next()) {
                db_password = rs_username.getString(1);
                isPassword = BCrypt.verifyer().verify(password.toCharArray(), db_password.toCharArray()).verified;

            }
            rs_username.close();
            psUsername.close();
            con.close();



        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("error in authuser");
            //response.sendRedirect("SignUp.html");
        }
        return isPassword; // true = correct. false = not
    }

    private String generateSessionToken() {
        //Uses 'java.security.secureRandom'
        // to generate a random token. This will be the token that a user is given when they log in

        SecureRandom randomToken = new SecureRandom();
        byte[] tokenBytes = new byte[20]; // we can increase the byte size if needed (would make it more secure vs speed)
        randomToken.nextBytes(tokenBytes); // call that will create the random bytes and store it in the array


        return Base64.getUrlEncoder().withoutPadding().encodeToString(tokenBytes); // returns it in a friendly string :)
    }

    private void storeSessionToken(String username, String CookiesToken) {
        //Store the session token in the database

        String admin = "root";
        String adminPassword = "ivanachen";
        PreparedStatement p_statement = null;
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                    admin, adminPassword);


            String query = "INSERT INTO Cookies (Username, SessionToken) VALUES (?, ?)";
            p_statement = con.prepareStatement(query);
            p_statement.setString(1, username);
            p_statement.setString(2, CookiesToken);
            p_statement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            //close in opposite order bc resources dependecy order
            try { if (p_statement != null) p_statement.close(); } catch (SQLException e) {e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

    }
}
