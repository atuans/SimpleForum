package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.PostCMT;

import DAO.ListComment;
import DB.DBConnection;


@WebServlet("/ListCommentController")
public class ListCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListCommentController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getCharacterEncoding()!=null){
					
			request.setCharacterEncoding("UTF-8");
			
			
			
			try {
				String name = request.getParameter("name");
				String usercontent = request.getParameter("usercontent");
				Connection connection =DBConnection.CreaterConnection();
				PostCMT cmt = new PostCMT();
				cmt.setName(name);
				cmt.setUsercontent(usercontent);
				List<PostCMT> list = ListComment.displayComments(connection);
				request.setAttribute("listcomment", list);

				
				RequestDispatcher rd = request.getRequestDispatcher("ShowListComment.jsp");
				rd.forward(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}
			}
			}
	

}
