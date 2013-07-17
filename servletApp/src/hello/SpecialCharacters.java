package hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SpecialCharacters")
public class SpecialCharacters extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public SpecialCharacters() 
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		writer.println("<!DOCTYPE html 4.0>" +
							"<html>" +
								"<head><title>Special Characters</title>" +
								"<body bgcolor=gray style=\"text-align: center;\">" +
									"<table border=1>" +
										"<tr><th><i>Girilen Karakterler</i><th>GirilenOzelKarakterler</tr>"
					);
		String data = request.getParameter("characters");
		if(data != null)
			for(int i = 0 ; i < data.length() ; i++)
			{
				if(data.charAt(i) == '<')
					writer.println("<tr><td> <td>&lt;</tr>");
				else if(data.charAt(i) == '>')
					writer.println("<tr><td> <td>&qt;</tr>");
				else if(data.charAt(i) == '"')
					writer.println("<tr><td> <td>&quot;</tr>");
				else if(data.charAt(i) == '&')
					writer.println("<tr><td> <td>&amp;</tr>");
				else
					writer.println("<tr><td>"+data.charAt(i)+"<td>"+data.charAt(i)+"</tr>");
			}
		else
			writer.println("<tr><td><i>No Value</i><td><i>No Value</i>");
		writer.println("</table></body></html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
}
