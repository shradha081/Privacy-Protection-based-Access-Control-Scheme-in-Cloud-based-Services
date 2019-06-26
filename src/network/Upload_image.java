/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DbCon.DbConnection;
import algorithm.Blowfish;
import algorithm.CpABE;
import algorithm.Ftpcon;

import java.security.SecureRandom;
import java.util.Random;

/**
 *
 * @author java4
 */

public class Upload_image extends HttpServlet {
File file;
final String filepath="D:/";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
         HttpSession session = request.getSession();
              String provider= (String) session.getAttribute("sssname");
           MultipartRequest m=new MultipartRequest(request,filepath);       
           File file=m.getFile("file");   
           String data1 =request.getParameter("file");
           String filename=file.getName().toLowerCase();
             System.out.println("File name"+filename);
             System.out.println("File data1"+data1);
            Connection con= DbConnection.getConnection();
            Statement st3=con.createStatement();
            ResultSet rt3=st3.executeQuery("select * from upload where filename='"+filename+"'");
            if(rt3.next()){
                response.sendRedirect("file_upload.jsp?failed='yes'");
            }
            else{
           //out.println("file location:"+filepath+"\n file name:"+filename+"\n");  
            
            BufferedReader br=new BufferedReader(new FileReader(filepath+filename));
            StringBuffer sb=new StringBuffer();
            String temp=null;
            
            while(( temp=br.readLine())!=null){
               sb.append(temp);              
           }       
            
            Blowfish bff= new Blowfish();
            bff.encrypt(filename, filepath);
                 System.out.println("string Buffer"+sb); 
            CpABE e=new CpABE();
           String IBE=e.encrypt(sb.toString());
           //storing encrypted file
            FileWriter fw=new FileWriter(file);
            fw.write(IBE);
            fw.close();
            System.out.println("string Buffer"+IBE); 
             //Secret Key
             Random RANDOM = new SecureRandom();
                     int PASSWORD_LENGTH = 10;
                     String letters = "1234567890qwertyuioplkjhgfdsazxcvbnm1234567890";
                     String skey = "";
                    
                     for (int i=0; i<PASSWORD_LENGTH; i++)
                 {
                int index = (int)(RANDOM.nextDouble()*letters.length());
                skey += letters.substring(index, index+1);
                 }
              
              // date and Time
             DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd G 'at' HH:mm:ss ");
	     Date date = new Date();
             String time= dateFormat.format(date); 
             System.out.println("current Date "+time);
     
            String len=file.length()+"bytes";
            
            //uploading file
           boolean status=new Ftpcon().upload(file);
            
           if(status){
                Connection con1= DbConnection.getConnection();
                Statement st=con1.createStatement();
                
       
                int i=st.executeUpdate("insert into upload(filename,content,provider_name,time,secret_key,status)values('"+file.getName()+"','"+IBE+"','"+provider+"','"+time+"','"+skey+"','No')");
                System.out.println(i);
                if(i!=0){
                   // out.println("success");
                    response.sendRedirect("file_upload.jsp?status='uploded'");
                    
                }
                else{
                    out.println("error while uploading additional informations");
                }
                	out.println("file stored");
                	out.println(file.length());
            }
            else{
                out.println("error");
            }
            }
        }
        catch(Exception e){
            out.println(e);
        }
        finally {            
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
