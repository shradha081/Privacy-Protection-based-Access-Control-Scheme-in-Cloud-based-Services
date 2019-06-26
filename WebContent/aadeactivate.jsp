<%-- 
    Document   : aadeactivate
    Created on : Apr 28, 2017, 11:33:43 AM
    Author     : java3
--%>

<%@page import="DbCon.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id=request.getParameter("id");
System.out.println("iddd="+id);
Connection con = null;
try {
 Statement st,st1,st2,st3,st4 = null;
 ResultSet rs = null;
 con = DbConnection.getConnection();
 st = con.createStatement();
int i = st.executeUpdate("delete from aareg where id='"+id+"'");
 if (i != 0) {                                    
//st1=con.createStatement();
//int i = st1.executeUpdate("delete * from att_details where eid='"+id+"'");
//
//st2=con.createStatement();
//rs = st2.executeQuery("delete * from leave_req where eid='"+id+"'");
//
//st3=con.createStatement();
//rs = st3.executeQuery("delete * from salary where eid='"+id+"'");
//
//st4=con.createStatement();
//rs = st4.executeQuery("delete * from work where eid='"+id+"'");
// 
                                   
 System.out.println("Attribute Authority account  deleted successfully");
 response.sendRedirect("aadetail.jsp?msg=Success");
                                        }
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>