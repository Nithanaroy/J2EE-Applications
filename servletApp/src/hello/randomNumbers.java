package hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/randomNumbers")
public class randomNumbers extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
   
    public randomNumbers()
    {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		writer.println("<!DOCTYPE html 4.0>" +
							"<html>" +
								"<head><title>Random Numbers</title></head>" +
								"<body>" +
									"<b><i>Random Numbers</i></b>" +
									"<hr>" +
									"<table border=20>" +
										"<tr><th>RandomNumbersCount<th>RandomNumberValue</tr>"
					);
		for(int i = 0 ; i < 20 ; i++)
		{
			writer.println("<tr><td>"+i+"<td>"+Math.random()+"</tr>");
		}
		writer.println("<hr>");
	}
}
