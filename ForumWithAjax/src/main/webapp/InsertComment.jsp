<%@page import="DB.DBConnection" %>
<%@page import="java.sql.*" %>




<%

String id= request.getParameter("id");
session.setAttribute("id", id);

String title = request.getParameter("title");
String content = request.getParameter("content");

try {
	
	Connection connection = DBConnection.CreaterConnection();
	PreparedStatement preparedStatement = connection.prepareStatement("insert into Comment(title,content) values(?,?)");
	preparedStatement.setString(1, title);
	preparedStatement.setString(2, content);
	preparedStatement.executeUpdate();
	response.sendRedirect("MainPage.jsp?message=done");

	
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("MainPage.jsp?message=failed");


}


%>