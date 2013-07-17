<%@page import="bean.kitapci"%>
<%@page import="islemler.kitap_bilgi_sifrele"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Veri_Sifrele</title>
</head>
<body>
	<% 
		String kitap_ismi = request.getParameter("kitap_adi");
		String kitap_yazari = request.getParameter("kitap_yazari");
		String kitap_fiyati = request.getParameter("kitap_fiyati");
	%>
	<% 
		String sifreli_kitap_adi = kitap_bilgi_sifrele.sifreli_veri(kitap_ismi);
		String sifreli_kitap_yazari = kitap_bilgi_sifrele.sifreli_veri(kitap_yazari);
		String sifreli_kitap_fiyati = kitap_bilgi_sifrele.sifreli_veri(kitap_fiyati);
		out.println(
					"kitap_adi ---- kitap_yazari ---- kitap_fiyati<p>"+kitap_ismi+" ---- "+kitap_yazari+" ---- "+kitap_fiyati+" ---- <p>"
					+ sifreli_kitap_adi+" ---- "+sifreli_kitap_yazari+" ---- "+sifreli_kitap_fiyati+"<p>"
					);
	%>
</body>
</html>