<%@page import="proses.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
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
							<li><a href="../Login.jsp">Ana Sayfa</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form class="form-horizontal" action="kayit_tamamla.jsp" method="post">
		<table>
			<tr>
				<td style="width: 40%; height: 50px;"></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<fieldset>
						<legend style="color: #FFEBCD">Öğrenci Kayıt</legend>
						<div class="control-grup">
							<label class="control-label" style="color: #FFEBCD">Fakülte*
							</label>
							<div class="controls">
								<select name="fakulteID">
									<%
										ArrayList<Object> fakülteler = database_proses
												.veri_getir("select fakulteAd from tFakulte");
										int fakulteID = 1;
										for (Object fakulte_ad : fakülteler) {
									%>
									<option value="<%=fakulteID%>"><%=fakulte_ad%></option>
									<%
										fakulteID++;
										}
									%>
								</select>
							</div>
						</div>
						<br>
						<div class="control-grup">
							<label class="control-label" style="color: #FFEBCD">Bölüm*
							</label>
							<div class="controls">
								<select name="bolumID">
									<%
										ArrayList<Object> bölümler = database_proses
												.veri_getir("select bolumAd from tBolum");
										int bolumID = 1;
										for (Object bölüm_ad : bölümler) {
									%>
									<option value="<%=bolumID%>"><%=bölüm_ad%></option>
									<%
										bolumID++;
										}
									%>
								</select>
							</div>
						</div>
						<br>
						<div class="control-group">
							<label class="control-label" style="color: #FFEBCD">TC* </label>
							<div class="controls">
								<input type="text" name="tc" placeholder="TC Kimlik No">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="color: #FFEBCD">Adınız*
							</label>
							<div class="controls">
								<input type="text" name="ad" placeholder="Adiniz">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="color: #FFEBCD">Soyadınız*
							</label>
							<div class="controls">
								<input type="text" name="soyad" placeholder="Soyadınız">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="color: #FFEBCD">Baba
								Adı* </label>
							<div class="controls">
								<input type="text" name="baba_ad" placeholder="Baba Adi">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="color: #FFEBCD">Anne
								Adı* </label>
							<div class="controls">
								<input type="text" name="ana_ad" placeholder="Anne Adi">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="color: #FFEBCD">Doğum
								Yeri* </label>
							<div class="controls">
								<input type="text" name="dogum_yeri" placeholder="İl - İlçe">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="color: #FFEBCD">Doğum
								Tarihi* </label>
							<div class="controls">
								<input type="text" name="dogum_tarihi"
									placeholder="Gün - Ay - Yıl">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="color: #FFEBCD">Telefon*
							</label>
							<div class="controls">
								<input type="text" name="telefon" placeholder="Telefon">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="color: #FFEBCD">Parola*
							</label>
							<div class="controls">
								<input type="password" name="password" placeholder="Parola">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="color: #FFEBCD">Adres*
							</label>
							<div class="controls">
								<textarea rows="5" cols="10" name="adres" placeholder="Adres"></textarea>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn">Tamamla</button>
							</div>
						</div>
					</fieldset>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>