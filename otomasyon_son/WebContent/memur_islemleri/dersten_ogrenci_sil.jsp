<%@page import="proses.database_proses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
<title>Dersten Sil</title>
</head>
<body>
	<form class="form-horizontal" method="post" action="islem_tamamla.jsp">
		<input type="hidden" name="islem" value="dersten_ogrenci_sil">
		<fieldset>
			<legend style="color: #FFEBCD">Dersten Öğrenci Sil</legend>
			<div class="control-grup">
				<label class="control-label" style="color: #FFEBCD">Secilen
					Ders - Öğrenci</label>
				<div class="controls">
					<select name="dersKod">
						<%
							ArrayList<Object> ogrenciID = database_proses
									.veri_getir("select ogrenciID from tnot order by ogrenciID");
							ArrayList<Object> dersKod = database_proses
									.veri_getir("select dersKod from tnot order by ogrenciID");
							if (ogrenciID.size() > 0 && ogrenciID.get(0) != null) {
								for (int i = 0; i < ogrenciID.size(); i++) {
						%>
						<option value="<%=dersKod.get(i)%>">
							<%=database_proses.veri_getir(
							"select dersAd from tDers where dersKod='"
									+ dersKod.get(i) + "'").get(0)
							+ " - "
							+ database_proses.isim_getir(ogrenciID.get(i) + "",
									"tOgrenci")%>
						</option>
						<%
							}
							} else {
						%>
						<option>Ders Alan Öğrenci Yok</option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<p>
			<div class="control-grup">
				<div class="controls">
					<input type="submit" value="Öğrencinin Aldığı Dersi Sil"
						style="width: 5.8cm;" class="btn">
				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>