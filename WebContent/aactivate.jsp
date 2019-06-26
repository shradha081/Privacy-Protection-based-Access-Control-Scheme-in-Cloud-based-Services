
<%@page import="DbCon.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
    <!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->

    <%
        String id = request.getParameter("id");
        System.out.println("aaaaaid===" + id);
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            con = DbConnection.getConnection();
            st = con.createStatement();
            int query = st.executeUpdate("Update aareg set status ='granted' where id='" + id + "'");
            if (query != 0) {
                response.sendRedirect("aadetail.jsp?msg==success");
            }




        } catch (Exception ex) {
            ex.printStackTrace();
        }

    %>
