<%-- 
    Document   : index
    Created on : Apr 25, 2017, 6:11:35 PM
    Author     : java3
--%>

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
      <!-- ################################################################################################ -->
      <ul class="clear">
        <li><a href="index.jsp">HOME</a></li>
        
                    
        <li class="active"><a class="drop" href="#">DATA USER</a>
          <ul>
            <li><a href="ulog.jsp">LOGIN</a></li>
            <li><a href="ureg.jsp">REGISTRATION</a></li>
            
          </ul>
        </li>
                  
                  <li><a class="drop" href="#">DATA OWNER</a>
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
                <li><a href="calog.jsp">CA</a></li>
                    <li><a href="cloudlog.jsp">Cloud</a></li>
                
      
          <!-- <li><a href="index.jsp">Exit</a></li> -->
      
   
      </ul>
     
    </nav>
  </div>
<div class="wrapper row3">
  <main class="hoc container clear"> 
   <div class="group">
       <center><h6 class="heading">DATA USER REGISTRATION</h6></center><br><br>
       <div style="float: right">
      
         
<img style="width: 500px" src="images/demo/backgrounds/ureg.jpg" alt="" />
      </div>
      <div>
        <div id="comments">  
       <!--  <form method="post" action="Registration" enctype="multipart/form-data">     -->                 
      <form action="ureg1.jsp" method="get" enctype="multipart/form-data"> 
          <div class="one_third">
            <label for="name">Name <span>*</span></label>
            <input style="width: 250px;height: 35px;" type="text" name="name" id="name" value=""  required>
          </div><br><br><br><br>
            <div class="one_third">
            <label for="email">Mail <span>*</span></label>
            <input style="width: 250px;height: 35px;" type="email" name="email" id="email" value=""  required>
          </div><br><br><br><br>
          <div class="one_third">
            <label for="password">Password<span>*</span></label>
            <input style="width: 250px;height: 35px;" type="password" name="pass" id="url" value="" required="" >
          </div><br><br><br><br>
        
           <div class="one_third" >
            <label for="contactnumber">Contact Number<span>*</span></label>
            <input style="width: 250px;height: 35px;"  type="text" name="cnum" id="cnum" value="" required>
          </div><br><br><br><br>
           <div class="one_third">
           <label for="dob">DOB<span>*</span></label>   
            <input style="width: 250px;height: 35px;" name="date" type="date"  placeholder="Date of Birth" required=""/><br><br>  
          </div>
          
     <!--     <div class="one_third">
    <label for="upload"><p>Upload Image:</p></label>
    <input type="file" class="form-control" name= "upload" id="image" placeholder="Upload Image" value="upload" required>
  </div>
         -->  
          <div>
            <input type="submit" name="submit" value="Submit Form">
            &nbsp;
            <input type="reset" name="reset" value="Reset Form">
          </div>
        </form>
      </div>

      </div>
      <div class="one_half">
        <ul class="nospace group">
<!--          <li class="one_half first btmspace-50">-->
<!--         <img src="images/demo/backgrounds/" alt="" />-->
      </div>
    </div>   
      
  </main></div></body></html>