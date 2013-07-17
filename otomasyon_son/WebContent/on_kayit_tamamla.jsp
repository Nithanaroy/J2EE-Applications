<%@page import="proses.database_proses"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>On Kayit Tamamla</title>
</head>
<body>
	<%
		String tc, ad, soyad, ana_ad, baba_ad, dogum_yer, dogum_tarih, cep_tel, adres, kayit_tarihi, not;
		int mezuniyet_notu, bolumID;

		tc = request.getParameter("tc");
		ad = request.getParameter("ad");
		soyad = request.getParameter("soyad");
		ana_ad = request.getParameter("ana_ad");
		baba_ad = request.getParameter("baba_ad");
		dogum_yer = request.getParameter("dogum_yeri");
		dogum_tarih = request.getParameter("dogum_tarihi");
		cep_tel = request.getParameter("telefon");
		adres = request.getParameter("adres");
		bolumID = Integer
				.parseInt(request.getParameter("bolum").toString());
		not = request.getParameter("puan");
		if (tc.trim().equals("") | ad.trim().equals("")
				| soyad.trim().equals("") | ana_ad.trim().equals("")
				| baba_ad.trim().equals("") | dogum_yer.trim().equals("")
				| dogum_tarih.trim().equals("") | cep_tel.trim().equals("")
				| adres.trim().equals("") | not.trim().equals("")) {
			out.println("<div class=\"alert alert-error\">Eksik Veri Girdiniz</div><p>"
					+ "<a href=\"basvuru_form.jsp\"><input type=\"button\" value=\"Kayıt Sayfasına Dön\"></a>");
		} else {
			mezuniyet_notu = Integer.parseInt(not);
			if (mezuniyet_notu <= 100) {
				if (database_proses.on_kayit(tc, ad, soyad, ana_ad,
						baba_ad, dogum_yer, dogum_tarih, adres, cep_tel,
						bolumID, mezuniyet_notu)) {
					out.println("<div class=\"alert alert-success\"> <h2>Kaydınız Başarılı Şekilde Alınmıştır.</h2></div>");
				} else {
					out.println("<div class=\"alert alert-error\">Kayıt Yapılamadı.TC'nizi kontrol Ediniz.</div><p>"
							+ "<a href=\"basvuru_form.jsp\"><input type=\"button\" value=\"Kayıt Sayfasına Dön\"></a>");
				}
			}
			else
			{
				out.println("<div class=\"alert alert-error\">Notunuzu 100 üzerinden giriniz.</div><p>"
						+ "<a href=\"basvuru_form.jsp\"><input type=\"button\" value=\"Kayıt Sayfasına Dön\"></a>");
			}
		}
	%>
</body>
</html>