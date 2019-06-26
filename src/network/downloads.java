/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package network;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import network.downloads;

/**
 *
 * @author IBN33
 */
public class downloads extends HttpServlet {

    private static Connection getConnection() {
        throw new UnsupportedOperationException("Not yet implemented");
    }

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
           
            String dkey = request.getParameter("decrypt");
            System.out.println();
            HttpSession user = request.getSession();
            String uid = user.getAttribute("uid").toString();
            String uname = user.getAttribute("uname").toString();


            Connection con = downloads.getConnection();
            Statement st1 = con.createStatement();
            Statement st = con.createStatement();

            ResultSet rt = st.executeQuery("select * from fileupload where secret_key='" + dkey + "' ");
            if (rt.next()) {
                String fname = rt.getString("filename");
                String fid = rt.getString("id");
                System.out.println("download uid uname fid===== " + uid + uname + fid);
                InputStream is = rt.getAsciiStream("content");
                BufferedReader br = new BufferedReader(new InputStreamReader(is));
                StringBuffer content = new StringBuffer();
                String temp = null;

                while ((temp = br.readLine()) != null) {
                    content.append(temp);
                    content.append("\n");
                }
                response.setHeader("Content-Disposition", "attachment;filename=\"" + fname + "\"");
                out.write(content.toString());

                int i = st1.executeUpdate("insert into downloads (uid, uname, fid, fname, time_)values('" + uid + "','" + uname + "','" + fid + "','" + fname + "',now())");

                if (i != 0) {
                    // response.sendRedirect("download.jsp");
                } else {
                    out.println("error  while updating information...");
                }
            } else {
                out.println("file not found...");
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