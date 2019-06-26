<%-- 
    Document   : cloudlog1
    Created on : May 2, 2017, 11:49:23 AM
    Author     : java3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    try {
        if (name.equalsIgnoreCase("cloud") && pass.equalsIgnoreCase("cloud")) {
            response.sendRedirect("cloudhome.jsp");
        } else {
            response.sendRedirect("cloudlog.jsp");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }



%>