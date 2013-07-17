<%@page import="proses.database_proses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
<title>Ders Sil</title>
</head>
<body>
	<form class="form-horizontal" action="islem_tamamla.jsp" method="post">
		<input type="hidden" name="islem" value="ders_sil">
		<fieldset>
			<legend style="color: #FFEBCD">Ders Sil</legend>
			<div class="control-grup">
				<p>
					<label class="control-label" style="color: #FFEBCD">Ders
						Kodu</label>
				<div class="controls">
					<select name="dersKod" style="width: 6cm;">
						<%
						ArrayList<Object> ders_kodlari = database_proses.veri_getir("select dersKod from tDers");
  						if (ders_kodlari.size() > 0)
  						{
	  						for(Object dersKod : ders_kodlari)
  							{
  						%>
						<option value="<%= dersKod %>">
							<%= dersKod+" - "+database_proses.veri_getir("select dersAd from tDers where dersKod='"+dersKod+"'").get(0)%>
						</option>
						<%	}
  						}
  						else
  						{%><option>Ders Yok</option>
						<%} %>
					</select>
				</div>
				<p>
				<div class="control-grup">
					<div class="controls">
						<input type="submit" value="Ders Sil" style="width: 6cm;">
					</div>
				</div>
				<p>
			</div>
		</fieldset>
	</form>
</body>
</html>