<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.Type"%>
<%@page import="proses.database_proses"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<title>GirisKontrol</title>
</head>
<body>

	<%		
		int uyeYetki;
		RequestDispatcher dispatcher;
		String ID = null;
		try
		{
			ID = request.getParameter("ID");
			uyeYetki = database_proses.user_sorgula(ID,request.getParameter("password").toString());
			session.setAttribute("ID", ID);
		}
		catch(Exception e)
		{
			uyeYetki = -1;
		}
		if(uyeYetki == -1)
		{
			out.println("<div class=\"alert alert-error\">Eksik yada Yanlış Veri Girdiniz</div><p>"+
					"<a href=\"Login.jsp\"><input type=\"button\" value=\"Login Sayfasına Dön\"></a>");
		}
		else if(uyeYetki == 0)
		{//Öğrenci
			database_proses.setID(ID+"");
			session.setAttribute("isim",database_proses.isim_getir(ID,"tOgrenci"));
			dispatcher = request.getRequestDispatcher("ogrenci_islemleri/ogrenci_islemleri.jsp");
			dispatcher.forward(request, response);
		}
		else if(uyeYetki == 1)
		{//Akademik Personel
			database_proses.setID(ID+"");
			session.setAttribute("isim",database_proses.isim_getir(ID,"tHoca"));
			dispatcher = request.getRequestDispatcher("hoca_islemleri/hoca_islemler.jsp");
			dispatcher.forward(request, response);
		}
		else if(uyeYetki == 2)
		{//Memur
			database_proses.setID(ID+"");
			session.setAttribute("isim",database_proses.isim_getir(ID,"tMemur"));
			dispatcher = request.getRequestDispatcher("memur_islemleri/memur_islemleri.jsp");
			dispatcher.forward(request, response);
		}
	%>
</body>
</html>