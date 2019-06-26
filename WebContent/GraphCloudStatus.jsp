<%@page import="DbCon.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="com.google.gson.*" %>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%

	DbConnection db = new DbConnection();
	Connection con =db.getConnection();
    %>
<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Creating Charts with Data from a Database - fusioncharts.com</title>
 <script type="text/javascript" src="js/fusioncharts.js"></script>
  <script type="text/javascript" src="js/fusioncharts.charts.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/droid_sans_400-droid_sans_700.font.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
</head>

                <%
           if (request.getParameter("msg") != null) {
        %>
        <script>alert('Request Sent Successfully');</script>
        <%
            }
        %>
<body>
 
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1>Multiple Keyword Searching Approach over Encrypted Data on Cloud</h1>
      </div>
      <div class="searchform">
        <form id="formsearch" name="formsearch" method="post" action="#">
          <span>
          <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
          </span>
          <input name="button_search" src="images/search.gif" class="button_search" type="image" />
        </form>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li><a href="ahome.jsp"><span>Cloud Server Home</span></a></li>
          <li><a href="pro_de.jsp"><span>Data Owner Details</span></a></li>
          <li><a href="user_de.jsp"><span>User Details</span></a></li>
          <li><a href="file_details.jsp"><span>File Details</span></a></li>
              <li class="active"><a href="graph.jsp"><span>Graph</span></a></li>
          <!-- <li><a href="user_req.jsp"><span>User Request</span></a></li>
          <li><a href="file_ac.jsp"><span>Download Details</span></a></li> -->
          <li><a href="index.jsp"><span>Logout</span></a></li>
        </ul>
      </div>
      <!-- <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="335" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="335" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="335" alt="" /> </a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div> -->
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
    <div class="mainbar"> 
        <div class="article">
            <br><h2>File Count Graph - Top k file downloaded results : </h2><br>
         <div class="clr"></div>
         <!---Start Body --->
         <div id="chart"></div>
  <%@page import="network.FusionCharts" %>
 
 <%
        
            Gson gson = new Gson();


            // Form the SQL query that returns the top 10 most populous countries
            String sql="select count(filename), filename from download group by filename;";

            // Execute the query
            PreparedStatement pt=con.prepareStatement(sql);
            ResultSet rs=pt.executeQuery();

            // The 'chartobj' map object holds the chart attributes and data.
            Map<String, String> chartobj = new HashMap<String, String>();

            chartobj.put("caption", "Top k downloaded result");
            chartobj.put("showValues", "0");
            chartobj.put("theme", "zune");

            // Push the data into the array using map object.
            ArrayList arrData = new ArrayList();
            while(rs.next()) {
                Map<String, String> lv = new HashMap<String, String>();
                lv.put("label", rs.getString("filename"));
                lv.put("value", rs.getString("count(filename)"));
                arrData.add(lv);
            }

            //close the connection.
            rs.close();

            //create 'dataMap' map object to make a complete FC datasource.
             Map<String, String> dataMap = new LinkedHashMap<String, String>();
        /*
            gson.toJson() the data to retrieve the string containing the
            JSON representation of the data in the array.
        */
             dataMap.put("chart", gson.toJson(chartobj));
             dataMap.put("data", gson.toJson(arrData));

            FusionCharts columnChart= new FusionCharts(
                        //type of chart
                        "column2d",
                        //unique chart ID
                        "chart1",
                        //width and height of the chart
                        "700","400",
                        //div ID of the chart container
                        "chart",
                        //data format
                        "json",
                        //data source
                        gson.toJson(dataMap)
                    );

            %>

<!--    Step 5: Render the chart    -->
            <%=columnChart.render()%>
         
         
         
         
         <!---End Body --->
      <br><br><br><br></div>
     </div> 
     <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="ahome.jsp">Cloud Server Home</a></li>
            <li><a href="pro_de.jsp">Data Owner Details</a></li>
            <li><a href="user_de.jsp">User Details</a></li>
            <li><a href="file_details.jsp">File Details</a></li>
                <li><a href="graph.jsp"><span>Graph</span></a></li>
         
            <li><a href="index.jsp">Logout</a></li>
          </ul>
        </div>
        
      </div> 
      <div class="clr"></div>
    </div>
  </div>

  <div class="footer">
    <div class="footer_resize">
      <p class="lf">Copyright &copy; <a href="#"></a></p>
      <p class="rf">Design by <a target="_blank" href=""></a></p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
</body>
</html>