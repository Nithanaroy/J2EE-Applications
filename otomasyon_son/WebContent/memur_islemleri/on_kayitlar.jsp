<%@page import="proses.database_proses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap_2.css" rel="stylesheet" media="screen">
<title>Ön Kayıtlar</title>
</head>
<body>
	<form class="form-horizontal" method="post">
		<fieldset>
			<legend>Ön Kayıt Öğrenci Listesi</legend>
			<div class="control-grup">
				<label class="control-label">Bölüm Seçiniz</label>
				<div class="controls">
					<select name="bolumID">
						<%
							ArrayList<Object> bolumler = database_proses
									.veri_getir("select programAd from tProgramlar");
							int Id = 1;
							if (bolumler.size() > 0) {
								for (Object bolum : bolumler) {
						%>
						<option value="<%=Id%>"><%=bolum%></option>
						<%
							Id++;
								}
							} else {
						%>
						<option>Bölüm Bulunmuyor.</option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<br>
			<div class="control-grup">
				<div class="controls">
					<input class="btn" type="submit" value="Öğrenci Listele"
						style="width: 5.9cm;">
				</div>
			</div>
		</fieldset>
	</form>
	<%
		if (request.getParameter("bolumID") != null) {
			int id = 1;
			int bolumID = Integer.parseInt(request.getParameter("bolumID")
					.toString());
			ArrayList<Object> bolum_ad = database_proses
					.veri_getir("select programAd from tProgramlar where programID="
							+ bolumID + "");
			ArrayList<Object> tc_no = database_proses
					.veri_getir("select tc from on_kayit_ogrenci where bolumID="
							+ bolumID + " order by lisans_notu DESC");
			ArrayList<Object> ogrenci_ad = database_proses
					.veri_getir("select ad from on_kayit_ogrenci where bolumID="
							+ bolumID + " order by lisans_notu DESC");
			ArrayList<Object> ogrenci_soyad = database_proses
					.veri_getir("select soyad from on_kayit_ogrenci where bolumID="
							+ bolumID + " order by lisans_notu DESC");
			ArrayList<Object> cep_tel = database_proses
					.veri_getir("select cep_tel from on_kayit_ogrenci where bolumID="
							+ bolumID + " order by lisans_notu DESC");
			ArrayList<Object> adres = database_proses
					.veri_getir("select adres from on_kayit_ogrenci where bolumID="
							+ bolumID + " order by lisans_notu DESC");
			ArrayList<Object> not = database_proses
					.veri_getir("select lisans_notu from on_kayit_ogrenci where bolumID="
							+ bolumID + " order by lisans_notu DESC");
	%>
	<br>
	<form class="form-horizontal" method="post">
		<label><font style="font-size: large;"><%=bolum_ad.get(0)%>
				Öğrencileri</font></label> <br>
		<table class="table table-bordered">
			<tr>
				<th>ID</th>
				<th>TC No</th>
				<th>İsim</th>
				<th>Soyisim</th>
				<th>Bölümü</th>
				<th>Lisans Notu</th>
				<th>Telefon</th>
				<th>Adres</th>
			</tr>
			<tr>
				<%
					if (tc_no.size() > 0) {
							for (int i = 0; i < tc_no.size(); i++) {
				%>
				<td><%=id%></td>
				<td><%=tc_no.get(i)%></td>
				<td><%=ogrenci_ad.get(i)%></td>
				<td><%=ogrenci_soyad.get(i)%></td>
				<td><%=bolum_ad.get(0)%></td>
				<td><%=not.get(i)%></td>
				<td><%=cep_tel.get(i)%></td>
				<td><%=adres.get(i)%></td>
			</tr>
			<%
				id++;
						}
					} else {
			%>
			<tr>
				<td>Veri Yok</td>
				<td>Veri Yok</td>
				<td>Veri Yok</td>
				<td>Veri Yok</td>
				<td>Veri Yok</td>
				<td>Veri Yok</td>
				<td>Veri Yok</td>
			</tr>
			<%
				}
			%>
		</table>
	</form>
	<%
		}
	%>
</body>
</html>