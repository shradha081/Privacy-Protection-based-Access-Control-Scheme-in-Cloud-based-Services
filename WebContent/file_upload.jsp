

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="network.Upload_new" %>
<!DOCTYPE html>
<html>
    <style> 

.inputs {
    background: #f5f5f5;
    font-size: 0.8rem;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: none;
    padding: 10px 10px;
    width: 200px;
    margin-bottom: 20px;
    box-shadow: inset 0 2px 3px rgba( 0, 0, 0, 0.1 );
    clear: both;
}

.inputs:focus {
    background: #fff;
    box-shadow: 0 0 0 3px #fff38e, inset 0 2px 3px rgba( 0, 0, 0, 0.2 ), 0px 5px 5px rgba( 0, 0, 0, 0.15 );
    outline: none;
}
.inputss {
    background: #f5f5f5;
    font-size: 0.8rem;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: none;
    padding: 10px 10px;
    width: 200px;
    margin-bottom: 20px;
    box-shadow: inset 0 2px 3px rgba( 0, 0, 0, 0.1 );
    clear: both;
}

.inputss:focus {
    background: #fff;
    box-shadow: 0 0 0 3px #fff38e, inset 0 2px 3px rgba( 0, 0, 0, 0.2 ), 0px 5px 5px rgba( 0, 0, 0, 0.15 );
    outline: none;
}
.button {
    background-color: #0096da; /* Green */
    border: none;
    color: white;
    padding: 10px 23px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
</style> 
<head>
<title>Data Owner Home Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/droid_sans_400-droid_sans_700.font.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
</head>
                <%
           if (request.getParameter("status") != null) {
        %>
        <script>alert('Encrypted File Upload to Cloud');</script>
        <%
            }
        %>
                        <%
           if (request.getParameter("failed") != null) {
        %>
        <script>alert('This File Already Uploaded to Cloud');</script>
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
         <li><a href="pro_home.jsp"><span>Data Owner Home</span></a></li>
          <li class="active"><a href="file_upload.jsp"><span>File Upload </span></a></li>
          <li ><a href="file_de.jsp"><span>Uploaded File Details</span></a></li>
         <!-- <li><a href="file_update.jsp"><span>File Update</span></a></li> -->
           <li><a href="user_req.jsp"><span>User Request</span></a></li>
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
            <br><h2>File Upload to Cloud</h2><br>
         <div class="clr"></div>
         <!---Start Body --->
         <img src="images/en.jpg" width="360" height="200" alt="" />
         <div>
        <!--  <form action="Upload_new" method="post" enctype="multipart/form-data">  -->
          <form action="Upload_new" method="post" enctype="multipart/form-data"> 
             <!-- <br><input type="text" class="inputs" name="bookId" required="" placeholder="Book Id" /><br><br> -->
         <br><input type="file"class="inputs" name="file" required="" placeholder="File" /><br><br>
         <input type="Submit" value="Upload" class="button" >
             </form>
             </div>
         
         
         <!---End Body --->
      <br><br><br><br></div>
     </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="pro_home.jsp">Data Owner Home</a></li>
            <li><a href="file_upload.jsp">File Upload to Cloud</a></li>
            <li><a href="file_de.jsp">Uploaded File Details</a></li>
            <li><a href="user_req.jsp"><span>User Request</span></a></li>
            <!-- <li><a href="file_update.jsp">File Update</a></li> -->
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
