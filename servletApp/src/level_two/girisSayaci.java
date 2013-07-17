package level_two;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/girisSayaci")
public class girisSayaci extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
 
    public girisSayaci() 
    {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//response.setIntHeader("Refresh", 1);
		response.setCharacterEncoding("UTF-8");
		int giris_sayisi;
		PrintWriter writer = response.getWriter();
		Cookie [] cookie = null;
		cookie = request.getCookies();
		
		writer.println("<!DOCTYPE html>" +
							"<html>" +
								"<head>" +
									"<title>Cookie ile Sayac</title>" +
									"<meta content=\"text/html; charset=utf-8\">" +
								"</head>" +
								"<body>"
						);
		if(cookie != null)
		{
			for(Cookie cook : cookie)
			{
				giris_sayisi = Integer.parseInt(cook.getValue());
				cook.setValue(giris_sayisi+1+"");
				response.addCookie(cook);
				writer.println(cook.getName()+" adlý kullanýcýmýz "+cook.getValue()+". kere hosgeldiniz "+cook.getMaxAge() );
			}
		}
		else
		{
			Cookie newCookie = new Cookie("cook"+(int)(Math.random()*10), "0");
			newCookie.setMaxAge(10);
			response.addCookie(newCookie);
			writer.println(newCookie.getName()+" adlý kullanýcýmýz "+newCookie.getValue()+". kere hosgeldiniz" );
		}
		writer.println("</body></html>");
	}
}
