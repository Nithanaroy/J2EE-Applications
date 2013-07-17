<%@page import="proses.database_proses"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
		function on_submit()
		{
			document.getElementById("date_form").submit();
		}
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
<title>Not Sil</title>
<%
	String yariyil = "Bahar";
%>
</head>
<body style="color: #FFEBCD">
	<fieldset>
		<legend style="color: #FFEBCD">Not Sil</legend>
		<form class="form-horizontal" id="date_form" method="post">
			<!-- Yıl , yarıyıl -->
			<input type="hidden" name="_yil" value="2012 - 2013"> <input
				type="hidden" name="_yariyil" value="<%=yariyil%>">
			<div class="control-grup">
				<label class="control-label">Yıl </label>
				<div class="controls">
					<input value="2012 - 2013" disabled="disabled" type="text"
						style="width: 2.2cm;"> <font>&nbsp;&nbsp;&nbsp;Yariyil&nbsp;&nbsp;&nbsp;&nbsp;</font><input
						type="text" disabled="disabled" style="width: 1.5cm;"
						value="<%=yariyil%>">
				</div>
			</div>
			<p>
				<!-- Bütün Dersler -->
			<div class="control-grup">
				<label class="control-label">Ders Sec </label>
				<div class="controls">
					<select style="width: 6.2cm;" name="_dersKod">
						<%
	  						ArrayList<Object> dersKodlari = database_proses.veri_getir("select dersKod from tdersHocasi where hocaID='"+database_proses.getID()+"'");
	  						if (dersKodlari.size() > 0 && dersKodlari.get(0) != null)
	  						{
	  							for(Object dersKod : dersKodlari)
	  							{%>
						<option value="<%=dersKod%>"><%=dersKod+" - "+database_proses.veri_getir("select dersAd from tDers where dersKod='"+dersKod+"'").get(0) %></option>
						<%	}
	  						}
	  						else
	  						{
	  						%>
						<option>Size Atanmıs Ders Yok</option>
						<%	} %>
					</select>
				</div>
			</div>
			<p>
			<div class="control-grup">
				<div class="controls">
					<input onclick="on_submit()" type="button" class="btn"
						value="Dersi Alan Öğrenciler" style="width: 6.2cm;">
				</div>
			</div>
		</form>
	</fieldset>
	<%
		if(request.getParameter("_dersKod") != null)
  	{	%>
	<fieldset>
		<legend style="color: #FFEBCD">
			<%=database_proses.veri_getir("select dersAd from tDers where dersKod='"+request.getParameter("_dersKod")+"'").get(0) %>
			Dersini Alanlar
		</legend>
		<form class="form-horizontal" action="islem_tamamla.jsp" method="post">
			<input type="hidden" name="islem" value="not_sil"> <input
				type="hidden" name="dersKod"
				value="<%=request.getParameter("_dersKod")%>"> <input
				type="hidden" name="yil" value="<%=request.getParameter("_yil")%>">
			<input type="hidden" name="yariyil"
				value="<%=request.getParameter("_yariyil")%>">
			<div class="control-grup">
				<label class="control-label" style="color: #FFEBCD">Dersi
					Alan Öğrenciler</label>
				<div class="controls">
					<select name="ID" style="width: 6.2cm;">
						<%
	  						ArrayList<Object> ogrenciNumaralari = 
	  							database_proses.veri_getir("select ogrenciID from tNot where dersKod='"+request.getParameter("_dersKod")+"'");
	  					if (ogrenciNumaralari.size() > 0 && ogrenciNumaralari.get(0) != null)
	  					{
	  						for(Object ogrenciNo : ogrenciNumaralari)
	  						{%>
						<option value="<%=ogrenciNo%>"><%=ogrenciNo+" - "+database_proses.isim_getir(ogrenciNo+"", "tOgrenci")%></option>
						<%		}
	  					}
	  					else
	  					{%>
						<option>Dersi Alan Öğrenci Yok</option>
						<%	} %>
					</select>
				</div>
			</div>
			<p>
			<div class="control-grup">
				<div class="controls">
					<font style="font-size: medium;">Vize&nbsp;&nbsp;</font><input
						type="checkbox" name="vize"> <font
						style="font-size: medium;">Final&nbsp;&nbsp;</font><input
						type="checkbox" name="_final"> <font
						style="font-size: medium;">Bütünleme&nbsp;&nbsp;</font><input
						type="checkbox" name="butunleme">
				</div>
			</div>
			<p>
			<div class="control-grup">
				<div class="controls">
					<input class="btn" type="submit" style="width: 6.2cm;"
						value="Not Sil">
				</div>
			</div>
		</form>
		<% } %>
	</fieldset>
</body>
</html>