<%@page import="proses.database_proses"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<title>Hoca Işlemleri</title>
<script lang="JavaScript">
		function popUp(URL) 
		{
			day = new Date();
			id = day.getTime();
			eval("page" + id + " = window.open(URL, '" + id + "', 'resizable=yes,width=560,height=520,left = 483,top = 134');");
		}
</script>
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
			<td style="width: 14cm; height: 10cm;"></td>
			<td style="width: 5cm;">
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('hoca_islemleri/not_ekle.jsp')"> Not
							Ekle</a></li>
				</ul> <br>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('hoca_islemleri/not_sil.jsp')"> Not Sil</a>
					</li>
				</ul> <br>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('hoca_islemleri/ogrencilerim.jsp')"> Öğrencilerim</a>
					</li>
				</ul>
			</td>
		</tr>
		<!--		<tr>
			<td></td>
			<td>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('hoca_islemleri/not_guncelle.jsp')">Not
							Güncelle</a></li>
				</ul>
			</td>
		</tr>
-->
	</table>
</body>