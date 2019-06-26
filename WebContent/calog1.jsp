<%-- 
    Document   : calog1
    Created on : Apr 27, 2017, 6:58:09 PM
    Author     : java3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    try {
        if (name.equalsIgnoreCase("ca") && pass.equalsIgnoreCase("ca")) {
            response.sendRedirect("cahome.jsp");
        } else {
            response.sendRedirect("calog.jsp");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }



%>