<%@page import="proses.database_proses"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
<title>Not Ekle</title>
</head>
<body style="color: #FFEBCD">
	<fieldset>
		<!-- Tarih alanı -->
		<legend style="color: #FFEBCD">Not Ekle</legend>
		<form class="form-horizontal" method="post">
			<div class="control-grup">
				<label class="control-label">Yıl </label>
				<div class="controls">
					<input value="2012 - 2013" disabled="disabled" type="text"
						style="width: 2.2cm;"> <font>&nbsp;Yariyil&nbsp;&nbsp;&nbsp;</font>
					<input value="Bahar" type="text" disabled="disabled"
						style="width: 1.5cm;">
				</div>
			</div>
			<p>
				<!-- Hocanın Dersleri -->
			<div class="control-grup">
				<label class="control-label" style="color: #FFEBCD">Derslerim</label>
				<div class="controls">
					<select name="dersKod" style="width: 6cm;">
						<%
	  						ArrayList<Object> hocaninDersleri = 
	  							database_proses.veri_getir("select dersKod from tdersHocasi where hocaID='"+database_proses.getID()+"'");
	  					if (hocaninDersleri.size() > 0 && hocaninDersleri.get(0) != null)
	  					{
	  						for(Object dersler : hocaninDersleri)
	  						{
	  							Object dersAd = database_proses.veri_getir("select dersAd from tDers where dersKod='"+dersler+"'").get(0); 
	  							if(dersAd != null)
	  							{
	  						%>
						<option value="<%=dersler %>"><%=dersler+ " - " +dersAd %></option>
						<%	}
	  							else
	  							{	
	  						%>
						<option value="null">Size Atanmış Ders Yok.</option>
						<%	}
	  						}
	  					}
	  					else
	  					{
	  				%>
						<option>Size Atanmış Ders Yok.</option>
						<%	} %>
					</select>
				</div>
			</div>
			<p>
			<div class="control-grup">
				<div class="controls">
					<input type="submit" value="Dersi Alan Öğrenciler" class="btn"
						style="width: 6cm;">
				</div>
			</div>
		</form>
		<%
  			if (request.getParameter("dersKod") != null)
  			{
  				Object dersAd = database_proses.veri_getir("select dersAd from tDers where dersKod='"+request.getParameter("dersKod")+"'").get(0);
  		  		ArrayList<Object> dersin_ogrencisi = 
  		  				database_proses.veri_getir("select ogrenciID from tNot where dersKod='"+request.getParameter("dersKod")+"'");
  			%>
		<form class="form-horizontal" action="islem_tamamla.jsp" method="post">
			<input type="hidden" name="islem" value="not_ekle"> <input
				type="hidden" name="dersKod"
				value="<%=request.getParameter("dersKod")%>"> <input
				type="hidden" name="yil" value="<%=request.getParameter("yil")%>">
			<input type="hidden" name="yariyil"
				value="<%=request.getParameter("yariyil")%>"> <label
				style="font-size: large;"> <%=database_proses.veri_getir("select dersAd from tDers where dersKod='"+request.getParameter("dersKod")+"'").get(0) %>
				Dersini Alanlar
			</label>
			<table class="table table-bordered" style="color: #FFEBCD">
				<tr>
					<th>ÖğrenciNo</th>
					<th>ÖğrenciAd</th>
					<th>DersAdı</th>
					<th>Vize</th>
					<th>Final</th>
					<th>Büt</th>
					<th>HBN</th>
					<th>HarfNotu</th>
					<th>GecmeDurumu</th>
				</tr>
				<%
 						if (dersin_ogrencisi.size() > 0 && dersin_ogrencisi.get(0) != null)
 						{
 							//ogrenci listesi sonraki not eklemeler için yenilendi.Yenilenmezse devamına yazılacağı için veriler karışacak.
 							database_proses.ogrenci_liste = new ArrayList<String>();
 							ArrayList<Object> vize=null, _final=null, butunleme=null, harfNot = null, HBN = null, gecme_durumu=null;
 							for (int i=0; i < dersin_ogrencisi.size() ; i++)
 							{
 								database_proses.veriler(database_proses.ogrenci_liste, dersin_ogrencisi.get(i)+"");
 								vize = database_proses.veri_getir("select vize from tNot where dersKod='"+request.getParameter("dersKod")+
 	 									"' and ogrenciID='"+dersin_ogrencisi.get(i)+"'");
 								_final = database_proses.veri_getir("select final from tNot where dersKod='"+request.getParameter("dersKod")+
 	 									"' and ogrenciID='"+dersin_ogrencisi.get(i)+"'");
 								butunleme = database_proses.veri_getir("select butunleme from tNot where dersKod='"+request.getParameter("dersKod")+
 	 									"' and ogrenciID='"+dersin_ogrencisi.get(i)+"'");
 								harfNot = database_proses.veri_getir("select harfNotu from tNot where dersKod='"+request.getParameter("dersKod")+
 									"' and ogrenciID='"+dersin_ogrencisi.get(i)+"'");
 								HBN = database_proses.veri_getir("select HBN from tNot where dersKod='"+request.getParameter("dersKod")+
 	 									"' and ogrenciID='"+dersin_ogrencisi.get(i)+"'");
 								gecme_durumu = database_proses.veri_getir("select gecmeDurumu from tNot where dersKod='"+request.getParameter("dersKod")+
 	 									"' and ogrenciID='"+dersin_ogrencisi.get(i)+"'");
 							%>
				<tr>
					<td><%=dersin_ogrencisi.get(i) %></td>
					<td><%=database_proses.isim_getir(dersin_ogrencisi.get(i)+"", "tOgrenci") %></td>
					<td><%=dersAd %></td>
					<td>
						<%
	 								if (vize.size() > 0 && vize.get(0) != null){
 									%> <input type="text" name="vize<%=i %>"
						value="<%=vize.get(0) %>" style="width: 1.5cm;"> <%
 									}else{
 									%> <input type="text" name="vize<%=i %>" value="-1"
						style="width: 1.5cm;"> <%	} %>
					</td>
					<td>
						<%
 									if (_final.size() > 0 && _final.get(0) != null){
 									%> <input type="text" name="_final<%=i %>"
						value="<%=_final.get(0) %>" style="width: 1.5cm;"> <%
 									}else{
 									%> <input type="text" name="_final<%=i %>" value="-1"
						style="width: 1.5cm;"> <%	} %>
					</td>
					<td>
						<%
 									if (butunleme.size() > 0 && butunleme.get(0) != null){
 									%> <input type="text" name="butunleme<%=i %>"
						value="<%=butunleme.get(0) %>" style="width: 1.5cm;"> <%
 									}else{
 									%> <input type="text" name="butunleme<%=i %>" value="-1"
						style="width: 1.5cm;"> <%	} %>
					</td>
					<td>
						<%
 									if (HBN.size() > 0 && HBN.get(0) != null){
 									%> <input type="text" name="HBN<%=i %>"
						value="<%=HBN.get(0) %>" style="width: 1.5cm;"> <%
 									}else{
 									%> <input type="text" name="HBN<%=i %>" value="-1"
						style="width: 1.5cm;"> <%  	} %>
					</td>
					<td>
						<%
 									if (harfNot.size() > 0 && harfNot.get(0) != null){
 									%> <input type="text" name="harfNotu<%=i %>"
						value="<%=harfNot.get(0) %>" style="width: 1.5cm;"> <%
 									}else{
 									%> <input type="text" name="harfNotu<%=i %>" value="-1"
						style="width: 1.5cm;"> <%	} %>
					</td>
					<td>
						<%
 									if (gecme_durumu.size() > 0 && gecme_durumu.get(0) != null){
 									%> <input type="text" name="gecmeDurumu<%=i %>"
						value="<%=gecme_durumu.get(0) %>" style="width: 2cm;"> <%
 									}else{
 									%> <input type="text" name="gecmeDurumu<%=i %>" value="-1"
						style="width: 1.5cm;"> <%	} %>
					</td>
				</tr>
				<%	}
 						}else{
 						%>
				<tr>
					<td>Öğrenci Yok</td>
					<td>Öğrenci Yok</td>
					<td>Ders Yok</td>
					<td>Not Yok</td>
					<td>Not Yok</td>
					<td>Not Yok</td>
					<td>Not Yok</td>
					<td>Not Yok</td>
					<td>Değer Yok</td>
				</tr>
				<%	} %>
				<tr>
					<%
 								int gecen_sayisi = database_proses.durum_say("Gecenler",request.getParameter("dersKod"));
 								int kalan_sayisi = database_proses.durum_say("Kalanlar",request.getParameter("dersKod"));
 							%>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>Gecen Sayisi</td>
					<td><%=gecen_sayisi %></td>
					<td>Kalan Sayisi</td>
					<td><%=kalan_sayisi %></td>
				</tr>
			</table>
			<div style="text-align: center;">
				&nbsp;&nbsp;<input class="btn" type="submit" value="Vize Kaydet"
					style="width: 4.9cm;" name="btn"> <input class="btn"
					type="submit" value="Final Kaydet" style="width: 4.9cm;" name="btn">
				<input class="btn" type="submit" value="But Kaydet"
					style="width: 4.9cm;" name="btn">
			</div>
		</form>
		<%	} %>
	</fieldset>
</body>
</html>