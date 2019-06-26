<%-- 
    Document   : ureg1
    Created on : Apr 26, 2017, 5:51:06 PM
    Author     : java3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DbCon.DbConnection"%>
<%
    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
//    int pass = Integer.parseInt(request.getParameter("pass"));
    String mail = request.getParameter("email");
    
   
    String cell = request.getParameter("cnum");
   
    String date = request.getParameter("date");
    System.out.println("print value :"+name+mail+pass+date+cell);
    Connection conn = DbConnection.getConnection();
    Statement sto = conn.createStatement();
    try {

        int i = sto.executeUpdate("insert into ureg(name, mail, pass, dob, contactnumber, pkey, status, skey, aaid, aamail)values('" + name + "','" + mail + "','" + pass + "','" + date + "','" + cell + "','waiting','give req','waiting','waiting','waiting')");
        if (i != 0) {                        
            System.out.println("success");
            response.sendRedirect("ulog.jsp");
        } else {
            System.out.println("failed");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>