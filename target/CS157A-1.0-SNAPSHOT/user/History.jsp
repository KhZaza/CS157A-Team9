
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
    <link rel="stylesheet" href="./Order History/theme.min.css">
    <title>Order History </title>
    <style>.rdp {
        --rdp-cell-size: 40px;
        --rdp-accent-color: #0000ff;
        --rdp-background-color: #e7edff;
        --rdp-accent-color-dark: #3003e1;
        --rdp-background-color-dark: #180270;
        --rdp-outline: 2px solid var(--rdp-accent-color); /* Outline border for focused elements */
        --rdp-outline-selected: 2px solid rgba(0, 0, 0, 0.75); /* Outline border for focused _and_ selected elements */

        margin: 1em;
    }

    .rdp-vhidden {
        box-sizing: border-box;
        padding: 0;
        margin: 0;
        background: transparent;
        border: 0;
        -moz-appearance: none;
        -webkit-appearance: none;
        appearance: none;
        position: absolute !important;
        top: 0;
        width: 1px !important;
        height: 1px !important;
        padding: 0 !important;
        overflow: hidden !important;
        clip: rect(1px, 1px, 1px, 1px) !important;
        border: 0 !important;
    }

    /* Buttons */
    .rdp-button_reset {
        appearance: none;
        position: relative;
        margin: 0;
        padding: 0;
        cursor: default;
        color: inherit;
        outline: none;
        background: none;
        font: inherit;

        -moz-appearance: none;
        -webkit-appearance: none;
    }

    .rdp-button {
        border: 2px solid transparent;
    }

    .rdp-button[disabled] {
        opacity: 0.25;
    }

    .rdp-button:not([disabled]) {
        cursor: pointer;
    }

    .rdp-button:focus:not([disabled]),
    .rdp-button:active:not([disabled]) {
        color: inherit;
        border: var(--rdp-outline);
        background-color: var(--rdp-background-color);
    }

    .rdp-button:hover:not([disabled]) {
        background-color: var(--rdp-background-color);
    }

    .rdp-months {
        display: flex;
    }

    .rdp-month {
        margin: 0 1em;
    }

    .rdp-month:first-child {
        margin-left: 0;
    }

    .rdp-month:last-child {
        margin-right: 0;
    }

    .rdp-table {
        margin: 0;
        max-width: calc(var(--rdp-cell-size) * 7);
        border-collapse: collapse;
    }

    .rdp-with_weeknumber .rdp-table {
        max-width: calc(var(--rdp-cell-size) * 8);
        border-collapse: collapse;
    }

    .rdp-caption {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0;
        text-align: left;
    }

    .rdp-multiple_months .rdp-caption {
        position: relative;
        display: block;
        text-align: center;
    }

    .rdp-caption_dropdowns {
        position: relative;
        display: inline-flex;
    }

    .rdp-caption_label {
        position: relative;
        z-index: 1;
        display: inline-flex;
        align-items: center;
        margin: 0;
        padding: 0 0.25em;
        white-space: nowrap;
        color: currentColor;
        border: 0;
        border: 2px solid transparent;
        font-family: inherit;
        font-size: 140%;
        font-weight: bold;
    }

    .rdp-nav {
        white-space: nowrap;
    }

    .rdp-multiple_months .rdp-caption_start .rdp-nav {
        position: absolute;
        top: 50%;
        left: 0;
        transform: translateY(-50%);
    }

    .rdp-multiple_months .rdp-caption_end .rdp-nav {
        position: absolute;
        top: 50%;
        right: 0;
        transform: translateY(-50%);
    }

    .rdp-nav_button {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: var(--rdp-cell-size);
        height: var(--rdp-cell-size);
        padding: 0.25em;
        border-radius: 100%;
    }

    /* ---------- */
    /* Dropdowns  */
    /* ---------- */

    .rdp-dropdown_year,
    .rdp-dropdown_month {
        position: relative;
        display: inline-flex;
        align-items: center;
    }

    .rdp-dropdown {
        appearance: none;
        position: absolute;
        z-index: 2;
        top: 0;
        bottom: 0;
        left: 0;
        width: 100%;
        margin: 0;
        padding: 0;
        cursor: inherit;
        opacity: 0;
        border: none;
        background-color: transparent;
        font-family: inherit;
        font-size: inherit;
        line-height: inherit;
    }

    .rdp-dropdown[disabled] {
        opacity: unset;
        color: unset;
    }

    .rdp-dropdown:focus:not([disabled]) + .rdp-caption_label,
    .rdp-dropdown:active:not([disabled]) + .rdp-caption_label {
        border: var(--rdp-outline);
        border-radius: 6px;
        background-color: var(--rdp-background-color);
    }

    .rdp-dropdown_icon {
        margin: 0 0 0 5px;
    }

    .rdp-head {
        border: 0;
    }

    .rdp-head_row,
    .rdp-row {
        height: 100%;
    }

    .rdp-head_cell {
        vertical-align: middle;
        text-transform: uppercase;
        font-size: 0.75em;
        font-weight: 700;
        text-align: center;
        height: 100%;
        height: var(--rdp-cell-size);
        padding: 0;
    }

    .rdp-tbody {
        border: 0;
    }

    .rdp-tfoot {
        margin: 0.5em;
    }

    .rdp-cell {
        width: var(--rdp-cell-size);
        height: 100%;
        height: var(--rdp-cell-size);
        padding: 0;
        text-align: center;
    }

    .rdp-weeknumber {
        font-size: 0.75em;
    }

    .rdp-weeknumber,
    .rdp-day {
        display: flex;
        overflow: hidden;
        align-items: center;
        justify-content: center;
        box-sizing: border-box;
        width: var(--rdp-cell-size);
        max-width: var(--rdp-cell-size);
        height: var(--rdp-cell-size);
        margin: 0;
        border: 2px solid transparent;
        border-radius: 100%;
    }

    .rdp-day_today:not(.rdp-day_outside) {
        font-weight: bold;
    }

    .rdp-day_selected:not([disabled]),
    .rdp-day_selected:focus:not([disabled]),
    .rdp-day_selected:active:not([disabled]),
    .rdp-day_selected:hover:not([disabled]) {
        color: white;
        background-color: var(--rdp-accent-color);
    }

    .rdp-day_selected:focus:not([disabled]) {
        border: var(--rdp-outline-selected);
    }

    .rdp:not([dir='rtl']) .rdp-day_range_start:not(.rdp-day_range_end) {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
    }

    .rdp:not([dir='rtl']) .rdp-day_range_end:not(.rdp-day_range_start) {
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
    }

    .rdp[dir='rtl'] .rdp-day_range_start:not(.rdp-day_range_end) {
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
    }

    .rdp[dir='rtl'] .rdp-day_range_end:not(.rdp-day_range_start) {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
    }

    .rdp-day_range_end.rdp-day_range_start {
        border-radius: 100%;
    }

    .rdp-day_range_middle {
        border-radius: 0;
    }
    </style><style>.hidden-sidebar .Sidebar__TodoListContainer {
        display: none;
    }

    .hidden-sidebar .todo-list-header {
        display: none;
    }

    .hidden-sidebar .to-do-list {
        display: none;
    }

    #tfc-wall-rose {
        position: relative;
    }

    body {
        --tfc-dark-mode-text-primary: #e4e4e7;
        --tfc-dark-mode-text-secondary: #71717a;
        --tfc-dark-mode-bg-primary: #27272a;
        --tfc-dark-mode-bg-primary-2: #3f3f46;
        --tfc-dark-mode-bg-secondary: #52525b;

    }
    </style></head>
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


<%--    <div class="mb-8">--%>
<%--        <!-- text -->--%>
<%--        <div class="border-bottom mb-3 pb-3 d-lg-flex align-items-center justify-content-between ">--%>
<%--            <div class="d-flex align-items-center justify-content-between">--%>
<%--                <h5 class="mb-0">CartID: </h5>--%>
<%--                <span class="ms-2">Status: </span> <br>--%>


<%--                <span class="ms-2">Payment Method: </span>--%>
<%--                <span class="ms-2">shipping address: </span>--%>


<%--            </div>--%>
<%--            <div class="d-flex align-items-center justify-content-between">--%>
<%--                <!-- link -->--%>
<%--                <a href="">Manage Order</a>--%>
<%--                <a href="" class="ms-6 ">View Invoice</a>--%>
<%--                <a href="" class="ms-6 ">Total Price</a>--%>

<%--            </div>--%>
<%--        </div>--%>

<%--        <!-- row -->--%>
<%--        <div class="row justify-content-between align-items-center">--%>
<%--            <!-- col -->--%>
<%--            <div class="col-lg-8 col-12">--%>
<%--                <div class="d-md-flex">--%>
<%--                    <div>--%>
<%--                        <!-- img -->--%>
<%--                        <img src="./Order History/ecommerce-img-1.jpg" alt="" class="img-4by3-xl rounded">--%>
<%--                    </div>--%>
<%--                    <div class="ms-md-4 mt-2 mt-lg-0">--%>
<%--                        <!-- heading -->--%>
<%--                        <h5 class="mb-1">--%>
<%--                            White &amp; Red Nike Athletic Shoe--%>
<%--                        </h5>--%>
<%--                        <!-- text -->--%>
<%--                        <span>Color: <span class="text-dark">Orange</span>, Size:<span class="text-dark"> 10</span>--%>
<%--                          </span>--%>
<%--                        <!-- text -->--%>
<%--                        <div class="mt-3">--%>
<%--                            <h4>$49.00</h4>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--        </div>--%>

<%--        <hr class="my-3">--%>


<%--        <!-- row -->--%>

<%--        <div class="row justify-content-between align-items-center">--%>
<%--            <!-- col -->--%>
<%--            <div class="col-lg-8 col-12">--%>
<%--                <div class="d-md-flex">--%>
<%--                    <div>--%>
<%--                        <!-- img -->--%>
<%--                        <img src="./Order History/ecommerce-img-9.jpg" alt="" class="img-4by3-xl rounded">--%>
<%--                    </div>--%>
<%--                    <!-- text -->--%>
<%--                    <div class="ms-md-4 mt-2 mt-lg-0">--%>
<%--                        <!-- heading -->--%>
<%--                        <h5 class="mb-1">--%>
<%--                            Nike Black and White--%>
<%--                        </h5>--%>
<%--                        <span>Color: <span class="text-dark">Black</span>, Size:<span class="text-dark"> 11</span>--%>
<%--                          </span>--%>
<%--                        <div class="mt-3">--%>
<%--                            <h4>$79.00</h4>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

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

            out.println("<div class=\"mb-8\">");
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
