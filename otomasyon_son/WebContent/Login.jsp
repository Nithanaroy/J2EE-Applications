<%@page import="proses.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<title>Login</title>
<script type="text/javascript"> 
		function GeriTusiptal() 
        { 
        	window.history.forward(); 
        } 
        setTimeout("GeriTusiptal()", 0);
	</script>
</head>
<body onload="GeriTusiptal()" background="img/5.jpg">

	<form class="form-horizontal" action="user_girisi.jsp" method="post">
		<table>
			<tr>
				<td style="width: 12cm; height: 5cm;"></td>
				<td style="width: 17cm; color: #FFEBCD"><font
					style="font-size: medium;">&nbsp;&nbsp;&nbsp;KASTAMONU
						ÜNİVERSİTESİ FEN BİLİMLERİ ENSTİTÜSÜ ÖĞRENCİ OTOMASYONU</font></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<fieldset>
						<legend style="color: #FFEBCD">Giriş</legend>
						<div class="control-group">
							<label class="control-label" style="color: #FFEBCD">Kullanıcı
								Adı </label>
							<div class="controls">
								<input type="text" name="ID" placeholder="Kullanıcı Adı">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="color: #FFEBCD">Parola
							</label>
							<div class="controls">
								<input type="password" name="password" placeholder="Parola">
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
			<tr>
				<td></td>
				<td>
					<fieldset>
						<div class="control-group">
							<div class="controls">
								<a href="memur_islemleri/memur_ekle.jsp"><b
									style="color: #FFEBCD">Memur Kayıt</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="hoca_islemleri/hoca_ekle.jsp"><b
									style="color: #FFEBCD">Hoca Kayıt</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="ogrenci_islemleri/ogrenci_ekle.jsp"><b
									style="color: #FFEBCD">Öğrenci Kayıt</b></a>
							</div>
						</div>
					</fieldset>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>