package level_one;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/requestHeader")
public class requestHeader extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

    public requestHeader()
    {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		String message = "Bilinmeyen Bir Browser Kullanýyorsunuz.";
		
		if(request.getHeader("User-Agent").indexOf("Firefox") != -1)
			message = "Siz Firefox Kullanýcýsýnýz";
		if(request.getHeader("User-Agent").indexOf("MSIE") != -1)
			message = "Siz Microsoft Internet Explorer Kullanýcýsýnýz";
		if(request.getHeader("User-Agent").indexOf("Chrome") != -1)
			message = "Siz Google Chrome Kullanýcýsýnýz";
		
		writer.println("<!DOCTYPE html 4.0>" +
							"<html>" +
								"<head><title>requestHeadaer</title></head>" +
								"<body bgcolor = \"pink\" style=\"text-align = center;\">" +
									message +
									"<form>" +
										"<table border=2>" +
											"<tr>" +
												"<td>" +
													"<b>RequestCharacterEncoding : </b>" +request.getCharacterEncoding() +
													" ---- <b>RequestContentLength : </b>"+request.getContentLength() +
													"<p><b>RequestContentType : </b>"+request.getContentType() +
													" ---- <b>RequestContextPath : </b>"+request.getContextPath() +
													"<p><b>RequestLocalAddress : </b>"+request.getLocalAddr() +
													" ---- <b>RequestLocalName : </b>"+request.getLocalName() +
													"<p><b>RequestLocalPort : </b>"+request.getLocalPort() +
													" ---- <b>RequestMethod : </b>"+request.getMethod() +
													"<p><b>RequestPathInfo : </b>"+request.getPathInfo() +
													" ---- <b>RequestPathTranslated : </b>"+request.getPathTranslated() +
													"<p><b>RequestProtocol : </b>"+request.getProtocol() +
													" ---- <b>RequestQueryString : </b>"+request.getQueryString() +
													"<p><b>RequestSessionID : </b>"+request.getRequestedSessionId() +
													" ---- <b>RequestServerName : </b>"+request.getServerName() +
													"<p><b>RequestServerPort : </b>"+request.getServerPort() +
													" ---- <b>RequestPath : </b>"+request.getServletPath() +
													"<p><b>RequestURL : </b>"+request.getRequestURL() +
													" ---- <b>RequestSession : </b>"+request.getSession() +
												"<td>" +
													"<table border = 2>"
					);
		Enumeration<String> headerNames = request.getHeaderNames();
		while(headerNames.hasMoreElements())
		{
			String  headerName = headerNames.nextElement();
			String headerValues = request.getHeader(headerName);
			writer.println("<tr><th>"+headerName+"<td><i>"+headerValues+"</i></tr>");
		}
		writer.println("</table></td></tr></table></body></html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
}
