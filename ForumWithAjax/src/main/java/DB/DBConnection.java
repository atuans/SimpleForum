package DB;
import java.sql.*;

public class DBConnection {

	public static Connection CreaterConnection() {
		
		Connection connection = null;
		
		String url= "jdbc:mysql://127.0.0.1:3306/Forum";
		
		String username="root";
		
		String password= "chitoge1234";
		
		//syntax to load Mysql into this
		
		try {
			
			//load Driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//create Driver
			connection =  DriverManager.getConnection(url,username,password);
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
			
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		
		return connection;
		
	}
}

//?useUnicode=true&amp;characterEncoding=utf8"