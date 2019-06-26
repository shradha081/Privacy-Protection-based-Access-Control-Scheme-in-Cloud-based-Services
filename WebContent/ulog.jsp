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
     <div class="wrapper row4">
  <footer id="footer" class="hoc clear"> 
    
<center><h6 class="heading">DATA USER LOGIN</h6></center>
    
       <div style="float: right">
        <ul class="nospace group">
<!--          <li class="one_half first btmspace-50">-->
<img style="width: 500px" src="images/demo/backgrounds/log.jpg" alt="" />
      </div> 
      <div class="one_third">
      <form method="get" action="ulog1.jsp">
        <fieldset>
          <legend>Newsletter:</legend>
          <label for="name">User Name <span>*</span></label>
          <input class="btmspace-15" name="name" type="text" value="" placeholder="Name"><br>
          <label for="name">Password <span>*</span></label>
          <input class="btmspace-15" name="pass" type="password" value="" placeholder="Password">
          <button type="submit" value="submit">Submit</button>
              
        
        </fieldset>
      </form>
        
    </div>
    <!-- ################################################################################################ -->
  </footer>
</div>                                                              
  </main>
</div>