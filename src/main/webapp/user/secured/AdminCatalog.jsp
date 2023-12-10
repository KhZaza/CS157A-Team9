
<%@ page import ="java.sql.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page="AdminCheck.jsp"/>

<html>
<head>
  <title>Partly</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }

    /* Remove the jumbotron's default bottom margin */
    .jumbotron {
      margin-bottom: 0;
    }
    body{
      background-color: #0b1120;
    }

    /* Add a gray background color and some padding to the footer */
    footer {
      position: relative;
      background-color: black;
      padding: 25px;
    }

    .flex-container {
      display: flex;
      justify-content: space-between; /* Aligns items to opposite ends */
      align-items: center; /* Aligns items vertically */
      padding-bottom: 20px;

    }

    .category-dropdown {
      flex-grow: 1;
      /* Allows the dropdown to grow and take available space */
    }

    .search-bar {
      /*margin-left: auto; !* Pushes the search bar to the right *!*/
    }



  </style>

</head>

<body>


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="AdminHome.jsp">Partly</a>
  </div>
  </div>
</nav>

<div class="container">
  <div class="row">
    <div class="flex-container">



      <!-- Category Dropdown on the Left -->
      <div class="category-dropdown">

        <div class="col-sm-9">
          <div class="dropdown">
            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Select Category
              <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">

              <%
                String db = "team9";
                String admin = "root";
                String adminPassword = "cs157a@zaza";

                try {
                  Class.forName("com.mysql.cj.jdbc.Driver");
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false",
                          admin, adminPassword);

                  // Query to get distinct categories
                  String queryCategories = "SELECT DISTINCT Category FROM part";
                  PreparedStatement psCategories = con.prepareStatement(queryCategories);
                  ResultSet rsCategories = psCategories.executeQuery();

                  while (rsCategories.next()) {
                    String category = rsCategories.getString("Category");
                    out.println("<li><a href=\"?category=" + category + "\">" + category + "</a></li>");
                  }


                  out.println("    </ul>");
                  out.println("</div>");

                  // Close resources
                  rsCategories.close();
                  psCategories.close();
                  con.close();

                } catch (ClassNotFoundException | SQLException e) {
                  out.println("Error in retrieving categories");
                  out.println(e);
                }
              %>

              <!-- Need to update the list on what ever what selected  -->
            </ul>
          </div>
        </div>

        <!-- Need to actually make this work and search stuff in the DB -->
        <div class="col-sm-3" >
          <div class="search-bar">
            <form class="navbar-form" role="search" method="GET">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Search" name="searchTerm" id="srch-term">
                <div class="input-group-btn">
                  <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>


        <%


    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", admin, adminPassword);

        // Retrieving the search term from the request

        String searchTerm = request.getParameter("searchTerm");
        String selectedCategory = request.getParameter("category");
        boolean isSearchActive = searchTerm != null && !searchTerm.isEmpty();
        boolean isCategorySelected = selectedCategory != null && !selectedCategory.isEmpty();

        // Query to get the parts based on search term
        String queryData;
        if (isSearchActive) {
            queryData = "SELECT * FROM part WHERE Name LIKE ?";
        } else if (isCategorySelected) {
            queryData = "SELECT * FROM part WHERE Category = ?";
        } else {
            queryData = "SELECT * FROM part";
        }

        PreparedStatement psData = con.prepareStatement(queryData);

        // Setting the search term in the query
        if (isSearchActive) {
            psData.setString(1, "%" + searchTerm + "%");
        } else if (isCategorySelected) {
            psData.setString(1, selectedCategory);
        }

        ResultSet rsData = psData.executeQuery();

        List<String> categoryList = new ArrayList<>();
        List<String> nameList = new ArrayList<>();
        List<Integer> priceList = new ArrayList<>();
        List<String> descriptionList = new ArrayList<>();
        List<String> urlList = new ArrayList<>();
        List<Integer> idList = new ArrayList<>();

        while (rsData.next()) {
            idList.add(rsData.getInt("PartID"));
            categoryList.add(rsData.getString("Category"));
            nameList.add(rsData.getString("Name"));
            priceList.add(rsData.getInt("Sell Price"));
            descriptionList.add(rsData.getString("Description"));
            urlList.add(rsData.getString("URL"));
        }

out.println("<div class=\"container\">");

// Start a single row for all items
out.println("<div class=\"row\">");

for(int i = 0; i < nameList.size(); i++){
    // Each item is a column in the row
    out.println(
    "<div class=\"col-sm-12\">" +
    "    <div class=\"row\">" +
    "        <div class=\"col-sm-2\">" + // Smaller column for the image
    "            <img src='" + urlList.get(i) + "' class=\"img-responsive\" style=\"width:100%\" alt=\"Image\">" +
    "        </div>" +
    "        <div class=\"col-sm-10\">" + // Larger column for the text
    "            <div class=\"panel panel-primary\">" +
    "                <div class=\"panel-heading\">" + nameList.get(i) + "</div>" +
    "                <div class=\"panel-heading\">Part number: " + idList.get(i) + "</div>" +
    "                <div class=\"panel-body\">" + descriptionList.get(i) + "</div>" +
    "                <div class=\"panel-footer\">$" + priceList.get(i) + "</div>" +
    "            </div>" +
    "        </div>" +
    "    </div>" +
    "</div>"
    );
}

// Close the row and container
out.println("</div></div><br>");


        // Close resources
        rsData.close();
        psData.close();
        con.close();

    } catch (ClassNotFoundException | SQLException e) {
        out.println("Error from catalogAdmin");
        out.println(e);
    }

%>


</body>

</html>