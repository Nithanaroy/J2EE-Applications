package islem;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.*;

@WebServlet("/bean_properties")
public class bean_properties extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		name_bean name = new name_bean("Marty", "Hall");
		
		company_bean company = new company_bean("coreservlets.com","J2EE Training and Consulting");
		
		employe_bean employe = new employe_bean(name, company);
		
		request.setAttribute("employe", employe);
		
		request.setAttribute("source", "request");
		HttpSession session = request.getSession();
		session.setAttribute("source", "session");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("./bean_properties.jsp");
		dispatcher.forward(request, response);
	}
}
