<%@page import="proses.database_proses"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
</head>
<jsp:useBean id="memur" class="beans.tMemur" scope="session" />
<jsp:setProperty property="*" name="memur" />
<body>
	<%
		String ad, soyad, adres, telefon;
		String memurID = memur.getID();
		ad = memur.getAd();
		soyad = memur.getSoyad();
		telefon = memur.getTelefon();
		String password = request.getParameter("password");

		if (ad == null | soyad == null | telefon == null) {
			out.println("<div class=\"alert alert-error\">Eksik Veri Girdiniz</div><p>"
					+ "<a href=\"memur_ekle.jsp\"><input type=\"button\" value=\"Kayıt Sayfasına Dön\"></a>");
		} else {
			if (database_proses.memur_ekle(memurID, ad, soyad, telefon,
					password)) {
				out.println("<div class=\"alert alert-success\"> userID : "
						+ memurID
						+ " parola : "
						+ password
						+ "</div><p>"
						+ "<a href=\"../Login.jsp\"><input type=\"button\" value=\"Giriş Sayfasına Git\"></a>");
			}
		}
	%>
</body>
</html>