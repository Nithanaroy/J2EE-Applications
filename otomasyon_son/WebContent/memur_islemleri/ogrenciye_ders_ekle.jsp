<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="proses.database_proses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
<title>Öğrenciye Ders Ekle</title>
<script type="text/javascript">
	function on_submit() {
		document.getElementById("data_form").submit();
	}
	function on_submit2() {
		document.getElementById("form").submit();
	}
</script>
</head>
<body>
	<form class="form-horizontal" method="post" id="data_form">
		<fieldset>
			<legend style="color: #FFEBCD">Öğrenci - Ders Ekle</legend>
			<!-- Yıl yarıyıl -->
			<div class="control-grup">
				<label class="control-label" style="color: #FFEBCD">Yil</label>
				<div class="controls">
					<input type="text" name="yil" disabled="disabled"
						value="2012 - 2013">
				</div>
			</div>
			<p>
			<div class="control-grup">
				<label class="control-label" style="color: #FFEBCD">Öğrenci
				</label>
				<div class="controls">
					<!-- öğrenci Numarası -->
					<select name="ID">
						<%
							ArrayList<Object> ogrenciID = database_proses
									.veri_getir("select ogrenciID from tOgrenci");

							if (ogrenciID.size() > 0) {
								for (Object id : ogrenciID) {
						%>
						<option value="<%=id%>">
							<%=id + " - "
							+ database_proses.isim_getir(id + "", "tOgrenci")%></option>
						<%
							}
							} else {
						%>
						<option>Öğrenci Yok</option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<p>
				<!-- Tabloyu yenileme -->
			<div class="control-grup">
				<div class="controls">
					<input type="button" style="width: 5.9cm; height: 0.9cm;"
						value="Öğrencinin Alabileceği Dersler" onclick="on_submit()">
				</div>
			</div>
			<p>
		</fieldset>
	</form>
	<%
		if (request.getParameter("ID") != null) {
			ArrayList<Object> ogrencinin_bolumu = database_proses
					.veri_getir("select bolumID from tOgrenci where ogrenciID='"
							+ request.getParameter("ID") + "'");
			ArrayList<Object> bolumun_dersleri = new ArrayList<Object>();
			if (ogrencinin_bolumu.size() > 0) {
				bolumun_dersleri = database_proses
						.veri_getir("select dersKod from tDers where bolumID="
								+ ogrencinin_bolumu.get(0)
								+ " and yariyil='Bahar'");
			}
	%>
	<form class="form-horizontal" method="post" action="islem_tamamla.jsp">
		<input type="hidden" name="ID" value="<%=request.getParameter("ID")%>">
		<input type="hidden" name="yil" value="2012 - 2013"> <input
			type="hidden" name="yariyil" value="Bahar"> <input
			type="hidden" name="islem" value="ogrenciye_ders_ekle">
		<fieldset>
			<%
				String isim = database_proses.isim_getir(
							"" + request.getParameter("ID"), "tOgrenci");
					if (isim == null) {
						isim = "No Value";
					}
			%>
			<legend style="color: #FFEBCD"><%=isim%>
				alabileceği dersler
			</legend>
		</fieldset>
		<table>
			<tr>
				<td style="text-align: center; width: 15cm;"><select
					name="dersKod" style="width: 9cm;">
						<%
							if (bolumun_dersleri.size() > 0) {
									for (Object dersler : bolumun_dersleri) {
						%>
						<option value="<%=dersler%>">
							<%=dersler
								+ " - "
								+ database_proses.veri_getir(
										"select dersAd from tDers where dersKod='"
												+ dersler + "'").get(0)%>
						</option>
						<%
							}
								} else {
						%>
						<option>Ders Yok</option>
						<%
							}
						%>
				</select>
				<p></td>
			</tr>
			<tr>
				<td style="text-align: center;"><input class="btn"
					type="submit" value="Dersi Ekle" style="width: 5cm;">
				<p></td>
			</tr>
			<tr>
				<td style="text-align: center;"><font
					style="font-size: large; color: #FFEBCD"><%=isim%> aldığı
						dersler</font>
				<p></td>
			</tr>
			<tr>
				<td>
					<table class="table table-bordered" style="color: #FFEBCD">
						<tr>
							<th>DersKod</th>
							<th>DersAd</th>
						</tr>
						<%
							ArrayList<Object> ogrencinin_donem_dersleri = database_proses
										.veri_getir("select dersKod from tNot where ogrenciID='"
												+ request.getParameter("ID")
												+ "' and yariyil='Bahar'");
								if (ogrencinin_donem_dersleri.size() > 0
										&& ogrencinin_donem_dersleri.get(0) != null) {
									for (Object ders : ogrencinin_donem_dersleri) {
						%>
						<tr>
							<td><%=ders%></td>
							<td><%=database_proses.veri_getir(
								"select dersAd from tDers where dersKod='"
										+ ders + "'").get(0)%></td>
						</tr>
						<%
							}
								} else {
						%>
						<tr>
							<td>Ders Yok</td>
							<td>Ders Yok</td>
						</tr>
						<% 	} %>
					</table>
				</td>
			</tr>
		</table>
		<%	}	%>
	</form>
</body>
</html>