
<%@ page import ="java.sql.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    //prevents caching at the proxy server so it updates after refreshing
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0);
%>
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
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
            </ul>
        </div>
    </div>
</nav>

<%



    String db = "team9";
    String admin = "root";
    String adminPassword = "ivanachen";

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

                /*
                String [] categoryArray = new String[rowCount];
                String[] nameArray = new String[rowCount];
                int[] sellArray = new int[rowCount];
                String[] descriptionArray = new String[rowCount];
                String[] urlArray = new String[rowCount];
                 */
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
            out.println("<div class=\"col-sm-4\">\n" + "<center>" +
                    "            <div class=\"panel panel-primary\">\n" +
                    "                <div class=\"panel-heading\">" + nameList.get(i) + "</div>\n" +
                    "                <div class=\"panel-body\"><img src='" + urlList.get(i) + "'" + "class=\"img-responsive\" style=\"width:75%\" alt=\"Image\"></div>\n" +
                    "                <div class=\"panel-footer\">" + descriptionList.get(i) + "</div>\n" +
                    "               <div class=\"panel-footer\">ADD TO CART</div>\n"  +
                    "            </div><center>" +
                    "        </div>");
        }
        out.print("</div>\n" +
                "</div><br>"); // Closing from above for loop.
        rsData.close();
        rsCount.close();
        psData.close();
        psCount.close();
        con.close();

    } catch (ClassNotFoundException | SQLException e) {
        out.println("Error from cat");
        out.println(e);
    }

%>
</body>

</html>