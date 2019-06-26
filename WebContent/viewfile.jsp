

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="network.Decryption"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DbCon.DbConnection"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>

<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>RAAC</title>
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
  
      <%
String dkey=request.getParameter("decrypt");
String uid=(String)session.getAttribute("uid");
String uname=(String)session.getAttribute("uname");
  Connection con = DbConnection.getConnection();
            Statement st = con.createStatement();
           

            ResultSet rt = st.executeQuery("select * from fileupload where vkey='"+dkey+"'");
            if (rt.next()) {
                String keys = rt.getString("secret_key");
                String fname = rt.getString("filename");
                String fid = rt.getString("id");
                System.out.println("download uid uname fid===== " + uid + uname + fid);
                InputStream is = rt.getAsciiStream("content");
                BufferedReader br = new BufferedReader(new InputStreamReader(is));
                StringBuffer sb = new StringBuffer();
                String temp = null;

                while ((temp = br.readLine()) != null) {
                    sb.append(temp);

                }
                               
                Decryption de = new Decryption();
              String str = de.decrypt(sb.toString(), keys);
System.out.println("decript==="+str);                      
%>
<center><h6 class="heading">File Content</h6></center><br><br><br>
<div id="comments" style="float: right;margin-right: 300px">
                               
         
          <div>
            <label for="name"> File  <span>*</span></label>
            <input style="width: 400px;height: 400px;" value="<%=str%>" type="text" name="vkey" id="" >
          </div><br><br><br><br>
           
        </div>
  <%
          }  
%>
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
      </nav></div>
  
  </main></div> 