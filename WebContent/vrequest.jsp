<%-- 
    Document   : vrequest
    Created on : May 2, 2017, 6:52:31 PM
    Author     : java3
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DbCon.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String fid = request.getParameter("id");       
    String uid=(String)session.getAttribute("uid");
     String uname=(String)session.getAttribute("uname");
      String umail=(String)session.getAttribute("uemail");
    System.out.println("Fiddddddd ===="+fid);
    System.out.println("Uid ===="+uid);
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    try {
        con = DbConnection.getConnection();
        st = con.createStatement();
        rs = st.executeQuery("Select * from fileupload where id='" + fid + "'");
       
            while (rs.next()) {
                String fname = rs.getString("filename");
                
        int query = st.executeUpdate("insert into filerequest(fid, uid, status, fname, uname, umail, accesspolicy)values('" + fid + "','" + uid + "','requesting',+'"+fname+"','"+uname+"','"+umail+"','View')");
        if (query != 0) {
            response.sendRedirect("files.jsp?msg==success");
        }
            }


    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>