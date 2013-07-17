<%@page import="proses.database_proses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
<title>Memur Sil</title>
</head>
<body>
	<form class="form-horizontal" method="post" action="islem_tamamla.jsp">
		<input type="hidden" value="memur_sil" name="islem">
		<fieldset>
			<legend style="color: #FFEBCD">Memur Sil</legend>
			<div class="control-grup">
				<label class="control-label" style="color: #FFEBCD">Secilen
					Memur</label>
				<div class="controls">
					<select name="ID">
						<%
							ArrayList<Object> memur_id = database_proses
									.veri_getir("select memurID from tMemur");
							if (memur_id.size() > 0 && memur_id.get(0) != null) {
								for (int i = 0; i < memur_id.size(); i++) {
						%>
						<option value="<%=memur_id.get(i)%>">
							<%=memur_id.get(i)
							+ " - "
							+ database_proses.isim_getir(memur_id.get(i) + "",
									"tMemur")%>
						</option>
						<%
							}
							} else {
						%>
						<option>Memur Yok</option>
						<%
							}
						%>
					</select>
					<p>
				</div>
			</div>
			<div class="control-grup">
				<div class="controls">
					<input type="submit" value="Memur Sil" style="width: 5.9cm;"
						class="btn">
				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>