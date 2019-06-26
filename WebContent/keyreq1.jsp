<%-- 
    Document   : keyreq1
    Created on : Apr 28, 2017, 3:14:00 PM
    Author     : java3
--%>

<%@page import="java.sql.Connection"%>
<%@page import="DbCon.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
    <!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
    
          <%
          String id = request.getParameter("id");
          System.out.println("uuuuid==="+id);
                                    Connection con = null;
                                    Statement st = null;
                                    ResultSet rs = null;
                                    
                                    try {
                                        con = DbConnection.getConnection();
                                        st = con.createStatement();
                                  int query=st.executeUpdate("Update ureg set status ='waiting' where id='"+id+"'");
                                        if(query!=0)
                                        response.sendRedirect("keyreq.jsp?msg==success");
                                                                 
                                                                   
                                                                  
                                                                                                                                                                                                                        
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>