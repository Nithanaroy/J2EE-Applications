<%@page import="proses.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
</head>
<jsp:useBean id="ogrenci" class="beans.tOgrenci" scope="session" />
<jsp:setProperty property="*" name="ogrenci" />
<body>
	<%
		String ad, soyad, adres, telefon, tc, ana_ad, baba_ad, dogum_yer, dogum_tarih, kayit_tarih;
		SimpleDateFormat format = new SimpleDateFormat("yy");
		String password = request.getParameter("password");

		tc = request.getParameter("tc");
		ana_ad = request.getParameter("ana_ad");
		baba_ad = request.getParameter("baba_ad");
		dogum_yer = request.getParameter("dogum_yeri");
		dogum_tarih = request.getParameter("dogum_tarihi");

		ad = ogrenci.getAd();
		soyad = ogrenci.getSoyad();
		adres = ogrenci.getAdres();
		telefon = ogrenci.getTelefon();

		String yıl = format.format(new Date());
		int fakulte_id = ogrenci.getFakulteID();
		int bolum_id = ogrenci.getBolumID();
		int ögrenci_sayisi = database_proses
				.bolumun_ogrenci_sayisi(bolum_id);

		//ögrenci numarası özel formda(yıl - fakulteNo - bolumNo - ogrenciSayisi) hesaplanıyor.
		String ogrenciID = ogrenci_no_hesapla.ogrenci_no(yıl, fakulte_id,
				bolum_id, ögrenci_sayisi);
		if (ad == null | soyad == null | adres == null | telefon == null
				| tc == null | ana_ad == null | baba_ad == null
				| dogum_tarih == null | dogum_yer == null) {
			out.println("<div class=\"alert alert-error\">Eksik Veri Girdiniz</div><p>"
					+ "<a href=\"ogrenci_ekle.jsp\"><input type=\"button\" value=\"Kayıt Sayfasına Dön\"></a>");
		} else {
			if (database_proses.ogrenci_ekle(ogrenciID, tc, ad, soyad,
					ana_ad, baba_ad, dogum_yer, dogum_tarih, adres,
					telefon, fakulte_id, bolum_id, password)) {
				out.println("<div class=\"alert alert-success\"> userID : "
						+ ogrenciID
						+ " parola : "
						+ password
						+ " Ad : "
						+ database_proses.isim_getir(ogrenciID, "tOgrenci")
						+ "</div><p>"
						+ "<a href=\"../Login.jsp\"><input type=\"button\" value=\"Giriş Sayfasına Git\"></a>");
			}
		}
	%>
</body>
</html>