
<%@ page import ="java.sql.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page="AdminCheck.jsp"/>

<!DOCTYPE html>
<html lang="en" data-theme="dark"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  <!-- Required meta tags -->

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
  <title>Feedback </title>
  <style>
    body {
      background-color: #333; /* Dark gray */
      color: white; /* Ensuring text is readable on dark background */
    }

    .rdp {
    --rdp-cell-size: 40px;
    --rdp-accent-color: #0000ff;
    --rdp-background-color: #1a1a1a;
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




  .rdp-with_weeknumber .rdp-table {
    max-width: calc(var(--rdp-cell-size) * 8);
    border-collapse: collapse;
  }


  .rdp-multiple_months .rdp-caption {
    position: relative;
    display: block;
    text-align: center;
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


  </style><style>.hidden-sidebar .Sidebar__TodoListContainer {
    display: none;
  }

  .hidden-sidebar .todo-list-header {
    display: none;
  }

  .hidden-sidebar .to-do-list {
    display: none;
  }


  body {
    --tfc-dark-mode-text-primary: #e4e4e7;
    --tfc-dark-mode-text-secondary: #71717a;
    --tfc-dark-mode-bg-primary: #27272a;
    --tfc-dark-mode-bg-primary-2: #3f3f46;
    --tfc-dark-mode-bg-secondary: #52525b;

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



  </style></head>
<!-- add border to the sides of the web page-->

<div  style="margin-bottom: 50px; border-radius: 0;" class="navbar">
  <a href="AdminHome.jsp">Partly</a>
</div>

<body  data-new-gr-c-s-check-loaded="14.1141.0" data-gr-ext-installed="">

<!-- card body-->
<div style="margin: 20px" class="card-body">
  <div class="mb-6">
    <h1 class="mb-0">Feedback</h1>
    <h4>Check the User Feedback.</h4>
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
  boolean feedbackSuccess = false;


  try {

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", admin, adminPassword);

    // Query to get distinct categories
    String queryFeedback = "SELECT * FROM `Feedback`";
    PreparedStatement psFeedback = con.prepareStatement(queryFeedback);
    ResultSet rsFeedback = psFeedback.executeQuery();


    List<Integer> FeedbackID = new ArrayList<>();
    List<String> Subject = new ArrayList<>();
    List<String> Body = new ArrayList<>();


    while (rsFeedback.next()) {
      FeedbackID.add(rsFeedback.getInt("FeedbackID"));
      Subject.add(rsFeedback.getString("Subject"));
      Body.add(rsFeedback.getString("Body"));

    }

    // Displaying the orders

    out.println("<div class=\"mb-8\" style=\"margin: 15px;\">");
    for (int i = 0; i < FeedbackID.size(); i++) {
      out.println(
              "<div class=\"border-bottom mb-3 pb-3 d-lg-flex align-items-center justify-content-between\">" +
                      "<div class=\"d-flex align-items-center justify-content-between\">" +
                      "<h3 class=\"mb-0\"><span style=\"font-weight:bold; color: #5DADE2\" >Feedback ID :</span> " + FeedbackID.get(i) + "</h3>" +
                      "<span class=\"ms-2\"><span style=\"font-weight:bold;\">Subject:</span> " + Subject.get(i) + "</span> <br>" +
                      "<span class=\"ms-2\"><span style=\"font-weight:bold;\">Body:</span> " + Body.get(i) + "</span>" +
                      "</div>" +
                      "</div>"+
                      "<hr />");


    }
    out.println("</div></div><br>");


    // Close resources
    rsFeedback.close();
    psFeedback.close();
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
