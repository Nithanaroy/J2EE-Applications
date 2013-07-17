package level_two;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/session_girisSayisi")
public class session_girisSayisi extends HttpServlet
{
	private static final long serialVersionUID = 1L;
    public session_girisSayisi()
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setIntHeader("Refresh", 1);
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		String girisSayisi = (String) session.getAttribute("girisSayisi");
		
		if(girisSayisi == null)
		{
			session.setAttribute("girisSayisi", "1");
		}
		else
		{
			writer.println("<! DOCTYPE HTML 4.0>" +
								"<html>" +
									"<head><title>Session ile Giris Sayacý</title></head>" +
									"<body bgcolor=\"gray\" style=\"text-align : center;\">" +
										"<table border=2>" +
											"<tr><th>SessionID<th>GirisSayisi<th>CreationTime<th>LastAccessed<th>MAxInterval<th>Class</tr>" +
											"<tr><td>"+session.getId()+"<td>"+session.getAttribute("girisSayisi")+"<td>"+session.getCreationTime()+
												"<td>"+session.getLastAccessedTime()+"<td>"+session.getMaxInactiveInterval()+"<td>"+session.getClass()+
											"</tr>" +
										"</table>" +
									"</body>" +
								"</html>");
		}
		session.setAttribute("girisSayisi", Integer.parseInt((String) session.getAttribute("girisSayisi"))+1+"");
	}
}
