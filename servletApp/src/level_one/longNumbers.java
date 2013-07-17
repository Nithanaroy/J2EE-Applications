package level_one;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/longNumbers")
public class longNumbers extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public longNumbers() 
	{
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter writer = response.getWriter();
		String sayi_adet = request.getParameter("adet");
		String sayi_basamak = request.getParameter("basamak");
		
		if(sayi_adet != "" && sayi_basamak != "")
		{
			ArrayList<String> buyuk_sayilar = sayiOlustur(Integer.parseInt(sayi_adet), Integer.parseInt(sayi_basamak));
			writer.println("<!DOCTYPE html 4.0>" +
								"<html>" +
								"<head><title>Buyuk Sayilar</title></head>" +
								"<body bgcolor=\"gray\">" +
										"<ol>"
						);
			
			for(String sayi : buyuk_sayilar)
			writer.println("<li>"+sayi);
			writer.println("</ol></body></html>");
		}
	}
	public ArrayList<String> sayiOlustur(int sayi_adet , int sayi_basamak)
	{
		int sayac = 0;
		String buyuk_sayi = "";
		ArrayList<String> sayilar = new ArrayList<>();
		
		while(sayac < sayi_adet)
		{
			for(int i = 0; i < sayi_basamak ; i++)
			{
				buyuk_sayi = buyuk_sayi+(int)(Math.random()*10);
			}
			sayilar.add(buyuk_sayi);
			buyuk_sayi = "";
			sayac++;
		}
		return sayilar;
	}
}