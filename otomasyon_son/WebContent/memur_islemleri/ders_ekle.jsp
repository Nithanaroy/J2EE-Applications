<%@page import="proses.database_proses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
<title>Ders Ekle</title>
</head>
<body>
	<form class="form-horizontal" action="islem_tamamla.jsp" method="post">
		<input type="hidden" value="ders_ekle" name="islem">
		<fieldset>
			<legend style="color: #FFEBCD">Ders Ekle</legend>
			<div class="control-grup">
				<label class="control-label" style="color: #FFEBCD">Fakülte*</label>
				<div class="controls">
					<select name="fakulteID">
						<%
						ArrayList<Object> fakülteler = database_proses.veri_getir("select fakulteAd from tFakulte");
  						int fakulteID = 1;
  						if (fakülteler.size() > 0)
  						{
	  						for(Object fakulte_ad : fakülteler)
  							{
	  					%>
						<option value="<%= fakulteID %>"><%= fakulte_ad %></option>
						<%
  								fakulteID++;
  							}
  						}
  						else{
  						%>
						<option>Fakülte Bulunmuyor</option>
						<%} %>
					</select>
				</div>
			</div>
			<p>
			<div class="control-grup">
				<label class="control-label" style="color: #FFEBCD">Bölüm* </label>
				<div class="controls">
					<select name="bolumID">
						<%
  						ArrayList<Object> bolumler = database_proses.veri_getir("select bolumAd from tBolum");
  						int bolumID = 1;
  						if (bolumler.size() > 0)
  						{
  							for(Object bolum_ad : bolumler)
  							{
  						%>
						<option value="<%= bolumID %>"><%= bolum_ad %></option>
						<%		bolumID++;
	  						}
  						}
  						else{
  					%>
						<option>Bölüm Bulunmuyor</option>
						<%} %>
					</select>
				</div>
			</div>
			<p>
			<div class="control-grup">
				<label class="control-label" style="color: #FFEBCD">Ders
					Adı* </label>
				<div class="controls">
					<input name="dersAd" type="text" placeholder="DersAdı">
				</div>
			</div>
			<p>
			<div class="control-grup">
				<label class="control-label" style="color: #FFEBCD"><i>Teorik</i></label>
				<div class="controls">
					<select name="teorik" style="width: 2cm;">
						<%
	  					for(int i=0 ; i < 10 ; i++)
  						{
  					%>
						<option value="<%=i %>"><%=i %></option>
						<%}%>
					</select> <i style="color: #FFEBCD">&nbsp;&nbsp;Uygulama&nbsp;&nbsp;</i> <select
						name="uygulama" style="width: 1.5cm;">
						<%
	  					for(int i=0 ; i < 10 ; i++)
  						{
  					%>
						<option value="<%=i %>"><%=i %></option>
						<%}%>
					</select>
				</div>
			</div>
			<p>
			<div class="control-grup">
				<label class="control-label" style="color: #FFEBCD"><i>Yariyil</i></label>
				<div class="controls">
					<select name="yariyil" style="width: 2cm;">
						<option value="Guz">Güz</option>
						<option value="Bahar">Bahar</option>
					</select> <i style="color: #FFEBCD">&nbsp;&nbsp;Kredi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i>
					<select name="kredi" style="width: 1.7cm;">
						<%
	  					for(int i=1 ; i < 10 ; i++)
  						{
  					%>
						<option value="<%=i %>"><%=i %></option>
						<%}%>
					</select>
				</div>
			</div>
			<p>
			<div class="control-grup">
				<div class="controls">
					<input type="submit" value="Ders Ekle" style="width: 5.9cm;">
				</div>
			</div>
			<p>
		</fieldset>
	</form>
</body>
</html>
