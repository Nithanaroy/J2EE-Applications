<%@page import="java.util.ArrayList"%>
<%@page import="proses.gecme_notu_hesapla"%>
<%@page import="proses.database_proses"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
</head>
<body>
	<%
		String islem = request.getParameter("islem");
		if (islem.equals("not_ekle")) {
			// Öğrenci Numaraları
			ArrayList<String> ogrenciID = new ArrayList<String>();
			for (String ogrenci : database_proses.ogrenci_liste)
				ogrenciID.add(ogrenci);
			// Ders Kod
			String dersKodu = request.getParameter("dersKod");
			int j = database_proses.ogrenci_liste.size();
			String buton_verisi, gecme_durumu = "Gecti", harf_notu = "AA";
			ArrayList<Integer> not_verisi = new ArrayList<Integer>();
			buton_verisi = request.getParameter("btn");
			int gecme_notu = 0;
			float ortalama = 2;
			//Bu 3 denetim hangi butondan geldğini belirler ve ona göre notları seçer
			if (buton_verisi.equals("Vize Kaydet")) {
				for (int i = 0; i < j; i++) {
					//Vize notları okunuyor
					if (Integer.parseInt(request.getParameter("vize" + i)) != -1)
						not_verisi.add(Integer.parseInt(request
								.getParameter("vize" + i) + ""));
					else {
						not_verisi.add(0);
					}
					/*else
					{
						out.println("<div class=\"alert alert-error\">Bütün Öğrenciler İçin Vize Notları Girilmelidir.</div><p>"+
							"<a href=\"not_ekle.jsp\"><input type=\"button\" value=\"Not Ekleme Sayfasına Dön\"></a>");
						break;	
					}*/
				}
				for (int i = 0; i < not_verisi.size(); i++) {
					//Vizeler veritabanına ekleniyor
					if (not_verisi.get(i) != null) {
						if (database_proses.not_ekle(ogrenciID.get(i),
								dersKodu, not_verisi.get(i), -1, -1, -1,
								null, null, null, null)) {
							out.println("<div class=\"alert alert-success\"> ogrenciNo : "
									+ ogrenciID.get(i)
									+ "ogrenciAdı : "
									+ database_proses.isim_getir(
											ogrenciID.get(i), "tOgrenci")
									+ " dersAdı : "
									+ database_proses.veri_getir(
											"select dersAd from tDers where dersKod='"
													+ dersKodu + "'")
											.get(0)
									+ " not : "
									+ not_verisi.get(i)
									+ "</div><p>"
									+ "<a href=\"not_ekle.jsp\"><input type=\"button\" value=\"Not Ekleme Sayfasına Dön\"></a>");
						} else {
							out.println("<div class=\"alert alert-error\">Vize Notu Ekleme Başarısız Oldu.Tekrar Deneyiniz.</div>"
									+ "<p><a href=\"not_ekle.jsp\"><input type=\"button\" value=\"Not Ekleme Sayfasına Dön\"></a>");
							break;
						}
					} else {
						out.println("<div class=\"alert alert-error\">Bütün Öğrenciler İçin Vize Notları Girilmelidir.</div>"
								+ "<p><a href=\"not_ekle.jsp\"><input type=\"button\" value=\"Not Ekleme Sayfasına Dön\"></a>");
						break;
					}
				}
			} else if (buton_verisi.equals("Final Kaydet")) {
				//Final notları okunuyor
				for (int i = 0; i != j; i++) {
					if (Integer.parseInt(request.getParameter("_final" + i)
							+ "") != -1)
						not_verisi.add(Integer.parseInt(request
								.getParameter("_final" + i) + ""));
					else {
						not_verisi.add(0);
					}
					/*else
					{
						out.println("<div class=\"alert alert-error\">Final Notlarını Girmeniz Gerekmektedir.</div>"+
							"<p><a href=\"not_ekle.jsp\"><input type=\"button\" value=\"Not Ekleme Sayfasına Dön\"></a>");
						break;
					}*/
				}
			} else if (buton_verisi.equals("But Kaydet")) {
				//Bütünleme Notları Okunuyor
				for (int i = 0; i != j; i++) {
					if (Integer.parseInt(request.getParameter("butunleme"
							+ i)
							+ "") != -1)
						not_verisi.add(Integer.parseInt(request
								.getParameter("butunleme" + i) + ""));
					else {
						not_verisi.add(-1);
					}
					/*else
					{
						out.println("<div class=\"alert alert-error\">Bütünleme Notlarını Girmeniz Gerekmektedir.</div>"+
								"<p><a href=\"not_ekle.jsp\"><input type=\"button\" value=\"Not Ekleme Sayfasına Dön\"></a>");
						break;
					}*/
				}
			}
			if (buton_verisi.equals("But Kaydet")
					| buton_verisi.equals("Final Kaydet")) {
				for (int i = 0; i < not_verisi.size(); i++) {
					// Veritabanında öğrencinin vize notu bulunmaktamı ?
					ArrayList<Object> vize_notu = database_proses
							.veri_getir("select vize from tNot where ogrenciID='"
									+ ogrenciID.get(i)
									+ "' and dersKod='"
									+ dersKodu + "'");
					if (vize_notu.size() > 0 && vize_notu.get(0) != null
							&& not_verisi.size() > 0
							&& not_verisi.get(0) != null) {//egerki vize notu varsa
						gecme_notu = gecme_notu_hesapla.gecmeNotu(
								Integer.parseInt(vize_notu.get(0) + ""),
								not_verisi.get(i));
					} else if (not_verisi.get(0) != null
							&& not_verisi.size() > 0) {
						gecme_notu = gecme_notu_hesapla.gecmeNotu(0,
								not_verisi.get(i));
					}
					harf_notu = gecme_notu_hesapla.harfNotu(gecme_notu);
					if (harf_notu.equals("DC")) {
						ArrayList<Object> ogrencinin_dersleri = database_proses
								.veri_getir("select dersKod from tNot where ogrenciID='"
										+ ogrenciID.get(0)
										+ "' and yariyil='Bahar'");
						ArrayList<Object> ders_kredileri = new ArrayList<Object>();
						ArrayList<Object> ders_notlari = new ArrayList<Object>();
						if (ogrencinin_dersleri.size() > 0
								&& ogrencinin_dersleri.get(0) != null) {
							for (Object dersKod : ogrencinin_dersleri) {
								ders_kredileri.add(database_proses
										.veri_getir(
												"select kredi from tDers where dersKod='"
														+ dersKod + "'")
										.get(0));
								ders_notlari.add(database_proses
										.veri_getir(
												"select HBN from tNot where yariyil='Bahar' and ogrenciID='"
														+ ogrenciID.get(0)
														+ "'").get(0));
							}
							if ((ders_kredileri.size() > 0)
									&& (ders_notlari.size() > 0)
									&& (ders_notlari.get(0) != null)) {
								ortalama = gecme_notu_hesapla
										.ortalama_hesapla(ders_notlari,
												ders_kredileri);
								if (ortalama > 54.0) {
									harf_notu = "DC+";
									gecme_durumu = "Sartli Gecti";
								} else {
									harf_notu = "DC-";
									gecme_durumu = "Kaldi";
								}
							} else if (ders_notlari.get(0) == null) {
								harf_notu = "DC+";
								gecme_durumu = "Gecti";
							}
						}
					} else if (harf_notu.equals("DD")
							| harf_notu.equals("FD")
							| harf_notu.equals("FF"))
						gecme_durumu = "Kaldi";
					else
						gecme_durumu = "Gecti";
					if (buton_verisi.equals("Final Kaydet")) {
						if (not_verisi.get(i) != null) {
							if (database_proses.not_ekle(ogrenciID.get(i),
									dersKodu, -1, not_verisi.get(i), -1,
									gecme_notu, harf_notu, null, null,
									gecme_durumu)) {
								out.println("<div class=\"alert alert-success\"> ogrenciNo : "
										+ ogrenciID.get(i)
										+ "ogrenciAdı : "
										+ database_proses.isim_getir(
												ogrenciID.get(i),
												"tOgrenci")
										+ " dersAdı : "
										+ database_proses.veri_getir(
												"select dersAd from tDers where dersKod='"
														+ dersKodu + "'")
												.get(0)
										+ " not : "
										+ not_verisi.get(i)
										+ "</div><p>"
										+ "<a href=\"not_ekle.jsp\"><input type=\"button\" value=\"Not Ekleme Sayfasına Dön\"></a>");
							} else {
								out.println("<div class=\"alert alert-error\">Final Notları Eklenemedi.</div>"
										+ "<p><a href=\"not_ekle.jsp\"><input type=\"button\" value=\"Not Ekleme Sayfasına Dön\"></a>");
								break;
							}
						} else {
							out.println("<div class=\"alert alert-error\">Final Notlarını Tüm Öğrenciler İçin Girmeniz Gerekmektedir.</div>"
									+ "<p><a href=\"not_ekle.jsp\"><input type=\"button\" value=\"Not Ekleme Sayfasına Dön\"></a>");
							break;
						}
					} else if (buton_verisi.equals("But Kaydet")) {
						if (not_verisi.get(i) != null) {
							if (not_verisi.get(i) != -1) {
								if (database_proses
										.not_ekle(ogrenciID.get(i),
												dersKodu, -1, -1,
												not_verisi.get(i),
												gecme_notu, harf_notu,
												null, null, gecme_durumu)) {
									out.println("<div class=\"alert alert-success\"> ogrenciNo : "
											+ ogrenciID.get(i)
											+ "ogrenciAdı : "
											+ database_proses.isim_getir(
													ogrenciID.get(i),
													"tOgrenci")
											+ " dersAdı : "
											+ database_proses.veri_getir(
													"select dersAd from tDers where dersKod='"
															+ dersKodu
															+ "'").get(0)
											+ " not : "
											+ not_verisi.get(i)
											+ "</div><p>"
											+ "<a href=\"not_ekle.jsp\"><input type=\"button\" value=\"Not Ekleme Sayfasına Dön\"></a>");
								}
							}
						} else {
							out.println("<div class=\"alert alert-error\">Bütünleme Notları Eklenemedi.Tekrar Deneyiniz</div>"
									+ "<p><a href=\"not_ekle.jsp\"><input type=\"button\" value=\"Not Ekleme Sayfasına Dön\"></a>");
							break;
						}
					} else {
						out.println("<div class=\"alert alert-error\">Bütünleme Notlarını Girmeniz Gerekmektedir.</div>"
								+ "<p><a href=\"not_ekle.jsp\"><input type=\"button\" value=\"Not Ekleme Sayfasına Dön\"></a>");
						break;
					}
				}
			}
		} else if (islem.equals("not_guncelle")) {
			String dersKodu = request.getParameter("dersKod");
			String ogrenciID = request.getParameter("ID");
			int vize = Integer.parseInt(request.getParameter("vize") + "");
			int _final = Integer.parseInt(request.getParameter("_final")
					+ "");
			int butunleme = Integer.parseInt(request
					.getParameter("butunleme") + "");
			String yil = "2012 - 2013";
			String yariyil = "Bahar";
			int gecmeNotu = 0;
			String harfNotu = null, gecmeDurumu = null;
			float ortalama = 2;

			if ((dersKodu == null) | (ogrenciID == null)) {
				out.println("<div class=\"alert alert-error\">Öğrenci No veya dersKodunu kontrol ediniz.</div>"
						+ "<p><a href=\"not_guncelle.jsp\"><input type=\"button\" value=\"Not Güncelleme Sayfasına Dön\"></a>");
			}
			if ((vize == -1) && (_final == -1) && (butunleme == -1)) {
				out.println("<div class=\"alert alert-error\">Not girişi yapmanız gerekmektedir.</div>"
						+ "<p><a href=\"not_guncelle.jsp\"><input type=\"button\" value=\"Not Güncelleme Sayfasına Dön\"></a>");
			}
			ArrayList<Object> vize_notu = database_proses
					.veri_getir("select vize from tNot where ogrenciID="
							+ ogrenciID + " and dersKod='" + dersKodu + "'");
			if ((vize_notu.size() > 0) && (vize_notu.get(0) != null)) {
				if ((vize == -1) && (_final == -1) && (butunleme != -1))
					gecmeNotu = gecme_notu_hesapla.gecmeNotu(Integer.parseInt(vize_notu.get(0) + ""),butunleme);
				else if ((vize == -1) && (_final != -1) && (butunleme == -1))
					gecmeNotu = gecme_notu_hesapla.gecmeNotu(Integer.parseInt(vize_notu.get(0) + ""),_final);
				else if ((vize == -1) && (_final != -1) && (butunleme != -1))
					gecmeNotu = gecme_notu_hesapla.gecmeNotu(Integer.parseInt(vize_notu.get(0) + ""),butunleme);
				else if ((vize != -1) && (_final == -1) && (butunleme != -1))
					gecmeNotu = gecme_notu_hesapla.gecmeNotu(vize,butunleme);
				else if ((vize != -1) && (_final != -1) && (butunleme == -1))
					gecmeNotu = gecme_notu_hesapla.gecmeNotu(vize, _final);
				else if ((vize != -1) && (_final != -1)&& (butunleme != -1))
					gecmeNotu = gecme_notu_hesapla.gecmeNotu(vize,butunleme);
			} else {
				if ((vize == -1) && (_final == -1) && (butunleme != -1))
					gecmeNotu = gecme_notu_hesapla.gecmeNotu(0, butunleme);
				else if ((vize == -1) && (_final != -1)&& (butunleme == -1))
					gecmeNotu = gecme_notu_hesapla.gecmeNotu(0, _final);
				else if ((vize == -1) && (_final != -1)&& (butunleme != -1))
					gecmeNotu = gecme_notu_hesapla.gecmeNotu(0, butunleme);
				else if ((vize != -1) && (_final == -1)&& (butunleme != -1))
					gecmeNotu = gecme_notu_hesapla.gecmeNotu(vize,butunleme);
				else if ((vize != -1) && (_final != -1)&& (butunleme == -1))
					gecmeNotu = gecme_notu_hesapla.gecmeNotu(vize, _final);
				else if ((vize != -1) && (_final != -1)&& (butunleme != -1))
					gecmeNotu = gecme_notu_hesapla.gecmeNotu(vize,butunleme);
			}
			harfNotu = gecme_notu_hesapla.harfNotu(gecmeNotu);
			if (harfNotu.equals("DC")) {
				ArrayList<Object> ogrencinin_dersleri = database_proses
						.veri_getir("select dersKod from tNot where ogrenciID='"
								+ ogrenciID
								+ "' and yariyil='"
								+ yariyil
								+ "'");
				ArrayList<Object> ders_kredileri = new ArrayList<Object>();
				ArrayList<Object> ders_notlari = new ArrayList<Object>();

				if (ogrencinin_dersleri.size() > 0) {
					for (Object dersKod : ogrencinin_dersleri) {
						ders_kredileri
								.add(database_proses
										.veri_getir("select kredi from tDers where dersKod='"
												+ dersKod + "'"));
						ders_notlari
								.add(database_proses
										.veri_getir("select HBN from tNot where dersKod='"
												+ dersKod + "'"));
					}
					if ((ders_kredileri.size() > 0)
							&& (ders_notlari.size() > 0))
						ortalama = gecme_notu_hesapla.ortalama_hesapla(
								ders_notlari, ders_kredileri);
				}
				if (ortalama >= 2.0) {
					harfNotu = "DC+";
					gecmeDurumu = "Şartlı Geçti";
				} else {
					harfNotu = "DC-";
					gecmeDurumu = "Kaldı";
				}
			} else if (harfNotu.equals("DD") | harfNotu.equals("FD")
					| harfNotu.equals("FF"))
				gecmeDurumu = "Kaldı";
			else
				gecmeDurumu = "Geçti";
			if (database_proses.not_ekle(ogrenciID, dersKodu, vize, _final,
					butunleme, gecmeNotu, harfNotu, yil, yariyil,
					gecmeDurumu)) {
				out.println("<div class=\"alert alert-success\"> ogrenciNo : "
						+ ogrenciID
						+ "ogrenciAdı : "
						+ database_proses.isim_getir(ogrenciID, "tOgrenci")
						+ " dersAdı : "
						+ database_proses.veri_getir(
								"select dersAd from tDers where dersKod='"
										+ dersKodu + "'").get(0)
						+ " vize : "
						+ vize
						+ " final = "
						+ _final
						+ " butunleme = "
						+ butunleme
						+ "</div><p>"
						+ "<a href=\"not_guncelle.jsp\"><input type=\"button\" value=\"Not Güncelleme Sayfasına Dön\"></a>");
			} else {
				out.println("<div class=\"alert alert-error\">Veritabanında Güncelleme Yapılamadı.Tekrar Deneyiniz.</div>"
						+ "<p><a href=\"not_guncelle.jsp\"><input type=\"button\" value=\"Not Güncelleme Sayfasına Dön\"></a>");
			}
		}
		//----------------- NOT SİL --------------------
		else if (request.getParameter("islem").equals("not_sil")) {
			String vize = request.getParameter("vize");
			String _final = request.getParameter("_final");
			String butunleme = request.getParameter("butunleme");
			String dersKod = request.getParameter("dersKod");
			String ogrenciID = request.getParameter("ID") + "";

			if ((vize == null) && (_final == null) && (butunleme == null)) {
				out.println("<div class=\"alert alert-error\">Silinecek notu secmeniz gerekmektedir</div>"
						+ "<p><a href=\"not_sil.jsp\"><input type=\"button\" value=\"Not Silme Sayfasına Dön\"></a>");
			}
			if ((dersKod == null) | (ogrenciID == null)) {
				out.println("<div class=\"alert alert-error\">Verileri tam olarak girmeniz gerekmektedir</div>"
						+ "<p><a href=\"not_sil.jsp\"><input type=\"button\" value=\"Not Silme Sayfasına Dön\"></a>");
			} else {
				if (database_proses.not_sil(vize, _final, butunleme,dersKod, ogrenciID)) {
					out.println("<div class=\"alert alert-success\"> ogrenciNo : "
							+ ogrenciID
							+ " dersAdı : "
							+ database_proses.veri_getir(
									"select dersAd from tDers where dersKod='"
											+ dersKod + "'").get(0)
							+ " notu silindi.</div><p>"
							+ "<a href=\"not_sil.jsp\"><input type=\"button\" value=\"Not Silme Sayfasına Dön\"></a>");
				}
			}
		}
	%>
</body>
</html>