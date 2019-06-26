/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DbCon;

/**
 *
 * @author java3
 */
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @suresh java3
 */
public class DbConnection {
    public static Connection getConnection()
    {
        Connection con = null;
        try{
             Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_privacy", "root", "admin");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}
