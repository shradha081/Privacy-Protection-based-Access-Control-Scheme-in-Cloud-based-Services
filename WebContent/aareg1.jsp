<%-- 
    Document   : aareg1
    Created on : Apr 27, 2017, 5:58:44 PM
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

    String gen = request.getParameter("gen");
    String cell = request.getParameter("cnum");
    String state = request.getParameter("state");
    String country = request.getParameter("country");
    String date = request.getParameter("date");
    System.out.println("print value :" + name + mail + pass + gen + date + cell + state + country);
    Connection conn = DbConnection.getConnection();
    Statement sto = conn.createStatement();
    try {

        int i = sto.executeUpdate("insert into aareg(name, mail, pass, gen, dob, contactnumber, state, country, status)values('" + name + "','" + mail + "','" + pass + "','" + gen + "','" + date + "','" + cell + "','" + state + "','" + country + "','waiting')");
        if (i != 0) {
            System.out.println("success");
            response.sendRedirect("aalog.jsp");
        } else {
            System.out.println("failed");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>