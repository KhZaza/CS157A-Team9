
<%@ page import ="java.sql.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en" data-theme="light"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  <!-- Required meta tags -->

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="Codescandy">

    <!-- Google tag (gtag.js) -->
    <script async="" src="./Order History/js"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'G-M8S4MT3EYG');
    </script>



    <script>
        // Render blocking JS:
        if (localStorage.theme) document.documentElement.setAttribute("data-theme", localStorage.theme);
    </script>

    <!-- Favicon icon-->


    <!-- Libs CSS -->
    <link href="./Order History/feather.css" rel="stylesheet">
    <link href="./Order History/bootstrap-icons.css" rel="stylesheet">
    <link href="./Order History/materialdesignicons.min.css" rel="stylesheet">
    <link href="./Order History/simplebar.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link rel="stylesheet" href="History.css">
    <title>Order History </title>
    </head>
<!-- add border to the sides of the web page-->

<nav style="border-radius: 0; margin-bottom: 0; background-color: #222; border: none; display: flex; justify-content: space-between; align-items: center; padding: 10px;">
    <div style= "margin-left:2px; margin-right: 2px; " class="navbar-header" style="margin: 0; display: flex; align-items: center;">
        <h1 style="margin: 0; color: white; font-size: 18px;">Partly</h1>
    </div>
    <div style="text-align: right;">
        <a href="LogOut.html" style="color: white; font-size: 16px; text-decoration: none; padding: 15px; display: inline-block;">
            <span class="glyphicon glyphicon-user" style="margin-right: 5px;"></span> Your Account
        </a>
    </div>
</nav>

<body  data-new-gr-c-s-check-loaded="14.1141.0" data-gr-ext-installed="">

<!-- card body-->
<div style="margin: 20px" class="card-body">
    <div class="mb-6">
        <h4 class="mb-0">Your Order</h4>
        <p>Check the status of recent orders.</p>
    </div>


    </div>



</div>
</section>
</main>
</div>

<%


    String db = "team9";
    String admin = "root";
    String adminPassword = "ivanachen";

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", admin, adminPassword);

            // Query to get distinct categories
            String queryOrders = "SELECT * FROM `order`";
            PreparedStatement psOrder = con.prepareStatement(queryOrders);
            ResultSet rsOrder = psOrder.executeQuery();


            List<Integer> orderIDList = new ArrayList<>();
            List<String> statusList = new ArrayList<>();
            List<Integer> TotalPriceList = new ArrayList<>();
            List<String> ContactInfolist = new ArrayList<>();
            List<String> shippingAddresslist = new ArrayList<>();
            List<String> PaymentMethodList = new ArrayList<>();


            while (rsOrder.next()) {
                orderIDList.add(rsOrder.getInt("OrderID"));
                statusList.add(rsOrder.getString("Status"));
                TotalPriceList.add(rsOrder.getInt("Total Price"));
                ContactInfolist.add(rsOrder.getString("Contact Info"));
                shippingAddresslist.add(rsOrder.getString("Shipping Address"));
                PaymentMethodList.add(rsOrder.getString("Payment Method"));

            }

            // Displaying the orders

            out.println("<div class=\"mb-8\" style=\"margin: 15px;\">");
            for (int i = 0; i < orderIDList.size(); i++) {
                out.println(
                        "<div class=\"border-bottom mb-3 pb-3 d-lg-flex align-items-center justify-content-between\">" +
                                "<div class=\"d-flex align-items-center justify-content-between\">" +
                                "<h5 class=\"mb-0\"><span style=\"font-weight:bold;\">CartID:</span> " + orderIDList.get(i) + "</h5>" +
                                "<span class=\"ms-2\"><span style=\"font-weight:bold;\">Status:</span> " + statusList.get(i) + "</span> <br>" +
                                "<span class=\"ms-2\"><span style=\"font-weight:bold;\">Payment Method:</span> " + PaymentMethodList.get(i) + "</span>" +
                                "<span class=\"ms-2\"><span style=\"font-weight:bold;\">shipping address:</span> " + shippingAddresslist.get(i) + "</span>" +
                                "</div>" +
                                "<div class=\"d-flex align-items-center justify-content-between\">" +
                                "<a href=\"\">Manage Order</a>" +
                                "<a href=\"\" class=\"ms-6\">View Invoice</a>" +
                                "<a href=\"\" class=\"ms-6\">Total Price: " + TotalPriceList.get(i) + "</a>" +
                                "</div>" +
                                "</div>");


            }
            out.println("</div></div><br>");


            // Close resources
            rsOrder.close();
            psOrder.close();
            con.close();



    } catch (ClassNotFoundException | SQLException e) {
        out.println("Error from history");
        out.println(e);
    }

%>




<!-- Scripts -->
<!-- Libs JS -->
<script src="./Order History/jquery.min.js.download"></script>
<script src="./Order History/bootstrap.bundle.min.js.download"></script>
<script src="./Order History/simplebar.min.js.download"></script>


<!-- Theme JS -->
<script src="./Order History/theme.min.js.download"></script>






</body><style>
    @media print {
        #simplifyJobsContainer {
            display: none;
        }
    }
</style><div id="simplifyJobsContainer" style="position: absolute; top: 0px; left: 0px; width: 0px; height: 0px; overflow: visible; z-index: 2147483647;"><span><template shadowrootmode="open"><link rel="stylesheet" href="chrome-extension://pbanhockgagggenencehbnadejlgchfc/css/styles.css"><style>
  :host {
      all: initial;
      line-height: 1.5;
      -webkit-text-size-adjust: 100%;
      -moz-tab-size: 4;
      -o-tab-size: 4;
      tab-size: 4;
      font-family: Palanquin, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  }
  * {
      scrollbar-width: thin;
      scrollbar-color: rgba(203, 213, 225, 1) transparent;
  }
  *::-webkit-scrollbar {
      width: 6px;
  }
  *::-webkit-scrollbar-track {
      background: transparent;
  }
  *::-webkit-scrollbar-thumb {
      background-color: rgba(203, 213, 225, 1);
      border-radius: 3px;
      border: 0;
  }
</style></template></span></div><script id="simplifyJobsPageScript" src="chrome-extension://pbanhockgagggenencehbnadejlgchfc/js/pageScript.bundle.js"></script><grammarly-desktop-integration data-grammarly-shadow-root="true"><template shadowrootmode="open"><style>
    div.grammarly-desktop-integration {
        position: absolute;
        width: 1px;
        height: 1px;
        padding: 0;
        margin: -1px;
        overflow: hidden;
        clip: rect(0, 0, 0, 0);
        white-space: nowrap;
        border: 0;
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select:none;
        user-select:none;
    }

    div.grammarly-desktop-integration:before {
        content: attr(data-content);
    }
</style><div aria-label="grammarly-integration" role="group" tabindex="-1" class="grammarly-desktop-integration" data-content="{&quot;mode&quot;:&quot;full&quot;,&quot;isActive&quot;:true,&quot;isUserDisabled&quot;:false}"></div></template></grammarly-desktop-integration>
</html>
