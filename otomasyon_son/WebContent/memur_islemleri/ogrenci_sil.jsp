<%@page import="proses.database_proses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
<title>Öğrenci Sil</title>
</head>
<body>
	<form class="form-horizontal" method="post" action="islem_tamamla.jsp">
		<input type="hidden" value="ogrenci_sil" name="islem">
		<fieldset>
			<legend style="color: #FFEBCD">ÖğrenciSil</legend>
			<div class="control-grup">
				<label class="control-label" style="color: #FFEBCD">Secilen
					Öğrenci</label>
				<div class="controls">
					<select name="ID">
						<%
							ArrayList<Object> ogrenci_id = database_proses
									.veri_getir("select ogrenciID from tOgrenci");
							if (ogrenci_id.size() > 0 && ogrenci_id.get(0) != null) {
								for (int i = 0; i < ogrenci_id.size(); i++) {
						%>
						<option value="<%=ogrenci_id.get(i)%>">
							<%=ogrenci_id.get(i)
							+ " - "
							+ database_proses.isim_getir(
									ogrenci_id.get(i) + "", "tOgrenci")%>
						</option>
						<%
							}
							} else {
						%>
						<option>Öğrenci Yok</option>
						<%
							}
						%>
					</select>
					<p>
				</div>
			</div>
			<div class="control-grup">
				<div class="controls">
					<input type="submit" value="Öğrenci Sil" style="width: 5.9cm;"
						class="btn">
				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>