<%@page import="proses.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/bootstrap_2.css" rel="stylesheet" media="screen">
<title>Öğrenci Kayıt</title>
</head>
<body>
	<div class="bs-docs-example">
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<a class="btn btn-navbar" data-toggle="collapse"
						data-target=".navbar-responsive-collapse"> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
					</a>
					<div class="nav-collapse collapse navbar-responsive-collapse">
						<ul class="nav">
							<li><a href="Login.jsp">Ana Sayfa</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form class="form-horizontal" action="on_kayit_tamamla.jsp"
		method="post">
		<table>
			<tr>
				<td style="width: 40%; height: 50px;"></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<fieldset>
						<legend>Öğrenci Ön Kayıt</legend>
						<p>
						<div class="control-grup">
							<label class="control-label">Mezun Olunan Bölüm* </label>
							<div class="controls">
								<select name="bolum">
									<%
										ArrayList<Object> bolumler = database_proses
												.veri_getir("select programAd from tProgramlar");
										int bolumID = 1;
										for (Object bolum_ad : bolumler) {
									%>
									<option value="<%=bolumID%>"><%=bolum_ad%></option>
									<%
										bolumID++;
										}
									%>
								</select>
							</div>
						</div>
						<br>
						<div class="control-group">
							<label class="control-label">Mezuniyet Puanı* </label>
							<div class="controls">
								<input type="text" name="puan"
									placeholder="100 uzerinden mezuniyet puanı">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">TC* </label>
							<div class="controls">
								<input type="text" name="tc" placeholder="TC Kimlik No">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Adınız* </label>
							<div class="controls">
								<input type="text" name="ad" placeholder="Adiniz">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Soyadınız* </label>
							<div class="controls">
								<input type="text" name="soyad" placeholder="Soyadınız">
							</div>
						</div>
						<p>
						<div class="control-group">
							<label class="control-label">Baba Adı* </label>
							<div class="controls">
								<input type="text" name="baba_ad" placeholder="Baba Adi">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Anne Adı* </label>
							<div class="controls">
								<input type="text" name="ana_ad" placeholder="Anne Adi">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Doğum Yeri* </label>
							<div class="controls">
								<input type="text" name="dogum_yeri" placeholder="İl - İlçe">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Doğum Tarihi* </label>
							<div class="controls">
								<input type="text" name="dogum_tarihi"
									placeholder="Gün - Ay - Yıl">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Telefon* </label>
							<div class="controls">
								<input type="text" name="telefon" placeholder="Telefon">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Adres* </label>
							<div class="controls">
								<textarea rows="5" cols="10" name="adres" placeholder="Adres"></textarea>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn">Kaydet</button>
							</div>
						</div>
					</fieldset>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>