<%@ page import ="java.sql.*" %>
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
        PreparedStatement psFeedback = null;
        ResultSet rs_generatedKeys = null;
        PreparedStatement psView = null;
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
            psFeedback = con.prepareStatement(query);
            psFeedback.setString(1, subject);
            psFeedback.setString(2, comments);


            int affectedRows = psFeedback.executeUpdate();

            if (affectedRows > 0) { // checks if anything was inserted or not
                // Retrieve the generated keys
                rs_generatedKeys = psFeedback.getGeneratedKeys(); // get the pk

                if (rs_generatedKeys.next()) {
                    // Access the auto-incremented primary key value
                    int generatedKey = rs_generatedKeys.getInt(1);

                    //Add the PK to the DB for the relation  Customer x View x Order
                    String queryView = "INSERT INTO view(Username, OrderID) VALUES(?,?)";
                    psView = con.prepareStatement(queryView);
                    String user = (String)session.getAttribute("user");
                    psView.setString(1, user); // admin id is stored in session
                    psView.setInt(2, generatedKey);
                    psView.execute();
                }
            }


            // Redirect to another page after successful insertion
            response.sendRedirect("Catalog.jsp");
        } catch (Exception e) {
            // Handle any errors
            out.println("Error in handling feedback: " + e.getMessage());
        } finally {
            // Clean up
            if (psView != null) try { psView.close(); } catch(SQLException e) {e.printStackTrace(); }
            if (rs_generatedKeys != null) try { rs_generatedKeys.close(); } catch(SQLException e) {e.printStackTrace(); }
            if (psFeedback != null) try { psFeedback .close(); } catch(SQLException e) {e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (SQLException e) {e.printStackTrace(); }
        }

%>
</body>
</html>

