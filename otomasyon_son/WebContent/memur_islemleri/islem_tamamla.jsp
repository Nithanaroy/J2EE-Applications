<%@page import="java.util.ArrayList"%>
<%@page import="proses.database_proses"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
</head>
<body style="color: #FFEBCD">
	<%
		if (request.getParameter("islem").equals("ders_ekle")) {
	%>
	<jsp:useBean id="ders" class="beans.tDers" />
	<jsp:setProperty property="*" name="ders" />
	<%
		int bolum_ders_sayisi = database_proses
					.bolumun_ders_sayisi(ders.getBolumID());
			String dersAd = ders.getDersAd();
			int teorik = ders.getTeorik();
			int uygulama = ders.getUygulama();
			int kredi = ders.getKredi();
			String yariyil = ders.getYariyil();
			int bolumID = ders.getBolumID();
			int fakulteID = ders.getFakulteID();
			String dersKod = database_proses.Ders_kod(ders.getBolumID())
					+ bolum_ders_sayisi;
			ArrayList<Object> dersKodlari = database_proses
					.veri_getir("select dersKod from tDers");
			for (Object dersKodu : dersKodlari) {
				if (dersKodu.equals(dersKod)) {
					bolum_ders_sayisi = bolum_ders_sayisi + 1;
					dersKod = database_proses.Ders_kod(ders.getBolumID())
							+ bolum_ders_sayisi;
				}
			}

			if (dersKod == null | dersAd == null | yariyil == null
					| bolumID == 0 | fakulteID == 0) {
				out.println("<div class=\"alert alert-error\">Eksik yada Yanlış Veri Girdiniz</div><p>"
						+ "<a href=\"ders_ekle.jsp\"><input type=\"button\" value=\"Kayıt Sayfasına Dön\"></a>");
			} else {
				if (database_proses.ders_ekle(dersKod, dersAd, teorik,
						uygulama, kredi, yariyil, bolumID, fakulteID)) {
					out.println("<div class=\"alert alert-success\"> dersAd : "
							+ dersAd
							+ " kredi : "
							+ kredi
							+ " teorik : "
							+ teorik
							+ " uygulama : "
							+ uygulama
							+ " yariyil : "
							+ yariyil
							+ "</div><p>"
							+ "<a href=\"ders_ekle.jsp\"><input type=\"button\" value=\"Ders Ekleme Sayfasına Dön\"></a>");
				} else {
					out.println("<div class=\"alert alert-error\">Ders Eklenemedi.Tekrar deneyiniz</div><p>"
							+ "<a href=\"ders_ekle.jsp\"><input type=\"button\" value=\"Kayıt Sayfasına Dön\"></a>");
				}
			}
		} else if (request.getParameter("islem").equals("ders_sil")) {
			String dersKod = null;
			String dersAd = null;
			if (request.getParameter("dersKod") != null) {
				dersKod = request.getParameter("dersKod");
				dersAd = ""
						+ database_proses.veri_getir(
								"select dersAd from tDers where dersKod='"
										+ dersKod + "'").get(0);
				if (dersKod.trim().equals("") | dersKod == null) {
					out.println("<div class=\"alert alert-error\">Silinecek dersin verilerini kontrol ediniz.</div><p>"
							+ "<a href=\"ders_sil.jsp\"><input type=\"button\" value=\"Ders Sil Sayfasına Dön\"></a>");
				} else {
					if (database_proses.ders_sil(dersKod)) {
						out.println("<div class=\"alert alert-success\"> dersAd : "
								+ dersAd
								+ " silindi.</div>"
								+ "<p><a href=\"ders_sil.jsp\"><input type=\"button\" value=\"Ders Sil Sayfasına Dön\"></a>");
					}
				}
			} else {
				out.println("<div class=\"alert alert-error\">Silinecek Ders Yok.Ders Eklemelisiniz.</div><p>"
						+ "<a href=\"ders_ekle.jsp\"><input type=\"button\" value=\"Ders Ekleme Sayfasına Dön\"></a>");
			}
		} else if (request.getParameter("islem").equals("ders_guncelle")) {
			String dersKod = null;
			String dersAd = null;

			if (request.getParameter("ders") != null) {
				dersKod = request.getParameter("ders");
				dersAd = request.getParameter("dersAd");
				int teorik = Integer.parseInt(request
						.getParameter("teorik") + "");
				int uygulama = Integer.parseInt(request
						.getParameter("uygulama") + "");
				int kredi = Integer.parseInt(request.getParameter("kredi")
						+ "");
				String yariyil = request.getParameter("yariyil");
				int bolumID = Integer.parseInt(request
						.getParameter("bolumID") + "");
				int fakulteID = Integer.parseInt(request
						.getParameter("fakulteID") + "");

				if ((yariyil == null) | (bolumID == 0) | (fakulteID == 0)) {
					out.println("<div class=\"alert alert-error\">Güncellenecek dersin verilerini kontrol ediniz.</div><p>"
							+ "<a href=\"ders_guncelle.jsp\"><input type=\"button\" value=\"Ders Güncelle Sayfasına Dön\"></a>");
				} else {
					if (database_proses.ders_guncelle(dersKod, dersAd,
							teorik, uygulama, kredi, yariyil, bolumID,
							fakulteID)) {
						out.println("<div class=\"alert alert-success\"> dersAd : "
								+ dersAd
								+ " kredi : "
								+ kredi
								+ " teorik : "
								+ teorik
								+ " uygulama : "
								+ uygulama
								+ " yariyil : "
								+ yariyil
								+ "</div><p>"
								+ "<a href=\"ders_guncelle.jsp\"><input type=\"button\" value=\"Ders Güncelle Sayfasına Dön\"></a>");
					}
				}
			} else {
				out.println("<div class=\"alert alert-error\">Güncellenecek ders yok.Ders Eklemelisiniz.</div><p>"
						+ "<a href=\"ders_guncelle.jsp\"><input type=\"button\" value=\"Ders Güncelle Sayfasına Dön\"></a>");
			}
		} else if (request.getParameter("islem").equals(
				"ogrenciye_ders_ekle")) {
			if (request.getParameter("ID") != null) {
				int ogrenciNo = Integer.parseInt(request.getParameter("ID")
						.toString());
				String dersKod = request.getParameter("dersKod");
				String yil = "2012 - 2013";
				String yariyil = "Bahar";
				if ((ogrenciNo == 0) | (dersKod == null) | (yil == null)
						| (yariyil == null)) {
					out.println("<div class=\"alert alert-error\">Ders verilerini kontrol ediniz.</div><p>"
							+ "<a href=\"ogrenciye_ders_ekle.jsp\"><input type=\"button\" value=\"Ogrenciye Ders Ekle Sayfasına Dön\"></a>");
				} else {
					if (database_proses.not_ekle(ogrenciNo + "", dersKod,
							-1, -1, -1, -1, null, yil, yariyil, null)) {
						out.println("<div class=\"alert alert-success\">ogrenciNo :"
								+ ogrenciNo
								+ " dersKod : "
								+ dersKod
								+ " eklendi.</div><p>"
								+ "<a href=\"ogrenciye_ders_ekle.jsp\"><input type=\"button\" value=\"Ogrenciye Ders Ekle Sayfasına Dön\"></a>");
					} else {
						out.println("<div class=\"alert alert-error\">Ogrenciye Ders eklenemedi.Tekrar deneyiniz.</div><p>"
								+ "<a href=\"ogrenciye_ders_ekle.jsp\"><input type=\"button\" value=\"Ogrenciye Ders Ekle Sayfasına Dön\"></a>");
					}
				}
			}
		} else if (request.getParameter("islem").equals("hocaya_ekle")) {
			String dersKod = request.getParameter("ders");
			String hocaID = request.getParameter("ID");
			String yil = "2012 - 2013";
			String yariyil = "Bahar";

			if ((hocaID != null) & (dersKod != null)) {
				if (database_proses.hocaya_ders_ekle(hocaID, dersKod, yil,
						yariyil)) {
					out.println("<div class=\"alert alert-success\">"
							+ hocaID
							+ " sicil numaralı "
							+ database_proses.isim_getir(hocaID + "",
									"tHoca")
							+ " adındaki hocaya "
							+ dersKod
							+ " kodlu ders eklendi.</div><p>"
							+ "<a href=\"hocaya_ders_ekle.jsp\"><input type=\"button\" value=\"Derse Hoca Ekle Sayfasına Dön\"></a>");
				} else {
					out.println("<div class=\"alert alert-error\">Hocaya Ders Eklenemedi. Tekrar Deneyiniz.</div><p>"
							+ "<a href=\"hocaya_ders_ekle.jsp\"><input type=\"button\" value=\"Derse Hoca Ekle Sayfasına Dön\"></a>");
				}
			}
		} else if (request.getParameter("islem").equals("hoca_sil")) {
			String hocaID = request.getParameter("ID");
			String isim = database_proses.isim_getir(hocaID, "tHoca");
			if (hocaID == null) {
				out.println("<div class=\"alert alert-error\">Hoca Secmelisiniz</div><p>"
						+ "<a href=\"hoca_sil.jsp\"><input type=\"button\" value=\"Hoca Sil Sayfasina Don\"></a>");
			} else {
				if (database_proses.hoca_sil(hocaID)) {
					out.println("<div class=\"alert alert-success\">hocaID : "
							+ hocaID
							+ " hocaAdi : "
							+ isim
							+ "</div><p>"
							+ "<a href=\"hoca_sil.jsp\"><input type=\"button\" value=\"Hoca Sil Sayfasına Dön\"></a>");
				} else {
					out.println("<div class=\"alert alert-error\">Hoca Silinemedi.Tekrar Deneyiniz</div><p>"
							+ "<a href=\"hoca_sil.jsp\"><input type=\"button\" value=\"Hoca Sil Sayfasina Don\"></a>");
				}
			}
		} else if (request.getParameter("islem").equals("ogrenci_sil")) {
			String ogrenciID = request.getParameter("ID");
			String isim = database_proses.isim_getir(ogrenciID, "tOgrenci");
			if (ogrenciID == null) {
				out.println("<div class=\"alert alert-error\">Ögrenci Secmelisiniz</div><p>"
						+ "<a href=\"ogrenci_sil.jsp\"><input type=\"button\" value=\"Öğrenci Sil Sayfasina Don\"></a>");
			} else {
				if (database_proses.ogrenci_sil(ogrenciID)) {
					out.println("<div class=\"alert alert-success\">ogrenciID : "
							+ ogrenciID
							+ " ogrenciAdi : "
							+ isim
							+ "</div><p>"
							+ "<a href=\"ogrenci_sil.jsp\"><input type=\"button\" value=\"Öğrenci Sil Sayfasına Dön\"></a>");
				} else {
					out.println("<div class=\"alert alert-error\">Öğrenci Silinemedi.Tekrar Deneyiniz</div><p>"
							+ "<a href=\"ogrenci_sil.jsp\"><input type=\"button\" value=\"Öğrenci Sil Sayfasina Don\"></a>");
				}
			}
		} else if (request.getParameter("islem").equals("memur_sil")) {
			String memurID = request.getParameter("ID");
			String isim = database_proses.isim_getir(memurID, "tMemur");
			if (memurID == null) {
				out.println("<div class=\"alert alert-error\">Memur Secmelisiniz</div><p>"
						+ "<a href=\"memur_sil.jsp\"><input type=\"button\" value=\"Memur Sil Sayfasina Don\"></a>");
			} else {
				if (database_proses.memur_sil(memurID)) {
					out.println("<div class=\"alert alert-success\">memurID : "
							+ memurID
							+ " memurAdi : "
							+ isim
							+ "</div><p>"
							+ "<a href=\"memur_sil.jsp\"><input type=\"button\" value=\"Memur Sil Sayfasına Dön\"></a>");
				} else {
					out.println("<div class=\"alert alert-error\">Memur Silinemedi.Tekrar Deneyiniz</div><p>"
							+ "<a href=\"memur_sil.jsp\"><input type=\"button\" value=\"Memur Sil Sayfasina Don\"></a>");
				}
			}
		} else if (request.getParameter("islem").equals("dersten_hoca_sil")) {
			String dersKod = request.getParameter("dersKod");
			ArrayList<Object> hocaID = database_proses
					.veri_getir("select hocaID from tdersHocasi where dersKod='"
							+ dersKod + "'");
			String hoca_isim = null;

			if (hocaID.size() > 0 && hocaID.get(0) != null)
				hoca_isim = database_proses.isim_getir(hocaID.get(0) + "",
						"tHoca");
			if (dersKod == null | hocaID == null) {
				out.println("<div class=\"alert alert-error\">Secim Yapmanız Gerekmektedir</div><p>"
						+ "<a href=\"dersten_hoca_sil.jsp\"><input type=\"button\" value=\"Dersten Hoca Sil Sayfasina Don\"></a>");
			} else {
				if (database_proses.dersten_hoca_sil(hocaID.get(0) + "",
						dersKod)) {
					out.println("<div class=\"alert alert-success\">"
							+ hoca_isim
							+ " isimli hoca "
							+ dersKod
							+ " kodlu "
							+ database_proses.veri_getir(
									"select dersAd from tDers where dersKod='"
											+ dersKod + "'").get(0)
							+ " dersinden silindi.</div><p>"
							+ "<a href=\"dersten_hoca_sil.jsp\"><input type=\"button\" value=\"Dersten Hoca Sil Sayfasına Dön\"></a>");
				} else {
					out.println("<div class=\"alert alert-error\">Hocadan Ders Silinemedi</div><p>"
							+ "<a href=\"dersten_ogrenci_sil.jsp\"><input type=\"button\" value=\"Dersten Ogrenci Sil Sayfasina Don\"></a>");
				}
			}
		} else if (request.getParameter("islem").equals(
				"dersten_ogrenci_sil")) {
			String dersKod = request.getParameter("dersKod");
			ArrayList<Object> ogrenciID = database_proses
					.veri_getir("select ogrenciID from tnot where dersKod='"
							+ dersKod + "'");
			String ogrenci_isim = null;

			if (ogrenciID.size() > 0 && ogrenciID.get(0) != null)
				ogrenci_isim = database_proses.isim_getir(ogrenciID.get(0)
						+ "", "tOgrenci");
			if (dersKod == null | ogrenciID == null) {
				out.println("<div class=\"alert alert-error\">Secim Yapmanız Gerekmektedir</div><p>"
						+ "<a href=\"dersten_ogrenci_sil.jsp\"><input type=\"button\" value=\"Dersten Ogrenci Sil Sayfasina Don\"></a>");
			} else {
				if (database_proses.dersten_ogrenci_sil(ogrenciID.get(0)
						+ "", dersKod)) {
					out.println("<div class=\"alert alert-success\">"
							+ ogrenci_isim
							+ " isimli ogrenciden "
							+ dersKod
							+ " kodlu "
							+ database_proses.veri_getir(
									"select dersAd from tDers where dersKod='"
											+ dersKod + "'").get(0)
							+ " ders silindi.</div><p>"
							+ "<a href=\"dersten_ogrenci_sil.jsp\"><input type=\"button\" value=\"Dersten Öğrenci Sil Sayfasına Dön\"></a>");
				} else {
					out.println("<div class=\"alert alert-error\">Dersten Öğrenci Silinemedi</div><p>"
							+ "<a href=\"dersten_ogrenci_sil.jsp\"><input type=\"button\" value=\"Dersten Ogrenci Sil Sayfasina Don\"></a>");
				}
			}
		}
	%>
</body>
</html>