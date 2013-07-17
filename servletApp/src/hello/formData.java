package hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/formData")
public class formData extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

    public formData() 
    {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<!DOCTYPE html 4.0>" +
							"<html>" +
								"<head><title>Requestten Veri Okuma</title></head>" +
								"<body>" +
									"<form>" +
										"Kullanýcý Adý : "+request.getParameter("userID")+"<p>"+
										"Parola : "+request.getParameter("password")+"<p>" +
										"Yas : "+request.getParameter("yas")+"<p>" +
										"Sehir : "+request.getParameter("place")+"<p>" +
										"Ulke : "+request.getParameter("ulke")+"<p>"+
									"</form>" +
								"</body>" +
							"</html>"
						);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
}
