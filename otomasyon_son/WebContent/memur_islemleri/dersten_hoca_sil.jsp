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
		<input type="hidden" name="islem" value="dersten_hoca_sil">
		<fieldset>
			<legend style="color: #FFEBCD">Dersten Hoca Sil</legend>
			<div class="control-grup">
				<label class="control-label" style="color: #FFEBCD">Secilen
					Ders - Hoca</label>
				<div class="controls">
					<select name="dersKod">
						<%
							ArrayList<Object> hocaID = database_proses
									.veri_getir("select hocaID from tdersHocasi order by hocaID");
							ArrayList<Object> dersKod = database_proses
									.veri_getir("select dersKod from tdersHocasi order by hocaID");
							if (hocaID.size() > 0 && hocaID.get(0) != null) {
								for (int i = 0; i < hocaID.size(); i++) {
						%>
						<option value="<%=dersKod.get(i)%>">
							<%=database_proses.veri_getir(
							"select dersAd from tDers where dersKod='"
									+ dersKod.get(i) + "'").get(0)
							+ " - "
							+ database_proses.isim_getir(hocaID.get(i) + "",
									"tHoca")%>
						</option>
						<%
							}
							} else {
						%>
						<option>Ders Veren Hoca Yok</option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<p>
			<div class="control-grup">
				<div class="controls">
					<input type="submit" value="Dersin Hocasini Sil"
						style="width: 5.8cm;" class="btn">
				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>