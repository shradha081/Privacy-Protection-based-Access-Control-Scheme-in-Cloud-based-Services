package network;

import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DbCon.DbConnection;
/**
 *
 * @author IBN5
 */
@WebServlet("/UploadFile")
public class UploadFile extends HttpServlet {

    File file;
    final String filepath = "D:/";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            MultipartRequest m = new MultipartRequest(request, filepath);
            String rkey = m.getParameter("rkey");
            String pkey = m.getParameter("pkey");
            String fname = m.getParameter("fname");
            String vkey = m.getParameter("vkey");
            File file = m.getFile("file");
            String filename = file.getName().toLowerCase();

            Connection con = DbConnection.getConnection();
            BufferedReader br = new BufferedReader(new FileReader(filepath + filename));
            StringBuffer sb = new StringBuffer();
            String temp = null;

            while ((temp = br.readLine()) != null) {
                sb.append(temp);
            }

            KeyGenerator keyGen = KeyGenerator.getInstance("AES");
            keyGen.init(128);
            SecretKey secretKey = keyGen.generateKey();
            System.out.println("secret key:" + secretKey);

            Encryption e = new Encryption();
            String CipherText = e.encrypt(sb.toString(), secretKey);
            FileWriter fw = new FileWriter(file);
            fw.write(CipherText);
            fw.close();

            byte[] b = secretKey.getEncoded();
            String skey = Base64.encode(b);
            System.out.println("converted secretkey to string:" + skey);

            HttpSession user = request.getSession(true);
             String oid = (String) user.getAttribute("oid");
            String owner = user.getAttribute("oname").toString();

            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);

            boolean status = new Ftpcon().upload(file);
            if (status) {
                Statement st = con.createStatement();

                int i = st.executeUpdate("insert into fileupload(filename,content,owner,time,secret_key,public_key, rkey, oid, vkey)values('" + file.getName() + "','" + CipherText + "','" + owner + "','" + time + "','" + skey + "','" + pkey + "', '"+rkey+"','"+oid+"','"+vkey+"')");
                System.out.println(i);
                if (i != 0) {

                    response.sendRedirect("fileupload.jsp?msg=File_upload successfully");

                } else {
                    out.println("error while uploading additional informations");
                }
            } else {
                out.println("error");
            }

        } catch (Exception e) {
            out.println(e);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}























/*package network;

import com.oreilly.servlet.MultipartRequest;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DbCon.DbConnection;

*//**
 *
 * @author IBN5
 *//*
public class UploadFile extends HttpServlet {

    File file;
    final String filepath = "D:/";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            MultipartRequest m = new MultipartRequest(request, filepath);
            String rkey = m.getParameter("rkey");
            String pkey = m.getParameter("pkey");
            String fname = m.getParameter("fname");
            String vkey = m.getParameter("vkey");
            File file = m.getFile("file");
            String filename = file.getName().toLowerCase();

            Connection con = DbConnection.getConnection();
            BufferedReader br = new BufferedReader(new FileReader(filepath + filename));
            StringBuffer sb = new StringBuffer();
            String temp = null;

            while ((temp = br.readLine()) != null) {
                sb.append(temp);
            }

            KeyGenerator keyGen = KeyGenerator.getInstance("AES");
            keyGen.init(128);
            SecretKey secretKey = keyGen.generateKey();
            System.out.println("secret key:" + secretKey);

            Encryption e = new Encryption();
            String CipherText = e.encrypt(sb.toString(), secretKey);
            FileWriter fw = new FileWriter(file);
            fw.write(CipherText);
            fw.close();

            byte[] b = secretKey.getEncoded();
            String skey = Base64.encode(b);
            System.out.println("converted secretkey to string:" + skey);

            HttpSession user = request.getSession(true);
             String oid = (String) user.getAttribute("oid");
            String owner = user.getAttribute("oname").toString();

            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);

            boolean status = new Ftpcon().upload(file);
            if (status) {
                Statement st = con.createStatement();

                int i = st.executeUpdate("insert into fileupload(filename,content,owner,time,secret_key,public_key, rkey, oid, vkey)values('" + file.getName() + "','" + CipherText + "','" + owner + "','" + time + "','" + skey + "','" + pkey + "', '"+rkey+"','"+oid+"','"+vkey+"')");
                System.out.println(i);
                if (i != 0) {

                    response.sendRedirect("fileupload.jsp?msg=File_upload successfully");

                } else {
                    out.println("error while uploading additional informations");
                }
            } else {
                out.println("error");
            }

        } catch (Exception e) {
            out.println(e);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    *//**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *//*
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    *//**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *//*
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    *//**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     *//*
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
*/