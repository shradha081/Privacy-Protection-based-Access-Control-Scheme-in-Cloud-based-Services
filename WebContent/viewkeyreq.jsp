<%-- 
    Document   : viewkeyreq
    Created on : May 3, 2017, 11:33:39 AM
    Author     : java3
--%>
<%@page import="network.Mail"%>
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
                
                <ul class="clear">
                    <li><a href="index.jsp">HOME</a></li>
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
                    <li class="active"><a href="cloudlog.jsp">Cloud</a></li>
                </ul>
                <!-- ################################################################################################ -->
            </nav>
        </div>
        
        <div class="wrapper row3">
            <main class="hoc container clear"> 
               <center> <h3>File View Key Requests</h3></center>
               <div style="width: 250px" class="sidebar"> 
      <!-- ################################################################################################ -->
      <h6>Side Menu Bar</h6>
      <nav>
        
          
              <li>
                <ul>
                  <li><a href="aahome.jsp">Home</a></li>
                  <li><a href="ukeyreq.jsp"> Data User Key Request</a></li>
                  <li><a href="aaudetail.jsp">Data User Details</a></li>
                  <li><a href="aaodetail.jsp">Data Owner Details</a></li>
                  <li><a href="decryptkey.jsp">File Download Key Request</a></li>
                  <li><a href="viewkeyreq.jsp">File View Key Request</a></li>
                   <li><a href="aafiledetail.jsp">File Details</a></li>
                  <li><a href="index.jsp">Logout</a></li>
                </ul>
              </li>
            
          
        
      </nav></div><br><br><br>
      <div class="scrollable">
        <table>
          <thead>
            <tr>
              <th>File Id</th>
              <th>File Name</th>
              <th>Data User Id</th>
              <th>Data User Name</th>              
              <th>Data User Mail</th>
              <th>Send Decrypt And View Key</th>
            </tr>
          </thead>
          <%
          
          
                                    Connection con = null;
                                    Statement st = null;
                                    ResultSet rs = null;
                                    try {
                                        con = DbConnection.getConnection();
                                        st = con.createStatement();                                         
                                        rs = st.executeQuery("select * from filerequest where status='requesting' and accesspolicy='view'");
                                        while(rs.next())
                                     
                                        {
                                  
                                  session.setAttribute("fidd", rs.getString("fid"));
                                  session.setAttribute("umail", rs.getString("umail"));      
                                  
                                  %>                    
            <tr>
              <td><%=rs.getString("fid")%></td>
              <td><%=rs.getString("fname")%></td>
              <td><%=rs.getString("uid")%></td>
              <td><%=rs.getString("uname")%></td>
              <td><%=rs.getString("umail")%></td>
              <td><a href="send1.jsp?id=<%=rs.getString("id")%>">Send</a></td>
             
            </tr>
            
          
          <%} 
                                        
                                        
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>
        </table>
      </div>
        
        
        </main></div>




