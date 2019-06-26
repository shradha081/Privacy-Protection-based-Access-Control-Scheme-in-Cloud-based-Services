
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="DbCon.DbConnection"%>
    <%@page import="java.sql.Statement"%>
    <%@page import="java.sql.DriverManager"%>
    <%@page import="java.sql.Connection"%>
    <%
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        System.out.println("Data User===" + name + pass);
        Connection con = DbConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = null;
        String statuss = null;
        System.out.println("Enter user Name and Password:" + name + pass);
        try {
            rs = st.executeQuery("select * from aareg where name='" + name + "' and pass='" + pass + "'");
            if (rs.next()) {
                statuss = rs.getString("status");
                session.setAttribute("aaname", rs.getString("name"));
                session.setAttribute("aamail", rs.getString("mail"));
                session.setAttribute("aaid", rs.getString("id"));
                if (statuss.equalsIgnoreCase("granted")) {


                    response.sendRedirect("aahome.jsp");
                } else {
                    response.sendRedirect("aalog.jsp?msggg=Not yet Activated..");
                }
            }
            response.sendRedirect("aalog.jsp?msgg=Failed");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    %>