<%@page import="proses.database_proses"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
</head>
<jsp:useBean id="hoca" class="beans.tHoca" scope="session" />
<jsp:setProperty property="*" name="hoca" />
<body>
	<%
		String ad, soyad, adres, telefon;
		SimpleDateFormat format = new SimpleDateFormat("yy");
		String password = request.getParameter("password");

		String hocaID = hoca.getID();
		ad = hoca.getAd();
		soyad = hoca.getSoyad();
		telefon = hoca.getTelefon();
		int unvanID = hoca.getUnvanID();
		int idariGorevID = hoca.getIdariGorevID();
		if (ad == null | soyad == null | telefon == null) {
			out.println("<div class=\"alert alert-error\">Eksik Veri Girdiniz</div><p>"
					+ "<a href=\"hoca_ekle.jsp\"><input type=\"button\" value=\"Kayıt Sayfasına Dön\"></a>");
		} else {
			if (database_proses.hoca_ekle(hocaID + "", ad, soyad, telefon,
					unvanID, password, idariGorevID)) {
				out.println("<div class=\"alert alert-success\"> userID : "
						+ hocaID
						+ " parola : "
						+ password
						+ " Ad : "
						+ database_proses.isim_getir(hocaID, "tHoca")
						+ "</div><p>"
						+ "<a href=\"../Login.jsp\"><input type=\"button\" value=\"Giriş Sayfasına Git\"></a>");
			}
		}
	%>
</body>
</html>