<%@page import="DB.DBConnection" %>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <title>Discussion</title>
    
    
     <script type="text/javascript">
		function Comment(){
		var xhttp;
		var name = document.loadComment.name.value;
		var usercontent = document.loadComment.usercontent.value;
		
		var url ="UserComment.jsp?usercontent="+usercontent+"&name="+name;
		
		if(window.XMLHttpRequest){
			xhttp = new XMLHttpRequest();
		}
		else{
			xhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	
		  xhttp.onreadystatechange = function() {				
			
			if(xhttp.readyState == 4){
				
				var data= xhttp.responseText;
				document.getElementById("mycomment").innerHTML = data;
			}
		}
		
		
		xhttp.open("POST",url,true);
		xhttp.send();
		}
		

	</script> 
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="css/fontawesome.min.css" />
   
</head>

<body>

<div class="container">
<div class="main-body p-0">
    <div class="inner-wrapper">
        
        <div class="inner-main">      
            <div class="inner-main-body p-19 p-sm-3 collapse forum-content show">
                
                
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
                            <a href="#" data-toggle="collapse" data-target=".forum-content"></a>
                            <div class="media-body">
                                <h6><%=rs.getString(1) %>.<a href="DisplayDiscussion.jsp?id=<%=rs.getString(1) %>"><%=rs.getString(2) %></a></h6>
                                <p class="text-secondary">
                                    <%=rs.getString(3) %>
                                </p>
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
                            
            </div>
           
    </div>
</div>
</div>
</div>




 <div class="container mt-9">
		    <div class="d-flex justify-content-center row">
		        <div class="col-md-8">
          
		           <form  method="post" name="loadComment">
		            <div class="d-flex flex-column comment-section">        
		                <div class="bg-light p-2">
		                    <div class="d-flex flex-row align-items-start"><img class="rounded-circle" src="https://i.imgur.com/RpzrMR2.jpg" width="40">
								<input class="form-control ml-1 shadow-none textarea" type="text" name="name" placeholder="Input your name"/>
		                   		 <textarea class="form-control ml-1 shadow-none textarea" name="usercontent" placeholder="Your comment here..."></textarea></div>
		                    <div class="mt-2 text-right">
               					 	<input type="button" class="btn btn-primary btn-block text-uppercase" value="Post" onclick ="Comment()" />
		                </div>
				            </div>
				        </div>
				    </form>
				    
				    
				     <span id="mycomment"> </span>
				  
		    </div>
		</div>
        </div>



<style type="text/css">
body{
    margin-top:20px;
    color: #1a202c;
    text-align: left;
    background-color: #e2e8f0;    
}
.inner-wrapper {
    position: relative;
    height: calc(100vh - 3.5rem);
    transition: transform 0.3s;
}
@media (min-width: 992px) {
    .sticky-navbar .inner-wrapper {
        height: calc(100vh - 3.5rem - 48px);
    }
}

.inner-main,
.inner-sidebar {
    position: absolute;
    top: 0;
    bottom: 0;
    display: flex;
    flex-direction: column;
}
.inner-sidebar {
    left: 0;
    width: 235px;
    border-right: 1px solid #cbd5e0;
    background-color: #fff;
    z-index: 1;
}
.inner-main {
    right: 0;
    left: 235px;
}
.inner-main-footer,
.inner-main-header,
.inner-sidebar-footer,
.inner-sidebar-header {
    height: 3.5rem;
    border-bottom: 1px solid #cbd5e0;
    display: flex;
    align-items: center;
    padding: 0 1rem;
    flex-shrink: 0;
}
.inner-main-body,
.inner-sidebar-body {
    padding: 1rem;
    overflow-y: auto;
    position: relative;
    flex: 1 1 auto;
}
.inner-main-body .sticky-top,
.inner-sidebar-body .sticky-top {
    z-index: 999;
}
.inner-main-footer,
.inner-main-header {
    background-color: #fff;
}
.inner-main-footer,
.inner-sidebar-footer {
    border-top: 1px solid #cbd5e0;
    border-bottom: 0;
    height: auto;
    min-height: 3.5rem;
}
@media (max-width: 767.98px) {
    .inner-sidebar {
        left: -235px;
    }
    .inner-main {
        left: 0;
    }
    .inner-expand .main-body {
        overflow: hidden;
    }
    .inner-expand .inner-wrapper {
        transform: translate3d(235px, 0, 0);
    }
}

.nav .show>.nav-link.nav-link-faded, .nav-link.nav-link-faded.active, .nav-link.nav-link-faded:active, .nav-pills .nav-link.nav-link-faded.active, .navbar-nav .show>.nav-link.nav-link-faded {
    color: #3367b5;
    background-color: #c9d8f0;
}

.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
    color: #fff;
    background-color: #467bcb;
}
.nav-link.has-icon {
    display: flex;
    align-items: center;
}
.nav-link.active {
    color: #467bcb;
}
.nav-pills .nav-link {
    border-radius: .25rem;
}
.nav-link {
    color: #4a5568;
}
.card {
    box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
}

.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: .25rem;
}

.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1rem;
}
</style>

<script type="text/javascript">

</script>
</body>
</html>