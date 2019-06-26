<%-- <!DOCTYPE html>
<%@page import="com.javatpoint.dao.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% String id =request.getParameter("id");
String res="id";
System.out.println(id);
%>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    
    .jumbotron {
    padding-top: 30px;
    padding-bottom: 30px;
    margin-bottom: 30px;
    color: inherit;
    background-color: white;
}

    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
   
    .footer {
    margin-top: 100px;
    padding: 50px;
    text-align: center;
    background: #f8f8f8;
    color: black;
}
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
  
</head>
<!-- 
<form action="mail" method="post"> -->
<body>



<nav class="navbar navbar-inverse">
  <div class="container-fluid">
     <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.html">FeeReport</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="index.html">Home</a></li>
        <li><a href="AddStudentForm">Add Student</a></li>
        <li><a href="SearchViewStudentForm">View Student</a></li>
        
        <li><a href="SearchViewStudentForm">Total Students</a></li>
         <li><a href="SearchDueFeeForm">Search Due Fee</a></li>
        <li><a href="SearchStudentForm">Search Student</a></li>
        <li><a href="LogoutAccountant">Logout</a></li>
        </ul>

    </div>
  </div>
</nav> 

<hr>

<div class="container-fluid text-center">
<div class="jumbotron">    
  <div class="row content">
    <div class="col-sm-2 ">
    </div>
    <div class="col-sm-8 text-left"> 
      
  <h2 align="center">Report to Parent</h2>
  <form class="form-horizontal" action="MailerApp" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Email Id:</label>
      
      <div class="col-sm-10">
      <%
      try {
			System.out.print(id);
			/* 
    	  String user = (String)session.getAttribute("user"); */
    	  
			AccountantDao db = new AccountantDao();
    	  Connection con=DB.getCon();
			Statement st = con.createStatement();
			ResultSet rs;
			String sql = "select * from fee_student where id ='"+id+"'";
			System.out.print(sql);
			rs = st.executeQuery(sql);
			while (rs.next()) {
				String email = rs.getString("email"); 
      %>
        <input type="text" class="form-control" id="name" value=<%=email %> name="email">
      <%}
      }
      catch(Exception e){
    	  e.printStackTrace();
      }
			%>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd"></label>
      <div class="col-sm-10">
       <%
      try {
			System.out.print(id);
			/* 
    	  String user = (String)session.getAttribute("user"); */
    	  
			AccountantDao db = new AccountantDao();
    	  Connection con=DB.getCon();
			Statement st = con.createStatement();
			ResultSet rs;
			String sql = "select * from fee_student where id ='"+id+"'";
			System.out.println(sql);
			rs = st.executeQuery(sql);
			while (rs.next()) {
				String sid = rs.getString("id"); 
				String rollno = rs.getString("rollno"); 
				String name = rs.getString("name"); 
				String email = rs.getString("email");
				String sex = rs.getString("sex"); 
				String course = rs.getString("course"); 
				String sem = rs.getString("sem"); 
				String fee = rs.getString("fee"); 
				String paid = rs.getString("paid");
				String due = rs.getString("due");
				String address = rs.getString("address");
				String contact = rs.getString("contact");
				
				res = "<h2> Hello Parents </h2>"
				+"<br> <h2> DueFee Report of your Child </h2>"
				+"<table border='1' color='blue' id='example' style='width:60%'>"
				+"<thead>"
				
				+"</thead>"
				+"<tbody>"
				+"<tr><td class='labelName'>Rollno</td><td>"+rollno+"</td></tr>"
				+"<tr><td class='labelName'>Name</td>"
				+"<td>"+name+"</td>"
				+"</tr>"
				+"<tr><td class='labelName'>Email</td>"
				+"<td>"+email+"</td>"
				+"</tr>"
				+"<tr><td class='labelName'>Sex</td>"
				+"<td>"+sex+"</td>"
				+"</tr>"
				+"<tr><td class='labelName'>Course</td>"
				+"<td>"+course+"</td>"
				+"</tr>"
				+"<tr><td class='labelName'>Sem</td>"
				+"<td>"+sem+"</td>"
				+"</tr>"
				
				+"<tr><td class='labelName'>Fee</td>"
				+"<td>"+fee+"</td>"
				+"</tr>"
				+"<tr><td class='labelName'>Paid</td>"
				+"<td>"+paid+"</td>"
				+"</tr>"
				+"<tr><td class='labelName'>Due</td>"
				+"<td>"+due+"</td>"
				+"</tr>"
				+"<tr><td class='labelName'>Address</td>"
				+"<td>"+address +"%</td>"
				+"</tr>"
				+"<tr><td class='labelName'>Contact</td>"
				+"<td>"+contact+"</td>"
				+"</tr>"
   				+"</tbody></table>"
   				+"<br>"
   				+"Hope You Pay Remaining Fees by Date: ";
   				
	    			
 
			System.out.println(res);	
      %>
      
      <%}
      }
      catch(Exception e){
    	  e.printStackTrace();
      }
			%>          
        
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
      <input type="hidden" class="form-control" id="desc"  value="<%=res %>" name="desc" >
        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="SearchDueFeeForm"> Back</a>
      </div>
    </div>
   </form>

    </div>
    <div class="col-sm-2 ">
    </div>
  </div>
</div>
</div>


<footer class="container-fluid text-center">

      <div class="container-fluid footer">
<p>&copy;Copyright 2017 By: </p>
</div>
  <script src="resources/jquery.min.js"></script>
  <script src="resources/bootstrap.min.js"></script>


</footer>

</body>
</html>
 --%>