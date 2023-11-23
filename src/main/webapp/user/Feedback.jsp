<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<%
    // Set the content type of the response
    response.setContentType("text/html;charset=UTF-8");

    // Prevent caching
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // Database credentials
    String db = "team9";
    String admin = "root";
    String adminPassword = "ivanachen";

    // Check if this is a POST request (i.e., form submission)
        // Capture the form data
        String subject = request.getParameter("subject");
        String comments = request.getParameter("comments");

        // Attempt to handle the form submission
        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish a connection
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false",
                    admin, adminPassword);

            // SQL insert statement
            String query = "INSERT INTO FEEDBACK(Subject, Body) VALUES(?, ?)";
            // Prepare the statement
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, subject);
            preparedStatement.setString(2, comments);

            // Execute the insert command
            preparedStatement.executeUpdate();

            // Redirect to another page after successful insertion
            response.sendRedirect("Catalog.jsp");
        } catch (Exception e) {
            // Handle any errors
            out.println("Error in handling feedback: " + e.getMessage());
        } finally {
            // Clean up
            if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException logOrIgnore) {}
            if (con != null) try { con.close(); } catch (SQLException logOrIgnore) {}
        }

%>
</body>
</html>

