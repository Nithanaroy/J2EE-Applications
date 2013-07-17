<%@page import="proses.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
<title>Derslerim</title>
<script type="text/javascript">
	function on_submit() {
		document.getElementById("date_form").submit();
	}
</script>
</head>
<body style="color: #FFEBCD">
	<form class="form-horizontal" id="date_form">
		<input type="hidden" value="2012 - 2013" name="yil" id="yil">
		<fieldset>
			<legend style="color: #FFEBCD">Derslerim</legend>
			<div class="control-grup">
				<label class="control-label">Yıl</label>
				<div class="controls">
					<input type="text" disabled="disabled" value="2012 - 2013"
						style="width: 2cm;"> <font style="font-size: small;">&nbsp;&nbsp;&nbsp;Yarıyıl&nbsp;&nbsp;&nbsp;</font>
					<select name="yariyil" style="width: 2cm;">
						<option value="Guz">Güz</option>
						<option value="Bahar">Bahar</option>
					</select>
				</div>
			</div>
			<p>
			<div class="control-grup">
				<div class="controls">
					<input type="button" value="Dönemdeki Derslerim"
						style="width: 6.2cm;" onclick="on_submit()">
				</div>
			</div>
			<p>
		</fieldset>
	</form>
	<%
		if (request.getParameter("yariyil") != null) {
	%>
	<fieldset>
		<legend style="color: #FFEBCD"><%=request.getParameter("yil") + " "
						+ request.getParameter("yariyil")
						+ " Dönemindeki Derslerim"%></legend>
		<%
			ArrayList<Object> dersKodlar = database_proses
						.veri_getir("select dersKod from tNot where ogrenciID='"
								+ database_proses.getID()
								+ "' and yariyil='"
								+ request.getParameter("yariyil") + "'");
				ArrayList<Object> hoca_isim = new ArrayList<Object>();
				ArrayList<Object> dersHocasiID = new ArrayList<Object>();
				ArrayList<Object> dersAdlari = new ArrayList<Object>();

				for (Object dersKod : dersKodlar) {
					ArrayList<Object> dersAd = database_proses
							.veri_getir("select dersAd from tDers where dersKod='"
									+ dersKod + "'");
					ArrayList<Object> hocaID = database_proses
							.veri_getir("select hocaID from tdersHocasi where dersKod='"
									+ dersKod + "'");

					if (dersAd.size() == 0)
						dersAdlari.add("---");
					else if (dersAd.size() > 0)
						dersAdlari.add(dersAd.get(0));
					if (hocaID.size() > 0)
						dersHocasiID.add(hocaID.get(0));
					else if (hocaID.size() == 0)
						dersHocasiID.add("---");
				}
				if (dersHocasiID.size() > 0) {
					for (Object hocaID : dersHocasiID) {
						if (hocaID.equals("---"))
							hoca_isim.add("---");
						else
							hoca_isim.add(database_proses.isim_getir(hocaID
									+ "", "tHoca"));
					}
				}
		%>
		<table class="table table-bordered">
			<tr>
				<th>Ders Kod</th>
				<th>Ders Adı</th>
				<th>Dersin Hocası</th>
			</tr>
			<%
				if (dersAdlari.size() == 0) {
			%>
			<tr>
				<td>Ders Yok</td>
				<td>Ders Yok</td>
				<td>Hoca Yok</td>
			</tr>
			<%
				}
					for (int i = 0; i < dersAdlari.size(); i++) {
			%>
			<tr>
				<td><%=dersKodlar.get(i)%></td>
				<td><%=dersAdlari.get(i)%></td>
				<td><%=hoca_isim.get(i)%></td>
			</tr>
			<%}%>
		</table>
		<%}%>
	</fieldset>
</body>
</html>