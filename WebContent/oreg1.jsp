
<%@page import="network.CiperText"%>
<%@page import="network.Mail"%>
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
    
    /* String gen = request.getParameter("gen"); */
    String cell = request.getParameter("cnum");
 
    String date = request.getParameter("date");
    System.out.println("print value :"+name+mail+pass+date+cell);
    Connection conn = DbConnection.getConnection();
    Statement sto = conn.createStatement();
    try {
String str = name+mail+cell;
            String skey= null;
            CiperText enc = new CiperText();
            String encc=enc.encrypt(str);
            System.out.println("pkey==="+encc);
        int i = sto.executeUpdate("insert into oreg(name, mail, pass, dob, contactnumber, pkey)values('" + name + "','" + mail + "','" + pass + "','" + date + "','" + cell + "','"+encc+"')");
        if (i != 0) {
            
            Mail ma= new Mail();
            ma.secretMail(encc,name,mail);
            
            String msg= "Public key "+encc;
            System.out.println("success");
            response.sendRedirect("olog.jsp");
        } else {
            System.out.println("failed");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>




























<%-- 
<%@page import="network.CiperText"%>
<%@page import="network.Mail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DbCon.DbConnection"%>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	  String cell = request.getParameter("cnum");
	String date = request.getParameter("date");
	
	//    int pass = Integer.parseInt(request.getParameter("pass"));

	/*  String gen = request.getParameter("gen"); */

	/*     String state = request.getParameter("state");
	 String country = request.getParameter("country");
	 String date = request.getParameter("date"); */
	 
	System.out.println("print value :" + name + email + pass + cell + date );
	Connection conn = DbConnection.getConnection();
	Statement sto = conn.createStatement();
	try {
		String str = name + email + cell;
		String skey = null;
		CiperText enc = new CiperText();
		String encc = enc.encrypt(str);
		System.out.println("pkey===" + encc);
		int i = sto
				.executeUpdate("insert into oreg(name, email, pass,contactnumber,date,pkey)values('"
						+ name
						+ "','"
						+ email
						+ "','"
						+ pass+ "','"+ cell + "','"+ date + "','"+ encc + "')");
		if (i != 0) {

			Mail ma = new Mail();
			ma.secretMail(encc, name, email);

			String msg = "Public key " + encc;
			System.out.println("success");
			response.sendRedirect("olog.jsp");
		} else {
			System.out.println("failed");
		}

	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>
  --%>