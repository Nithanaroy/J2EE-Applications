package level_two;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/all_session_items")
public class all_session_items extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       

    public all_session_items() 
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setHeader("Refresh", "5; URL=\"./session_all_items.html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		String parametre_adi = request.getParameter("data");
		String parametre_degeri = request.getParameter("value");
		session.setAttribute(parametre_adi, parametre_degeri);
		
		Enumeration<String> paramNames = session.getAttributeNames();
		writer.println("<!DOCTYPE html>" +
							"<html>" +
								"<head><title>Session All Parameter</title></head>" +
								"<body>" +
									"<ul>");
		while(paramNames.hasMoreElements())
		{
			String paramName = paramNames.nextElement();
			writer.println("<li>"+paramName + " --- "+session.getAttribute(paramName));
		}
		writer.println("</ul></body></html>");
	}
}
