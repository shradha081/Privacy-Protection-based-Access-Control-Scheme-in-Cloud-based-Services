<%-- <%-- 
    Document   : interkey
    Created on : Apr 28, 2017, 3:35:09 PM
    Author     : java3
--%>


<%@page import="network.CiperText"%>
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
        String aaid=(String)session.getAttribute("aaid");
        String aamail=(String)session.getAttribute("aamail");
        System.out.println("aaidddd==="+aaid);
        try {
            con = DbConnection.getConnection();
            st = con.createStatement();
            rs = st.executeQuery("Select * from ureg where id='" + id + "'");
            while (rs.next()) {
                String name = rs.getString("name");
                String mail = rs.getString("mail");
                String cell = rs.getString("contactnumber");
                String str = name + mail + cell;
                String skey = null;
                CiperText enc = new CiperText();
                String encc = enc.encrypt(str);
                System.out.println("pkey===" + encc);
                int query = st.executeUpdate("Update ureg set status ='generated',pkey ='" + encc + "',aaid='"+aaid+"',aamail='"+aamail+"' where id='" + id + "'");
                if (query != 0) {
                    response.sendRedirect("ukeyreq.jsp?msg==success");
                }

            }


            }  catch (Exception ex) {
            ex.printStackTrace();
        }

    %> --%>