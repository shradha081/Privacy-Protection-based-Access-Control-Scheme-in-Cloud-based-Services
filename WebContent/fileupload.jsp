<%-- 
    Document   : fileupload
    Created on : Apr 27, 2017, 12:57:27 PM
    Author     : java3
--%>
<%@page import="network.CiperText"%>
<%@page import="network.UploadFile" %>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
    <!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
    <head>
        <title>Cloud Bases Services</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
    </head>
    <body id="top">
       
         <div class="wrapper row1">
            <header id="header" class="hoc clear"> 
               <div id="logo" class="fl_left">
                    <center><h1><a href="#">Privacy Protection based Access Control Scheme in Cloud-based Services</a></h1></center>
                </div>
  </header>
        </div>
    
        <div class="wrapper row2">
            <nav id="mainav" class="hoc clear"> 
                 <ul class="clear">
                    <li><a href="index.jsp">HOME</a></li>
                    <li><a class="drop" href="#">DATA USER</a>
                        <ul>
                            <li><a href="ulog.jsp">LOGIN</a></li>
                            <li><a href="ureg.jsp">REGISTRATION</a></li>

                        </ul>
                    </li>
                    <li class="active"><a class="drop" href="#">DATA OWNER</a>
                        <ul>
                            <li><a href="olog.jsp">LOGIN</a></li>
                            <li><a href="oreg.jsp">REGISTRATION</a></li>            
                        </ul>
                    </li>
                    <li><a class="drop" href="#">AA</a>
                        <ul>
                            <li><a href="aalog.jsp">LOGIN</a></li>
                            <li><a href="areg.jsp">REGISTRATION</a></li>            
                        </ul>
                    </li>
                    <!--        <li><a class="drop" href="#">Dropdown</a>
                              <ul>
                                <li><a href="#">Level 2</a></li>
                                <li><a class="drop" href="#">Level 2 + Drop</a>
                                  <ul>
                                    <li><a href="#">Level 3</a></li>
                                    <li><a href="#">Level 3</a></li>
                                    <li><a href="#">Level 3</a></li>
                                  </ul>
                                </li>
                                <li><a href="#">Level 2</a></li>
                              </ul>
                            </li>-->
                    <li><a href="calog.jsp">CA</a></li>
                    <li><a href="cloudlog.jsp">Cloud</a></li>
                </ul>
                <!-- ################################################################################################ -->
            </nav>
        </div>
        <%
            String pkey = (String) session.getAttribute("opkey");
            String oid = (String) session.getAttribute("oid");
            Random RANDOM = new SecureRandom();
            int PASSWORD_LENGTH = 4;
            String letters = "0123456789";
            String uid = "";
            for (int i = 0; i < PASSWORD_LENGTH; i++) {
                int index = (int) (RANDOM.nextDouble() * letters.length());
                uid += letters.substring(index, index + 1);
            }
String str = uid+pkey;
            String skey= null;
            CiperText enc = new CiperText();
            String vkey=enc.encrypt(str);
            System.out.println("view Key==="+vkey);
        %>
        <div class="wrapper row3">
            <main class="hoc container clear"> 



                <center><h6 class="heading">Upload File</h6></center><br><br>
                <div style="float: right;margin-right: 300px" id="comments">                       
                    <form action="UploadFile" method="post" enctype="multipart/form-data">
                        <div>
                            <label for="fnumber">File Number <span>*</span></label>
                            <input style="width: 250px;height: 35px;" type="text" name="rkey" id="name" value="<%=uid%>"  required>
                        </div><br>
                        <div>
                            <label for="pkey">Owner Public Key<span>*</span></label>
                            <input style="width: 250px;height: 35px;" type="text" name="pkey" id="url" value="<%=pkey%>" required >
                        </div><br>
                        <div>
                            <label for="email">File Name <span>*</span></label>
                            <input style="width: 250px;height: 35px;" type="text" name="fname" id="email" value=""  required>
                        </div><br>
                        <div>
                            <label for="view key">User View Key <span>*</span></label>
                            <input style="width: 250px;height: 35px;" type="text" name="vkey" id="email" value="<%=vkey%>"  required>
                        </div><br>
                        <div class="block clear">
                            <label for="state">File<span>*</span></label>
                            <input style="width: 250px;height: 35px;" type="file" class="inputs" name="file" required /><br> 
                        </div><br>                             
                        <div>
                            <input type="submit" name="submit" value="Upload">
                            &nbsp;
                            <input type="reset" name="reset" value="Reset Form">
                        </div>
                    </form>
                </div>

                <div style="width: 150px" class="sidebar"> 
                    <!-- ################################################################################################ -->
                    <h6>Side Menu Bar</h6>
                    <nav>                  
                        <li>
                            <ul>
                                <li><a href="ohome.jsp">Home</a></li>
                                <li><a href="fileupload.jsp">Upload File</a></li>
                                <li><a href="oviewfile.jsp">View Uploaded Files</a></li>
                                <li><a href="olog.jsp">Logout</a></li>
                            </ul>
                        </li>                              
                    </nav></div>


            </main>
        </div>

    </div>
    <!-- ################################################################################################ -->  



</body></html>














<%-- 
<%@page import="network.CiperText"%>
<%@page import="network.Upload_new" %>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="DbCon.DbConnection"%>

<%
	String name = (String) session.getAttribute("name");
	String email = (String) session.getAttribute("email");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
    <!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
    <head>
        <title>Cloud-based Services</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
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
    <body id="top">
    
      
       
        <div class="wrapper row1">
            <header id="header" class="hoc clear"> 
           
                <div id="logo" class="fl_left">
                    <center><h1><a href="#">Privacy Protection based Access Control Scheme in Cloud-based Services</a></h1></center>
                </div>

               
            </header>
        </div>
    
        <div class="wrapper row2">
            <nav id="mainav" class="hoc clear"> 
            
               <li><a href="ohome.jsp">Data Owner Home</a> </li>
                   <li class="active"><a href="fileupload.jsp">File Upload to Cloud</a></li>
            <li><a href="oviewfile.jsp">File Details</a></li>
                <li><a href="calog.jsp">Client Request</a></li>
        <li><a href="#">My Group</a> </li>
          <li><a href="index.jsp">Logout</a></li>
               
            </nav>
        </div>
        
			<%
				try {
					String user = request.getParameter("user");
					DbConnection db = new DbConnection();
					Connection con = db.getConnection();

					Statement st = con.createStatement();
					ResultSet rs;
					String sql = "select * from oreg where email='" + email + "' ";
					rs = st.executeQuery(sql);
					while (rs.next()) {
			%>
			
        <%
        
            String pkey = (String) session.getAttribute("opkey");
            String oid = (String) session.getAttribute("oid");
            Random RANDOM = new SecureRandom();
            int PASSWORD_LENGTH = 4;
            String letters = "0123456789";
            String uid = "";
            for (int i = 0; i < PASSWORD_LENGTH; i++) {
                int index = (int) (RANDOM.nextDouble() * letters.length());
                uid += letters.substring(index, index + 1);
            }
String str = uid+pkey;
            String skey= null;
            CiperText enc = new CiperText();
      /*       String vkey=enc.encrypt(str);
            System.out.println("view Key==="+vkey); */
        %>
        <div class="wrapper row3">
            <main class="hoc container clear"> 



                <center><h6 class="heading">Upload File</h6></center><br><br>
                <div style="float: right;margin-right: 300px" id="comments">   
                                    
                    <form action="Upload_new" method="post" enctype="multipart/form-data">
                    
                        <div class="block clear">
                            <label for="state">File<span>*</span></label>
                            <input style="width: 250px;height: 35px;" type="file" class="inputs" name="file" required=""  /><br> 
                        </div><br>                             
                        <div>
                            <input type="submit" name="submit" value="Upload">
                            &nbsp;
                            <input type="reset" name="reset" value="Reset Form">
                        </div>
                    </form>
                    <%
				}
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
        
                </div>

                <div style="width: 150px" class="sidebar"> 
                    <!-- ################################################################################################ -->
                    <h6>Side Menu Bar</h6>
                    <nav>                  
                        <li>
                            <ul>
                                <li><a href="ohome.jsp">Home</a></li>
                                <li><a href="fileupload.jsp">Upload File</a></li>
                                <li><a href="oviewfile.jsp">View Uploaded Files</a></li>
                                <li><a href="olog.jsp">Logout</a></li>
                            </ul>
                        </li>                              
                    </nav></div>


            </main>
        </div>

    </div>
    <!-- ################################################################################################ -->  



</body></html>




<%@page import="DbCon.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String name = (String) session.getAttribute("name");
	String email = (String) session.getAttribute("email");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>Cloud-Based Services</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
</head>
<body id="top">



	<div class="wrapper row1">
		<header id="header" class="hoc clear">

			<div id="logo" class="fl_left">
				<center>
					<h1>
						<a href="#">Privacy Protection based Access Control Scheme in
							Cloud-based Services</a>
					</h1>
				</center>
			</div>


		</header>
	</div>


	<div class="wrapper row2">
		<nav id="mainav" class="hoc clear">

			<ul class="clear">
				<li><a href="ohome.jsp">Data Owner Home</a></li>
				<li class="active"><a href="fileupload.jsp">File Upload to
						Cloud</a></li>
				<li><a href="">File Details</a></li>
				<li><a href="calog.jsp">Client Request</a></li>
				<li><a href="#">My Group</a></li>
				<li><a href="index.jsp">Logout</a></li>

			</ul>

		</nav>
	</div>



	<div class="wrapper row3">
		<main class="hoc container clear">



		<center>
			<h6 class="heading">Upload File</h6>
		</center>
		<br>
		<br>
		<div style="float: right; margin-right: 300px" id="comments">

			<%
				try {
					String user = request.getParameter("user");
					DbConnection db = new DbConnection();
					Connection con = db.getConnection();

					Statement st = con.createStatement();
					ResultSet rs;
					String sql = "select * from oreg where email='" + email + "' ";
					rs = st.executeQuery(sql);
					while (rs.next()) {
			%>
			

			<form action="UploadFile" method="post" enctype="multipart/form-data">
				<div class="one_third">
					<label for="name">Name <span>*</span></label> <input
						style="width: 250px; height: 35px;"
						value="<%=rs.getString("name")%>" type="text" name="name"
						id="name" value="" required>
				</div>
				<br> <br> <br> <br>
				
				
				<div class="one_third">
					<label for="email">Mail <span>*</span></label> <input
						style="width: 250px; height: 35px;"
						value="<%=rs.getString("email")%> type="email" name="email"
						id="email" value="" required>
				</div>
				<br> <br> <br> <br>

				

				<div class="one_third">
					<label for="contactnumber">Contact Number<span>*</span></label> <input
						style="width: 250px; height: 35px;"
						value="<%=rs.getString("cell")%>" type="text" name="cell"
						id="cell" value="" required>
				</div>
				<br> <br> <br> <br>
				
				<div class="one_third">
					<label for="filename">File Name <span>*</span></label> <input
						style="width: 250px; height: 35px;"
						 name="filename"
						id="filename" value="" required>
				</div>
				<br> <br> <br> <br>
				
				<div class="one_third">
					<label for="upload"><p>Upload File:</p></label> <input type="file"
						class="form-control" name="upload" id="file"
						placeholder="Upload File" value="upload" required>
				</div>
				<br> <br> <br> <br>


				<div>
					<input type="submit" name="submit" value="Upload"> &nbsp; <input
						type="reset" name="reset" value="Reset Form">
				</div>
			</form>

			<%
				}
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</div>

		<div style="width: 150px" class="sidebar">
			<!-- ################################################################################################ -->
			<h6>Side Menu Bar</h6>
			<nav>
				<li>
					<ul>
						<li><a href="ohome.jsp">Home</a></li>
						<li><a href="fileupload.jsp">Upload File</a></li>
						<li><a href="oviewfile.jsp">View Uploaded Files</a></li>
						<li><a href="olog.jsp">Logout</a></li>
					</ul>
				</li>
			</nav>
		</div>


		</main>
	</div>


	<!-- ################################################################################################ -->



</body>
</html> --%>