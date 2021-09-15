<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DB.DBConnection" %>
<%@page import="java.sql.*" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
</head>
<body>


<div class="container">
					<c:forEach items="${listcomment }" var ="list">
					<div class="card p-3" id="mycomment">			    
               		<div class="d-flex justify-content-between align-items-center">
                    <span><small class="font-weight-bold text-primary">${list.name}</small> 
                    <small class="font-weight-bold">${list.usercontent}</small></span> </div> 
               		</div>
					</c:forEach> 
<div class="main-body p-0">
    <div class="inner-wrapper">
        
        <div class="inner-main">      
            <div class="inner-main-body p-2 p-sm-3 collapse forum-content show">
     
				   <%
                	
                		try{
                		String id = request.getParameter("id");
	                	Connection connection = DBConnection.CreaterConnection();
	            		Statement st = connection.createStatement();
	            		ResultSet rs = st.executeQuery("select * from Comment where id='"+id+"' ");
	            		
	            		while(rs.next())
	            		{

                	%> 
   
                <div class="card mb-2">
                    <div class="card-body p-2 p-sm-3">
                        <div class="media forum-item">
                            <a href="#" data-toggle="collapse" data-target=".forum-content"><img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="mr-3 rounded-circle" width="50" alt="User" /></a>
                            <div class="media-body">
                                <h6><%=rs.getString(1) %><a href="DisplayDiscussion.jsp?id=<%=rs.getString(1) %>"><%=rs.getString(2) %></a></h6>
                                <p class="text-secondary">
                                    <%=rs.getString(3) %>
                                </p>
                            </div>
                            
                        </div>
                    </div>
                </div>
             
             
            </div>
            </div>
            </div>
            </div>
            </div>
             
             
                <% 
            		}
            		}
     				catch(Exception e){
     					System.out.println(e);     					
     				}%>
                            

					

					
					
</body>
</html>