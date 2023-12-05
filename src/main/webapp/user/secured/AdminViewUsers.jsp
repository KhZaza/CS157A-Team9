<%--
  Created by IntelliJ IDEA.
  User: khaledzaza
  Date: 12/3/23
  Time: 7:35 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import ="java.sql.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page="AdminCheck.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>

<head>

  <title>View Users</title>

  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

  <style>
    body{
      background: #121212; /* Darker shade for background */
    }
    .card {
      position: relative;
      display: flex;
      flex-direction: column;
      min-width: 0;
      word-wrap: break-word;
      background-color: #fff;
      background-clip: border-box;
      border: 0 solid transparent;
      border-radius: 0;
    }
    .btn-circle.btn-lg, .btn-group-lg>.btn-circle.btn {
      width: 50px;
      height: 50px;
      padding: 14px 15px;
      font-size: 18px;
      line-height: 23px;
    }
    .text-muted {
      color: #8898aa!important;
    }
    [type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
      cursor: pointer;
    }
    .btn-circle {
      border-radius: 100%;
      width: 40px;
      height: 40px;
      padding: 10px;
    }
    .user-table tbody tr .category-select {
      max-width: 150px;
      border-radius: 20px;
    }
    .navbar {
      background-color: black;
      overflow: hidden;
      width: 100%;
      display: block;
      top: 0;
      left: 0;
      right: 0;
    }
    .navbar a {
      float: left;
      display: block;
      color: white;
      text-align: center;
      padding: 14px 20px;
      text-decoration: none;
    }
    .navbar a:hover {
      background-color: #ddd;
      color: black;
    }
    .user-table td {
      padding-left: 50px; /* Adjust as needed */
      padding-right: 50px;
      padding-top: 10px;/* Adjust as needed */
    }
    body {
      background: #1e1e1e; /* Darker shade for background */
    }

    .card {
      background-color: #1e1e1e; /* Dark background for the card */
      color: #ffffff; /* Light text for readability */
    }

    .table {
      background-color: #1e1e1e; /* Dark background for the table */
      color: #ffffff; /* Light text for readability */
    }

    .navbar {
      background-color: #333333; /* Slightly lighter shade for the navbar */
    }

    .navbar a {
      color: #ffffff; /* Light color for text in navbar */
    }

    .navbar a:hover {
      background-color: #555555; /* Darker shade on hover */
    }

    .card a {
      color: #4a90e2; /* Example: light blue for links */
    }

    .card a:hover {
      color: #72b3f3; /* Lighter shade for hover state */
    }

    .font-medium{
      font-size: 20px;

    }


  </style>

</head>
<div  style="margin-bottom: 50px; border-radius: 0;" class="navbar">
  <a href="AdminHome.jsp">Partly</a>
</div>

<body >

<div class="container" >
  <div class="row">
    <div class="col-md-12">
      <div class="card" >
        <div class="card-body" >
          <h2 class="card-title text-uppercase mb-0">Users</h2>
        </div>
        <div class="table-responsive"  >
          <table class="table no-wrap user-table mb-0" >
            <thead >
            <tr style="margin-bottom: 50px"  >
              <th scope="col" class="border-0 text-uppercase font-medium pl-4">#</th>
              <th scope="col" class="border-0 text-uppercase font-medium">Username</th>
              <th scope="col" class="border-0 text-uppercase font-medium">FirstName</th>
              <th scope="col" class="border-0 text-uppercase font-medium">LastName</th>
              <th scope="col" class="border-0 text-uppercase font-medium">Email</th>
              <th scope="col" class="border-0 text-uppercase font-medium">Address</th>

            </tr>
            </thead>
            <tbody>
            <%


              String db = "team9";
              String admin = "root";
              String adminPassword = "ivanachen";


              try {

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", admin, adminPassword);

                // Query to get distinct categories
                String querycustomer = "SELECT * FROM `customer`";
                PreparedStatement pscustomer = con.prepareStatement(querycustomer);
                ResultSet rscustomer = pscustomer.executeQuery();


                List<String> Username = new ArrayList<>();
                List<String> FName = new ArrayList<>();
                List<String> LName = new ArrayList<>();
                List<String> Email = new ArrayList<>();
                List<String> Address = new ArrayList<>();




                while (rscustomer.next()) {
                  Username.add(rscustomer.getString("Username"));
                  FName.add(rscustomer.getString("FName"));
                  LName.add(rscustomer.getString("LName"));
                  Email.add(rscustomer.getString("Email"));
                  Address.add(rscustomer.getString("Address"));


                }

                // Displaying the users

                out.println("<div class=\"mb-8\" style=\"margin: 15px;\">");
                for (int i = 0; i < Username.size(); i++) {
                  out.println("<tr>");
                  out.println("<td class='pl-4'>" + (i + 1) + "</td>");
                  out.println("<td><span class='text-muted'>" + Username.get(i) + "</span></td>");
                  out.println("<td><span class='text-muted'>" + FName.get(i) + "</span></td>");
                  out.println("<td><span class='text-muted'>" + LName.get(i) + "</span></td>");
                  out.println("<td><span class='text-muted'>" + Email.get(i) + "</span></td>");
                  out.println("<td><span class='text-muted'>" + Address.get(i) + "</span></td>");
                  out.println("</tr>");

                }
                out.println("</div></div><br>");


                // Close resources
                rscustomer.close();
                pscustomer.close();
                con.close();



              } catch (ClassNotFoundException | SQLException e) {
                out.println("Error from ViewUsers");
                out.println(e);
              }

            %>

            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>