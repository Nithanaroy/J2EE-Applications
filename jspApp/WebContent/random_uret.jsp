<%@page import="java.util.ArrayList"%>
<%@page import="level_one.random_sayi_uret"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Random Sayı Ureteci</title>
</head>
<body>
	<% 
		int adet = Integer.parseInt(request.getParameter("adet"));
		int basamak_sayisi = Integer.parseInt(request.getParameter("basamak"));
	%>
	<%
		ArrayList<String> sayilar = random_sayi_uret.sayi_uret(adet,basamak_sayisi);
		out.println("<ol>");
		for(String sayi : sayilar)
			out.println("<li>"+sayi+"<p>");
		out.println("</ol>");
	%>
</body>
</html>