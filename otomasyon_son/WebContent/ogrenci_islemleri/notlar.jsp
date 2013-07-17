<%@page import="proses.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
<title>Notlarım</title>
<script type="text/javascript">
		function on_submit() 
		{
			document.getElementById("date_form").submit();
		}
	</script>
</head>
<body style="color: #FFEBCD">
	<form class="form-horizontal" id="date_form">
		<input type="hidden" value="2012 - 2013" name="yil" id="yil">
		<fieldset>
			<legend style="color: #FFEBCD">Notlarım</legend>
			<div class="control-grup">
				<label class="control-label">Yıl</label>
				<div class="controls">
					<input type="text" disabled="disabled" value="2012 - 2013"
						style="width: 2cm;"> <font style="font-size: small;">&nbsp;&nbsp;&nbsp;Yarıyıl&nbsp;&nbsp;&nbsp;</font>
					<select name="yariyil" style="width: 2cm;" id="yariyil">
						<option value="Guz">Güz</option>
						<option value="Bahar">Bahar</option>
					</select>
				</div>
			</div>
			<p>
			<div class="control-grup">
				<div class="controls">
					<input type="button" value="Dönemdeki Notlarım"
						style="width: 6.2cm;" onclick="on_submit()">
				</div>
			</div>
			<p>
		</fieldset>
	</form>
	<%
		if(request.getParameter("yariyil") != null)
		{
	%>
	<fieldset>
		<legend style="color: #FFEBCD"><%=request.getParameter("yil")+ " "+request.getParameter("yariyil")+" Dönemindeki Derslerim" %></legend>
		<%
			ArrayList<Object> dersKodlar = database_proses.veri_getir("select dersKod from tNot where ogrenciID='"+database_proses.getID()+"' and yariyil='"+request.getParameter("yariyil")+"'");
			ArrayList<Object> dersAdlari = new ArrayList<Object>();
			ArrayList<Object> dersHocasiID = new ArrayList<Object>();
			ArrayList<Object> hoca_isim = new ArrayList<Object>();
			ArrayList<Object> vize_notlari = new ArrayList<Object>();
			ArrayList<Object> final_notlari = new ArrayList<Object>();
			ArrayList<Object> but_notlari = new ArrayList<Object>();
			ArrayList<Object> HBN = new ArrayList<Object>();
			ArrayList<Object> harf_not = new ArrayList<Object>();
			
			for(Object dersKod : dersKodlar)
			{
				//öğrencinin derslerinin adları
				ArrayList<Object> dersAd = database_proses.veri_getir("select dersAd from tDers where dersKod='"+dersKod+"'");
				if(dersAd.size() > 0)
					dersAdlari.add(dersAd.get(0));
				else
					dersAdlari.add("---");
				//öğrencinin aldığı derslerin hocalarının numaraları
				ArrayList<Object> hocaID = database_proses.veri_getir("select hocaID from tdersHocasi where dersKod='"+dersKod+"'"); 
				if(hocaID.size() > 0)
					dersHocasiID.add(hocaID.get(0));
				else
					dersHocasiID.add("---");
				//öğrencinin aldığı derslerdeki vize notları
				ArrayList<Object> vize = database_proses.veri_getir("select vize from tNot where dersKod='"+dersKod+"' and ogrenciID='"+database_proses.getID()+"'"); 
				if(vize.size() > 0)
					vize_notlari.add(vize.get(0));
				else
					vize_notlari.add("---");
				//öğrencinin aldığı derslerdeki final notları
				ArrayList<Object> _final = database_proses.veri_getir("select final from tNot where dersKod='"+dersKod+"' and ogrenciID='"+database_proses.getID()+"'"); 
				if(_final.size() > 0)
					final_notlari.add(_final.get(0));
				else
					final_notlari.add("---");
				//öğrencinin aldıı derslerdeki butunleme notları
				ArrayList<Object> butunleme = database_proses.veri_getir("select butunleme from tNot where dersKod='"+dersKod+"' and ogrenciID='"+database_proses.getID()+"'"); 
				if(butunleme.size() > 0)
					but_notlari.add(butunleme.get(0));
				else
					but_notlari.add("---");
				//HBN
				ArrayList<Object>gecme_notu = database_proses.veri_getir("select HBN from tNot where dersKod='"+dersKod+"' and ogrenciID='"+database_proses.getID()+"'"); 
				if(gecme_notu.size() > 0)
					HBN.add(gecme_notu.get(0));
				else
					HBN.add("---");
				//harf_not
				ArrayList<Object> harf = database_proses.veri_getir("select harfNotu from tNot where dersKod='"+dersKod+"' and ogrenciID='"+database_proses.getID()+"'"); 
				if(harf.size() > 0)
					harf_not.add(harf.get(0));
				else
					harf_not.add("---");
			}
			if (dersHocasiID.size() > 0)
			{
				for(Object hocaID : dersHocasiID)
				{
					if(hocaID.equals("---"))
						hoca_isim.add("---");
					else 
						hoca_isim.add(database_proses.isim_getir(hocaID+"", "tHoca"));
				}
			}
	%>
		<table class="table table-bordered">
			<tr>
				<th>DersKod</th>
				<th>DersAdı</th>
				<th>Vize</th>
				<th>Final</th>
				<th>Büt</th>
				<th>HBN</th>
				<th>HarfNot</th>
				<th>Hoca</th>
			</tr>
			<%
				for(int i = 0 ; i < dersAdlari.size() ; i++)
				{%>
			<tr>
				<td><%=dersKodlar.get(i) %></td>
				<td><%=dersAdlari.get(i) %></td>
				<td><%=vize_notlari.get(i) %></td>
				<td><%=final_notlari.get(i) %></td>
				<td><%=but_notlari.get(i) %></td>
				<td><%=HBN.get(i) %></td>
				<td><%=harf_not.get(i) %></td>
				<td><%=hoca_isim.get(i) %></td>
			</tr>
			<%}
			if(dersKodlar.size() == 0)
			{%>
			<tr>
				<td>Ders Yok</td>
				<td>Ders Yok</td>
				<td>Not Yok</td>
				<td>Not Yok</td>
				<td>Not Yok</td>
				<td>Not Yok</td>
				<td>Not Yok</td>
				<td>Hoca Yok</td>
			</tr>
			<%} %>
		</table>
		<%}%>
	</fieldset>
</body>
</html>