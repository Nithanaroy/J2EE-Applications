package hello;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/topluFormData")
public class topluFormData extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

    public topluFormData() 
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		
		writer.println("<!DOCTYPE html 4.0>" +
							"<html>" +
								"<head><title>Toplu Form Data</title></head>" +
								"<body bgcolor=pink style=\"text-align: center;\">" +
									"<table border=1>" +
										"<tr><th>ParamName<th>ParamValue</tr>"
					);
		Enumeration<String> paramsName = request.getParameterNames();
		while(paramsName.hasMoreElements())
		{
			String param = paramsName.nextElement();
			String [] paramValues = request.getParameterValues(param);
			
			if(paramValues == null)
				writer.println("<i>No Value</i>");
			else if(paramValues.length == 1)
				writer.println("<tr><td>"+param+"<td>"+paramValues[0]+"</tr>");
			else 
				for(String paramValue : paramValues)
					writer.println("<tr><td>"+param+"<td>"+paramValue+"</tr>");
		}
		writer.println("</table></body></html>");
	}
}
