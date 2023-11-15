
<%@ page import ="java.sql.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

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

        #feedback-button-container {
            position: fixed;
            bottom: 10px;
            right: 10px;
            z-index: 1000; /* Make sure the button stays above other elements */
        }

        .feedback-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-align: center;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            box-shadow: 2px 2px 5px rgba(0,0,0,0.2);
            transition: background-color 0.3s;
        }

        .feedback-button:hover {
            background-color: #0056b3;
        }

    </style>

</head>

<body>
<div class="jumbotron">
    <div class="container text-center">
        <h1>Partly Parts</h1>
        <p>Parts, Parts & Parts</p>
    </div>
</div>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Items</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="Account.html"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
            <li><a href="Cart2.html"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>

        </ul>
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
                                        out.println("<li><a href=\"#\">" + category + "</a></li>");
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
                        <form class="navbar-form" role="search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
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
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin, adminPassword);

        //Find the # of rows in the part table

        String queryCount = "SELECT Count(*) FROM part";
        PreparedStatement psCount = con.prepareStatement(queryCount);
        ResultSet rsCount = psCount.executeQuery();
        int rowCount = 0;
        while (rsCount.next()) {
            rowCount = rsCount.getInt(1);
        }

        List<String> categoryList = new java.util.ArrayList<String>();
        List<String> nameList = new java.util.ArrayList<String>();
        List<Integer> priceList = new java.util.ArrayList<Integer>();
        List<String> descriptionList = new java.util.ArrayList<String>();
        List<String> urlList = new java.util.ArrayList<String>();


        String queryData = "SELECT * FROM part";
        PreparedStatement psData = con.prepareStatement(queryData);
        ResultSet rsData = psData.executeQuery();
        while (rsData.next()) { // iterates through table and adds to array
            categoryList.add(rsData.getString("Category"));
            nameList.add(rsData.getString("Name"));
            priceList.add(rsData.getInt("Sell Price"));
            descriptionList.add(rsData.getString("Description"));
            urlList.add(rsData.getString("URL"));

        }

        //Could also just loop through array size
        out.println( "<div class=\"container\">");
        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ FORMAT HERE
        for(int i = 0; i < rowCount; i++){
            if (i % 3 == 0) {
                if (i != 0) {
                    out.println("</div>"); // Close the previous row if it's not the first item
                }
                out.println("<div class=\"row\">"); // Start a new row
            }
            // displaying an item
            out.println("<div class=\"col-sm-4\">\n" + "<center>" +
                    "            <div class=\"panel panel-primary\">\n" +
                    "                <div class=\"panel-heading\">" + nameList.get(i) + "</div>\n" +
                    "                <div class=\"panel-body\"><img src='" + urlList.get(i) + "'" + "class=\"img-responsive\" style=\"width:75%\" alt=\"Image\"></div>\n" +
                    "                <div class=\"panel-footer\">" + descriptionList.get(i) + "</div>\n" +
                    "               <div class=\"panel-footer\">ADD TO CART</div>\n"  +
                    "            </div><center>" +
                    "        </div>");
        }
        // Close the last row
        out.println("</div>");
        out.print("</div>\n" + "</div><br>"); // Closing from above for loop.



        rsData.close();
        rsCount.close();
        psData.close();
        psCount.close();
        con.close();

    } catch (ClassNotFoundException | SQLException e) {
        out.println("Error from cataloge");
        out.println(e);
    }

%>

            <div id="feedback-button-container">
                <a href="Feedback%20Test.html" class="feedback-button">Give Feedback</a>
            </div>

</body>

</html>