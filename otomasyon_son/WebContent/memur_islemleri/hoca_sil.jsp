<%@page import="proses.database_proses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
<title>Hoca Sil</title>
</head>
<body>
	<form class="form-horizontal" method="post" action="islem_tamamla.jsp">
		<input type="hidden" value="hoca_sil" name="islem">
		<fieldset>
			<legend style="color: #FFEBCD">Hoca Sil</legend>
			<div class="control-grup">
				<label class="control-label" style="color: #FFEBCD">Secilen
					Hoca</label>
				<div class="controls">
					<select name="ID">
						<%
							ArrayList<Object> hoca_id = database_proses
									.veri_getir("select hocaID from tHoca");
							if (hoca_id.size() > 0 && hoca_id.get(0) != null) {
								for (int i = 0; i < hoca_id.size(); i++) {
						%>
						<option value="<%=hoca_id.get(i)%>"><%=hoca_id.get(i)
							+ " - "
							+ database_proses.isim_getir(hoca_id.get(i) + "",
									"tHoca")%></option>
						<%
							}
							} else {
						%>
						<option>Hoca Yok</option>
						<%
							}
						%>
					</select>
					<p>
				</div>
			</div>
			<div class="control-grup">
				<div class="controls">
					<input type="submit" value="Hoca Sil" style="width: 5.9cm;"
						class="btn">
				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>