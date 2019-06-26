<%-- 
    Document   : keyverify1
    Created on : Apr 29, 2017, 11:29:45 AM
    Author     : java3
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DbCon.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String key = request.getParameter("key");
String uid = (String)session.getAttribute("uid");
Connection con = DbConnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs=null;
    System.out.println("Enter user Name and Password:"+key+uid);
    try{
        rs=st.executeQuery("select * from ureg where skey='"+key+"' and id='"+uid+"'");
        if(rs.next()){
            
            session.setAttribute("uname", rs.getString("name"));
            session.setAttribute("uemail", rs.getString("mail"));
            session.setAttribute("uid", rs.getString("id"));
            response.sendRedirect("files.jsp");
        }else{
            response.sendRedirect("keyverify.jsp"); 
        }
    }catch(Exception ex){
        ex.printStackTrace();
    }
             
             %>













