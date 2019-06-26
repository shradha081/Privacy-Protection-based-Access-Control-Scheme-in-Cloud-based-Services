<%-- 
    Document   : keyverify
    Created on : Apr 29, 2017, 10:41:57 AM
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
                <!-- ################################################################################################ -->
                <div id="logo" class="fl_left">
                    <center><h1><a href="#">Privacy Protection based Access Control Scheme in Cloud-based Services</a></h1></center>
                </div>

                <!-- ################################################################################################ -->
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
        <div class="wrapper row3">
            <main class="hoc container clear"> 
                <center><h6 class="heading">Key Verification for Access Files</h6></center><br><br><br>
                <div id="comments" style="float: right;margin-right: 300px">

                    <form action="keyverify1.jsp" method="get" enctype="multipart/form-data">
                        <div>
                            <label for="name">Key Verify  <span>*</span></label>
                            <input style="width: 250px;height: 35px;" type="text" name="key" id="name" value=""  required>
                        </div><br><br><br>
                        <div>
                            <input  type="submit" name="submit" value="Verify">
                            &nbsp;
                            <input type="reset" name="reset" value="Reset Form">
                        </div>
                    </form></div>


                <div style="width: 200px" class="sidebar"> 
                    <!-- ################################################################################################ -->
                    <h6>Side Menu Bar</h6>
                    <nav>


                        <li>
                            <ul>
                                <li><a href="uhome.jsp">Home</a></li>
                                <li><a href="keyreq.jsp">Key Request</a></li>
                                <li><a href="keyverify.jsp">Key Verification</a></li>
                                <li><a href="ulog.jsp">Logout</a></li>
                            </ul>
                        </li>



                    </nav></div><br><br><br>
                <center> <p>(Note: Here Enter your secret key for Access the Files)</p></center>
            </main></div>>