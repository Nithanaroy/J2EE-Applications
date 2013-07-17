<%@page import="proses.database_proses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
<title>Derse Hoca Ekle</title>
</head>
<body style="color: #FFEBCD">
	<%
		ArrayList<Object> ders_kodlari = database_proses
				.veri_getir("select dersKod from tDers");
		ArrayList<Object> ders_adlari = database_proses
				.veri_getir("select dersAd from tDers");
		ArrayList<Object> hocaID = database_proses
				.veri_getir("select hocaID from tHoca");
	%>
	<form class="form-horizontal" method="post" action="islem_tamamla.jsp">
		<input type="hidden" name="islem" value="hocaya_ekle">
		<fieldset>
			<legend style="color: #FFEBCD">Derse Hoca Ekle</legend>
			<div class="control-grup">
				<label class="control-label">Hoca</label>
				<div class="controls">
					<select name="ID">
						<%
							if (hocaID.size() > 0) {
								for (Object hoca : hocaID) {
						%>
						<option value="<%=hoca%>"><%=database_proses.isim_getir(hoca + "", "tHoca")%></option>
						<%
							}
							} else {
						%>
						<option disabled="disabled">Hoca Yok</option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<p>
			<div class="control-grup">
				<label class="control-label">Ders</label>
				<div class="controls">
					<select name="ders">
						<%
							if (ders_adlari.size() > 0) {
								for (int i = 0; i < ders_adlari.size(); i++) {
						%>
						<option value="<%=ders_kodlari.get(i)%>"><%=ders_kodlari.get(i) + " - " + ders_adlari.get(i)%></option>
						<%
							}
							} else {
						%>
						<option disabled="disabled">Ders Yok</option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<p>
			<div class="control-grup">
				<div class="controls">
					<input style="width: 5.9cm; height: 0.9cm;" type="submit"
						value="Derse Hocayı Ekle">
				</div>
			</div>
			<p>
		</fieldset>
	</form>
</body>
</html>