<%@page import="proses.database_proses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
<title>Öğrencilerim</title>
</head>
<body style="color: #FFEBCD">
	<%
		ArrayList<Object> ders_kod = database_proses
				.veri_getir("select dersKod from tdersHocasi where hocaID='"
						+ database_proses.getID() + "'");
	%>

	<fieldset>
		<form class="form-horizontal" method="post">
			<br>
			<div class="control-grup">
				<div class="controls">
					<select name="dersKod" style="width: 6cm;">
						<%
							for (Object dersKod : ders_kod) {
						%>
						<option value="<%=dersKod%>"><%=database_proses.veri_getir(
						"select dersAd from tDers where dersKod='" + dersKod
								+ "'").get(0)%>
							<%
								}
							%>
						
					</select>
				</div>
			</div>
			<br>
			<div class="control-grup">
				<div class="controls">
					<input type="submit" value="Öğrencileri Listele" class="btn"
						style="width: 6cm;">
				</div>
			</div>
		</form>
		<%
			if (request.getParameter("dersKod") != null) {
				ArrayList<Object> ders_alanlar = database_proses
						.veri_getir("select ogrenciID from tNot where dersKod='"
								+ request.getParameter("dersKod") + "'");
		%>
		<table class="table table-bordered" style="color: #FFEBCD">
			<tr>
				<th>Öğrenci No</th>
				<th>Öğrenci Ad - Soyad</th>
				<th>Ders Ad</th>
			</tr>
			<%
					if (ders_alanlar.size() > 0) {
							for (Object numara : ders_alanlar) {
				%>
			<tr>
				<td><%=numara%></td>
				<td><%=database_proses.isim_getir(numara.toString(),
								"tOgrenci")%></td>
				<td><%=database_proses
								.veri_getir(
										"select dersAd from tDers where dersKod='"
												+ request
														.getParameter("dersKod")
												+ "'").get(0)%>
			</tr>
			<%
				}
					} else {
			%>
			<tr>
				<td>Veri Yok</td>
				<td>Veri Yok</td>
				<td>Veri Yok</td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			}
		%>
	</fieldset>
</body>
</html>