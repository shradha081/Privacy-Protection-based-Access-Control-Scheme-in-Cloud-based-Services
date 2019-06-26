<%-- 
    Document   : olog1
    Created on : Apr 26, 2017, 5:47:03 PM
    Author     : java3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="DbCon.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String name = request.getParameter("name");
String pass = request.getParameter("pass");
System.out.println("owner===="+name+pass);
Connection con = DbConnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs=null;
    System.out.println("Enter user Name and Password:"+name+pass);
    try{
        rs=st.executeQuery("select * from oreg where name='"+name+"' and pass='"+pass+"'");
        if(rs.next()){
            
            session.setAttribute("oname", rs.getString("name"));
            session.setAttribute("oemail", rs.getString("mail"));
            session.setAttribute("oid", rs.getString("id"));
            session.setAttribute("opkey", rs.getString("pkey"));
            
            response.sendRedirect("ohome.jsp");
        }else{
            response.sendRedirect("olog.jsp"); 
        }
    }catch(Exception ex){
        ex.printStackTrace();
    }
             
             %>

