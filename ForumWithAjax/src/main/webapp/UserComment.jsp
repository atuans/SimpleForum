<%@page import="DB.DBConnection" %>
<%@page import="java.sql.*" %>
<%@page import="BEAN.PostCMT" %>
<%@page import="java.util.*" %>
<%@page import="DAO.ListComment" %>


<%

String id= request.getParameter("id");
session.setAttribute("id", id);
String name = request.getParameter("name");
String usercontent = request.getParameter("usercontent");



try{
	PostCMT cmt = new PostCMT();
	cmt.setName(name);
	cmt.setUsercontent(usercontent);
	
	Connection connection = DBConnection.CreaterConnection();
	PreparedStatement preparedStatement = connection.prepareStatement("insert into userComment(name,usercontent) values(?,?)");
	preparedStatement.setString(1, name);
	preparedStatement.setString(2, usercontent);
	preparedStatement.executeUpdate();
	
	
	List<PostCMT> list = ListComment.displayComments(connection);		
	request.setAttribute("listcomment", list);
	RequestDispatcher rd = request.getRequestDispatcher("ShowListComment.jsp");
	rd.forward(request, response);
 

} catch (Exception e) {
	System.out.println(e);
/* 	response.sendRedirect("test.jsp?message=wrong");
 */

}

%>
 