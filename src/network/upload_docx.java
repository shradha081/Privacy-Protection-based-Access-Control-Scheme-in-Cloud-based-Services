/*package network;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;

import DbCon.DbConnection;

import com.oreilly.servlet.MultipartRequest;

*//**
 * Servlet implementation class upload_docx
 *//*
@WebServlet("/upload_docx")
public class upload_docx extends HttpServlet {
	private static final long serialVersionUID = 1L;
	File file;
	final String filepath="D:/";  
    *//**
     * @see HttpServlet#HttpServlet()
     *//*
    public upload_docx() {
        super();
        // TODO Auto-generated constructor stub
    }

	*//**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	*//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		try {
		HttpSession session = request.getSession();
        String provider= (String) session.getAttribute("sssname");
        MultipartRequest m=new MultipartRequest(request,filepath);  
		File file = new File("file");
		String data1 =request.getParameter("file");
		String filename=file.getName().toLowerCase();
        System.out.println("File name"+filename);
        System.out.println("File data1"+data1);
		FileInputStream fis = new FileInputStream(filepath+filename);

		XWPFDocument document = new XWPFDocument(fis);

		List<XWPFParagraph> paragraphs = document.getParagraphs();
		
		System.out.println("Total no of paragraph "+paragraphs.size());
		for (XWPFParagraph para : paragraphs) {
			System.out.println(para.getText());
			
			 DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd G 'at' HH:mm:ss ");
		     Date date = new Date();
	             String time= dateFormat.format(date); 
	             System.out.println("current Date "+time);
	             
	             Random RANDOM = new SecureRandom();
                 int PASSWORD_LENGTH = 10;
                 String letters = "1234567890qwertyuioplkjhgfdsazxcvbnm1234567890";
                 String skey = "";
                
                 for (int i=0; i<PASSWORD_LENGTH; i++)
             {
            int index = (int)(RANDOM.nextDouble()*letters.length());
            skey += letters.substring(index, index+1);
             }
			String data =para.getText();
			Connection con1= DbConnection.getConnection();
            Statement st=con1.createStatement();
            
   
            int i=st.executeUpdate("insert into upload(filename,content,provider_name,time,secret_key,status)values('"+file.getName()+"','"+data+"','"+provider+"','"+time+"','"+skey+"','No')");
            System.out.println(i);
            if(i!=0){
               // out.println("success");
                response.sendRedirect("file_upload.jsp?status='uploded'");
                
            }
            else{
                out.println("error while uploading additional informations");
            }
		}
		fis.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	}

}
*/