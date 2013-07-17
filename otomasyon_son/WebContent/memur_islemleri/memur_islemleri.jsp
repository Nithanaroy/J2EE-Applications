<%@page import="proses.database_proses"%>
<%@page import="beans.tMemur"%>
<%@page import="java.beans.Beans"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script lang="JavaScript">
	function popUp(URL) {
		day = new Date();
		id = day.getTime();
		eval("page"
				+ id
				+ " = window.open(URL, '"
				+ id
				+ "', 'resizable=yes,width=560,height=520,left = 483,top = 134');");
	}
	function popUp2(URL) {
		day = new Date();
		id = day.getTime();
		eval("page"
				+ id
				+ " = window.open(URL, '"
				+ id
				+ "', 'resizable=yes,width=700,height=600,left = 483,top = 134');");
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<title>Memur Işlemleri</title>
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
							<li class="divider-vertical"></li>
							<li><a><%=session.getAttribute("ID")%></a></li>
							<li class="divider-vertical"></li>
							<li><a><%=session.getAttribute("isim")%></a></li>
							<li><a href="./guvenli_cikis.jsp">Güvenli Çıkış</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<table>
		<tr>
			<td style="width: 12cm; height: 3cm;"></td>
			<td style="width: 5cm;"></td>
			<td style="width: 1cm;"></td>
			<td style="width: 5cm;"></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('memur_islemleri/ders_ekle.jsp')"> Ders
							Ekle</a></li>
				</ul>
			</td>
			<td></td>
			<td>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('memur_islemleri/ders_guncelle.jsp')">Ders
							Güncelle</a></li>
				</ul>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('memur_islemleri/ders_sil.jsp')">Ders
							Çıkar</a></li>
				</ul>
			</td>
			<td></td>
			<td>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('memur_islemleri/memur_sil.jsp')">
							Memur Sil</a></li>
				</ul>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('memur_islemleri/hoca_sil.jsp')"> Hoca
							Sil</a></li>
				</ul>
			</td>
			<td></td>
			<td>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('memur_islemleri/ogrenci_sil.jsp')">
							Öğrenci Sil</a></li>
				</ul>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('memur_islemleri/hocaya_ders_ekle.jsp')">Derse
							Hoca Ekle</a></li>
				</ul>
			</td>
			<td></td>
			<td>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('memur_islemleri/ogrenciye_ders_ekle.jsp')">
							Derse Öğrenci Ekle</a></li>
				</ul>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('memur_islemleri/dersten_hoca_sil.jsp')">Dersten
							Hoca Sil</a></li>
				</ul>
			</td>
			<td></td>
			<td>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('memur_islemleri/dersten_ogrenci_sil.jsp')">
							Dersten Öğrenci Sil</a></li>
				</ul>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('memur_islemleri/on_kayitlar.jsp')">Ön
							Kayıtlı Öğrenciler</a></li>
				</ul>
			</td>
			<td></td>
			<td>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp2('memur_islemleri/ogrenci_belgesi.jsp')">Öğrenci
							Belgesi Oluştur</a></li>
				</ul>
			</td>
		</tr>
	</table>
</body>
</html>