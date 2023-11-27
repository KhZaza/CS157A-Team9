<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="static java.lang.Integer.parseInt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Shopping Cart</title>

    <link rel="stylesheet" href="Cart.css" media="screen" title="no title" charset="utf-8">
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <meta name="robots" content="noindex,follow" />
</head>
<body>
<div class="shopping-cart">
    <!-- Title -->
    <div class="title">
        Shopping Bag
    </div>

    <!-- Product #1 -->
    <div class="item">
        <div class="buttons">
            <span class="delete-btn"></span>
            <span class="like-btn"></span>
        </div>

        <div class="image">
            <img src="item-1.png" alt="" />
        </div>

        <div class="description">
            <span>Common Projects</span>
            <span>Bball High</span>
            <span>White</span>
        </div>

        <div class="quantity">
            <button class="plus-btn" type="button" name="button">
                <img src="images/plus.svg" alt="" />
            </button>
            <input type="text" name="name" value="1">
            <button class="minus-btn" type="button" name="button">
                <img src="images/minus.svg" alt="" />
            </button>
        </div>

        <div class="total-price">$549</div>
    </div>



</div>


<%
    String db = "team9";
    String admin = "root";
    String adminPassword = "cs157a@zaza";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team9?autoReconnect=true&useSSL=false",
                admin,adminPassword);

        String queryCount = "SELECT Count(*) FROM part";
        PreparedStatement psCount = con.prepareStatement(queryCount);
        ResultSet rsCount = psCount.executeQuery();
        int rowCount = 0;
        while (rsCount.next()) {
            rowCount = rsCount.getInt(1);
        }

        List<String> nameList = new java.util.ArrayList<String>();
        List<Integer> priceList = new java.util.ArrayList<Integer>();
        List<String> urlList = new java.util.ArrayList<String>();

        String queryData = "SELECT * FROM part";
        PreparedStatement psData = con.prepareStatement(queryData);
        ResultSet rsData = psData.executeQuery();
        while (rsData.next()) { // iterates through table and adds to array
            nameList.add(rsData.getString("Name"));
            priceList.add(rsData.getInt("Sell Price"));
            urlList.add(rsData.getString("URL"));
        }
        for(int i = 0; i<nameList.size();i++) {
            out.print("<div class=\"item\">\n" +
                    "        <div class=\"buttons\">\n" +
                    "            <span class=\"delete-btn\"></span>\n" +
                    "            <span class=\"like-btn\"></span>\n" +
                    "        </div>\n" +
                    "\n" +
                    "        <div class=\"image\">\n" +
                    "            <img src= " + urlList.get(i) + "'/>\n" +
                    "        </div>\n" +
                    "\n" +
                    "        <div class=\"description\">\n" + "<span>" + nameList.get(i) + "</span\n" +
                    "        </div>\n" +
                    "\n" +
                    "        <div class=\"quantity\">\n" +
                    "            <button class=\"plus-btn\" type=\"button\" name=\"button\">\n" +
                    "                <img src=\"images/plus.svg\" alt=\"\" />\n" +
                    "            </button>\n" +
                    "            <input type=\"text\" name=\"name\" value=\"1\">\n" +
                    "            <button class=\"minus-btn\" type=\"button\" name=\"button\">\n" +
                    "                <img src=\"images/minus.svg\" alt=\"\" />\n" +
                    "            </button>\n" +
                    "        </div>\n" +
                    "\n" +
                    "        <div class=\"total-price\">$549</div>\n" +
                    "    </div>)");
        }
        rs_username.close();
        psUsername.close();
        con.close();

    } catch (ClassNotFoundException | SQLException e) {
        response.sendRedirect("SignUp.html");
    }
%>
<script type="text/javascript">
    $('.minus-btn').on('click', function(e) {
        e.preventDefault();
        var $this = $(this);
        var $input = $this.closest('div').find('input');
        var value = parseInt($input.val());

        if (value > 1) {
            value = value - 1;
        } else {
            value = 0;
        }

        $input.val(value);

    });

    $('.plus-btn').on('click', function(e) {
        e.preventDefault();
        var $this = $(this);
        var $input = $this.closest('div').find('input');
        var value = parseInt($input.val());

        if (value < 100) {
            value = value + 1;
        } else {
            value =100;
        }

        $input.val(value);
    });

    $('.like-btn').on('click', function() {
        $(this).toggleClass('is-active');
    });
</script>
</body>
</html>
