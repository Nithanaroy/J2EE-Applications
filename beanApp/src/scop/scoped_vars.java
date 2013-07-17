package scop;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/scoped_vars")
public class scoped_vars extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public scoped_vars() 
    {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setAttribute("att1", "Merhaba");
		HttpSession session = request.getSession();
		session.setAttribute("att2", "Merhaba2");
		ServletContext application = getServletContext();
		application.setAttribute("att3", "Merhaba3");
		
		request.setAttribute("source", "Request");
		session.setAttribute("source", "Session");
		application.setAttribute("source", "Application");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("./scoped_vars.jsp");
		dispatcher.forward(request, response);
	}
}
