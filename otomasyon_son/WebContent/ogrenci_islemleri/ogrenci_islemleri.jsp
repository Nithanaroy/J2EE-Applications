<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="proses.*"%>
<%@page import="beans.tMemur"%>
<%@page import="java.beans.Beans"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script lang="JavaScript">
		function popUp(URL) 
		{
			day = new Date();
			id = day.getTime();
			eval("page" + id + " = window.open(URL, '" + id + "', 'resizable=yes,width=900,height=520,left = 483,top = 134');");
		}
		function GeriTusiptal() 
        { 
        	window.history.forward(); 
        } 
        setTimeout("GeriTusiptal()", 0); 
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<title>Öğrenci İşlemleri</title>
</head>
<body onload="GeriTusiptal()">
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
			<td style="width: 14cm; height: 2cm;"></td>
			<td style="width: 6cm;"></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('ogrenci_islemleri/dersler.jsp')">Derslerim</a>
					</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('ogrenci_islemleri/notlar.jsp')">Notlarım</a>
					</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<ul class="nav nav-tabs nav-stacked">
					<li class="active" style="text-align: center;"><a
						href="javascript:popUp('ogrenci_islemleri/transkript.jsp')">Transkriptim</a>
					</li>
				</ul>
			</td>
		</tr>
	</table>
</body>
</html>