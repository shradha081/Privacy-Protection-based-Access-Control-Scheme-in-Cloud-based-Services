<%-- 
    Document   : view
    Created on : Apr 28, 2017, 10:47:49 AM
    Author     : java3
--%>

<%@page import="DbCon.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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

        <div class="wrapper row0">
            <div id="topbar" class="hoc clear"> 

            </div>
        </div>

        <div class="wrapper row1">
            <header id="header" class="hoc clear"> 
                <!-- ################################################################################################ -->
                <div id="logo" class="fl_left">
                    <center><h1><a href="#">Privacy Protection based Access Control Scheme in Cloud-based Services</a></h1></center>
                </div>

                <!-- ################################################################################################ -->
            </header>
        </div>

        <div class="bgded" style="background-image:url('images/demo/backgrounds/cloud.png');"> 

            <div class="wrapper overlay">
                <article id="pageintro" class="hoc clear"> 
                    <!-- ################################################################################################ -->
                    <h6 style="size:20 px"  >Privacy Protection based Access Control Scheme in Cloud-based Services</h6>


                </article>
            </div>
            
        </div>
        <div class="wrapper row2">
            <nav id="mainav" class="hoc clear"> 
                
                <ul class="clear">
                    <li class="active"><a href="index.jsp">HOME</a></li>
                    <li><a class="drop" href="#">DATA USER</a>
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
               <center> <h3>Attribute Authority's Details</h3></center><br><br><br>
                <div style="width: 700px;float: right" class="scrollable">
        <table>
          <thead>
            <tr>
              <th>Id</th>
              <th>Name</th>
              <th>Mail</th>             
              <th>Gender</th>
              <th>DOB</th>
              <th>Contact Number</th>
              <th>Country</th>
              <th>Status</th>
            </tr>
          </thead>
          <%
          String id = request.getParameter("id");
          System.out.println("aaid==="+id);
                                    Connection con = null;
                                    Statement st = null;
                                    ResultSet rs = null;
                                    try {
                                        con = DbConnection.getConnection();
                                        st = con.createStatement();
                                        rs = st.executeQuery("select * from aareg where id='"+id+"'");
                                        while(rs.next())
                                        
                                        {%>                    
            <tr>
              <td><%=rs.getString("id")%></td>
              <td><%=rs.getString("name")%></td>
              <td><%=rs.getString("mail")%></td>
              <td><%=rs.getString("gen")%></td>
              <td><%=rs.getString("dob")%></td>
              <td><%=rs.getString("contactnumber")%></td>
              <td><%=rs.getString("country")%></td>
              <td><%=rs.getString("status")%></td>
            </tr>
            
          
          <%} 
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>
        </table>
      </div>
        
        
        <div style="width: 250px" class="sidebar"> 
      <!-- ################################################################################################ -->
      <h6>Side Menu Bar</h6>
      <nav>
        
          
              <li>
                <ul>
                  <li><a href="cahome.jsp">Home</a></li>
                  <li><a href="aadetail.jsp">Attribute Authority Details</a></li>
                  <li><a href="causkey.jsp">Request for Secret Key</a></li>
                  <li><a href="caodetail.jsp">Data Owner Details</a></li>
                  <li><a href="caudetail.jsp">Data User Details</a></li>
                  <li><a href="cafiledetail.jsp">Uploaded File Details</a></li>
                  <li><a href="calog.jsp">Logout</a></li>
                </ul>
              </li>
            
          
        
      </nav></div></main></div>