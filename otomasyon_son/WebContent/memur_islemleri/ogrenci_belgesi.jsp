<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="proses.database_proses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap_2.css" rel="stylesheet" media="screen">
<title>Öğrenci Belgesi</title>
</head>
<body>
	<%
		if (request.getParameter("ogrenci_no") == null) {
	%>
	<form class="form-horizontal" method="post">
		<fieldset>
			<legend>Öğrenci Belgesi Hazırla</legend>
			<div class="control-grup">
				<label class="control-label">Öğrenci No : </label>
				<div class="controls">
					<input type="text" name="ogrenci_no" placeholder="Öğrenci Numarası">
					<br> <br> <input class="btn" style="width: 5.8cm;"
						type="submit" value="Öğrenci Belgesi Oluştur">
				</div>
			</div>
		</fieldset>
	</form>
	<%
		} else {
			SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
			SimpleDateFormat format_2 = new SimpleDateFormat("yyyy");
			int yil = Integer.parseInt(format_2.format(new Date()));
			int sonraki_yil = yil + 1;

			String ogrenci_no = "Veri Yok", ad = "Veri Yok", soyad = "Veri Yok", baba_ad = "Veri Yok", ana_ad = "Veri Yok", dogum_yeri = "Veri Yok", dogum_tarihi = "Veri Yok", tc_no = "Veri Yok", kayit_tarihi = "Veri Yok";
			if (!request.getParameter("ogrenci_no").trim().equals(""))
				ogrenci_no = request.getParameter("ogrenci_no");
			ArrayList<Object> ogrenciAd = database_proses
					.veri_getir("select ad from tOgrenci where ogrenciId='"
							+ ogrenci_no + "'");
			if (ogrenciAd.size() != 0 && ogrenciAd.get(0) != null)
				ad = ogrenciAd.get(0).toString();
			ArrayList<Object> ogrenciSoyad = database_proses
					.veri_getir("select soyad from tOgrenci where ogrenciId='"
							+ ogrenci_no + "'");
			if (ogrenciSoyad.size() != 0 && ogrenciSoyad.get(0) != null)
				soyad = ogrenciSoyad.get(0).toString();
			ArrayList<Object> babaAd = database_proses
					.veri_getir("select babaAd from tOgrenci where ogrenciId='"
							+ ogrenci_no + "'");
			if (babaAd.size() != 0 && babaAd.get(0) != null)
				baba_ad = babaAd.get(0).toString();
			ArrayList<Object> anaAd = database_proses
					.veri_getir("select anaAd from tOgrenci where ogrenciId='"
							+ ogrenci_no + "'");
			if (anaAd.size() != 0 && anaAd.get(0) != null)
				ana_ad = anaAd.get(0).toString();
			ArrayList<Object> dogumYeri = database_proses
					.veri_getir("select dogumyer from tOgrenci where ogrenciId='"
							+ ogrenci_no + "'");
			if (dogumYeri.size() != 0 && dogumYeri.get(0) != null)
				dogum_yeri = dogumYeri.get(0).toString();
			ArrayList<Object> dogumTarih = database_proses
					.veri_getir("select dogumtarih from tOgrenci where ogrenciId='"
							+ ogrenci_no + "'");
			if (dogumTarih.size() != 0 && dogumTarih.get(0) != null)
				dogum_tarihi = dogumTarih.get(0).toString();
			ArrayList<Object> tcKimlik = database_proses
					.veri_getir("select tckimlik from tOgrenci where ogrenciId='"
							+ ogrenci_no + "'");
			if (tcKimlik.size() != 0 && tcKimlik.get(0) != null)
				tc_no = tcKimlik.get(0).toString();
			ArrayList<Object> kayitTarihi = database_proses
					.veri_getir("select kayitTarih from tOgrenci where ogrenciId='"
							+ ogrenci_no + "'");
			if (kayitTarihi.size() != 0 && kayitTarihi.get(0) != null)
				kayit_tarihi = kayitTarihi.get(0).toString();
	%>
	<br>
	<table border="1">
		<tr style="border-color: transparent;">
			<td>
				<table>
					<tr>
						<td style="width: 40%; text-align: center;"><img
							src="../img/kastamonu.png"></td>
						<td style="width: 90%; text-align: center;"><b
							style="font-size: medium;">T.C. KASTAMONU ÜNİVERSİTESİ EĞİTİM
								FAKÜLTESİ PEDAGOJİK FORMASYON PROGRAMI</b></td>
					</tr>
					<tr>
						<td><br>&nbsp;&nbsp;&nbsp;&nbsp;<b
							style="font-size: medium;">Sayı &nbsp;&nbsp;:</b></td>
						<td style="text-align: right;"><br> <b
							style="font-size: medium;"><%=format.format(new Date())%></b></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<b style="font-size: medium;">Konu
								:</b> Öğrenci Belgesi
						</td>
					</tr>
					<tr>
						<td><br> <br> <br> <b
							style="font-size: medium;">&nbsp;&nbsp;&nbsp;&nbsp;Adı&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</b><i><%=ad%></i></td>
					</tr>
					<tr>
						<td><br> <b style="font-size: medium;">&nbsp;&nbsp;&nbsp;&nbsp;Soyadı&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
						</b><i><%=soyad%></i></td>
					</tr>
					<tr>
						<td><br> <b style="font-size: medium;">&nbsp;&nbsp;&nbsp;&nbsp;Baba
								Adı&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</b><i><%=baba_ad%></i></td>
					</tr>
					<tr>
						<td><br> <b style="font-size: medium;">&nbsp;&nbsp;&nbsp;&nbsp;Anne
								Adı&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</b><i><%=ana_ad%></i></td>
					</tr>
					<tr>
						<td><br> <b style="font-size: medium;">&nbsp;&nbsp;&nbsp;&nbsp;Doğum
								Yeri&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</b><i><%=dogum_yeri%></i></td>
					</tr>
					<tr>
						<td><br> <b style="font-size: medium;">&nbsp;&nbsp;&nbsp;&nbsp;Doğum
								Tarihi&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</b><i><%=dogum_tarihi%></i></td>
					</tr>
					<tr>
						<td><br> <b style="font-size: medium;">&nbsp;&nbsp;&nbsp;&nbsp;T.C.
								No&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</b><i><%=tc_no%></i></td>
					</tr>
					<tr>
						<td><br> <b style="font-size: medium;">&nbsp;&nbsp;&nbsp;&nbsp;Öğrenci
								No&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</b><i><%=ogrenci_no%></i></td>
					</tr>
					<tr>
						<td><br> <b style="font-size: medium;">&nbsp;&nbsp;&nbsp;&nbsp;Kayıt
								Tarihi&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</b><i><%=kayit_tarihi%></i><br>
							<br> <br> <br></td>
					</tr>
					<tr>
						<td></td>
						<td><b style="font-size: medium;">İLGİLİ MAKAMA</b><br>
							<br></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr style="border-color: transparent;">
			<td><b style="font-size: medium; text-align: center;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Yukarıda açık
					kimlik bilgileri yazılı olan öğrenci halen Üniversitemizin <%=yil%>
					- <%=sonraki_yil%> Eğitim-Öğretim Yılı Pedagojik Formasyon Programı
					öğrencisidir.
			</b><br> <br> <br> <br> <br> <br> <br>
				<br></td>
		</tr>
	</table>

	<%
		}
	%>
</body>
</html>