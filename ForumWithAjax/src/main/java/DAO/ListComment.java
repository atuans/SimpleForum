package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.PostCMT;
import DB.DBConnection;



public class ListComment {

	
public static List<PostCMT>  displayComments(Connection connection) {
		
		List<PostCMT> list = new ArrayList<PostCMT>();
		
		PreparedStatement preparedStatement =null;
		
		
		String sql = "select * from userComment ";
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			
			ResultSet rsResultSet = preparedStatement.executeQuery();
			
			
			
			while(rsResultSet.next()) {
				PostCMT cmt = new PostCMT();
	
				String name = rsResultSet.getString("name");
				 
				String usercontent = rsResultSet.getString("usercontent");
			
				cmt.setName(name);
				cmt.setUsercontent(usercontent);
				
				list.add(cmt);
				
			}
			
			preparedStatement.close();
			rsResultSet.close();
			System.out.println(list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	
	
	
}


}
