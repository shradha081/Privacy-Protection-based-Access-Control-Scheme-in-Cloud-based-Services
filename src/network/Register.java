package network;
import java.io.IOException;


import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import DbCon.DbConnection;

@WebServlet("/Registration")
@MultipartConfig(maxFileSize = 16177215)
public class Register extends HttpServlet {

	// database connection settings

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	    String name = request.getParameter("name");
	String email = request.getParameter("email");
	    String pass = request.getParameter("pass");

	    
	    String cell = request.getParameter("cell");
	   


   /* String image = request.getParameter("image"); */
		System.out.println("UReg Information :" + name + email + pass
				+ cell );

		InputStream inputStream = null;

		Part filePart = request.getPart("upload");
		if (filePart != null) {

			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			inputStream = filePart.getInputStream();
		}

		Connection conn = null; // connection to the database
		String message = null; // message will be sent back to client

		try {
			// connects to the database

			DbConnection dbcon = new DbConnection();
			conn = dbcon.getConnection();
			System.out.println("User Registration Information :" + name + email + pass
					+ cell );

			// constructs SQL statement
			String sql = "INSERT INTO ureg (name, email, pass,cell,image) values (?, ?, ?, ?, ?)";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, name);
			statement.setString(2, email);
			statement.setString(3, pass);
			statement.setString(4, cell);
			
		/*	statement.setString(5, image);*/

			if (inputStream != null) {
				statement.setBlob(5, inputStream);
			}

			int row = statement.executeUpdate();
			if (row > 0) {
				response.sendRedirect("ulog.jsp?msg=Success");
			} else {
				response.sendRedirect("ureg.jsp?msgg=Error");
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
}


