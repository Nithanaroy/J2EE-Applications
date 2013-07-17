<%@page import="proses.ogrenci_no_hesapla"%>
<%@page import="proses.database_proses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/bootstrap.css" rel="stylesheet" media="screen">
<title>Transkriptim</title>
</head>
<body>
	<%
		ArrayList<Object> dersAdlar = new ArrayList<Object>();
		ArrayList<Object> vizeNotlar = new ArrayList<Object>();
		ArrayList<Object> finalNotlar = new ArrayList<Object>();
		ArrayList<Object> butNotu = new ArrayList<Object>();
		ArrayList<Object> gecmeNotu = new ArrayList<Object>();
		ArrayList<Object> harfNotu = new ArrayList<Object>();
		ArrayList<Object> hocaAd = new ArrayList<Object>();
		ArrayList<Object> ders_yillari = database_proses.veri_getir("select distinct yil from tNot where ogrenciID='"+database_proses.getID()+"'");
		String [] yariyillar = {"Guz","Bahar"};
		for (Object ders_yili : ders_yillari)
		{
			for (String yariyil : yariyillar)
			{
				ArrayList<Object> dersKodlar = database_proses.veri_getir("select dersKod from tNot where ogrenciID='"+database_proses.getID()+"' and yil='"+ders_yili+"' and yariyil='"+yariyil+"'");
				for (Object dersKod : dersKodlar)
				{
					ArrayList<Object> ders_value = database_proses.veri_getir("select dersAd from tDers where dersKod='"+dersKod+"'");
					ArrayList<Object> vize_value = database_proses.veri_getir("select vize from tNot where ogrenciID='"+database_proses.getID()+"' and dersKod='"+dersKod+"'");
					ArrayList<Object> final_value = database_proses.veri_getir("select final from tNot where ogrenciID='"+database_proses.getID()+"' and dersKod='"+dersKod+"'");
					ArrayList<Object> but_value = database_proses.veri_getir("select butunleme from tNot where ogrenciID='"+database_proses.getID()+"' and dersKod='"+dersKod+"'");
					ArrayList<Object> HBN_value = database_proses.veri_getir("select HBN from tNot where ogrenciID='"+database_proses.getID()+"' and dersKod='"+dersKod+"'");
					ArrayList<Object> harf_value = database_proses.veri_getir("select harfNotu from tNot where ogrenciID='"+database_proses.getID()+"' and dersKod='"+dersKod+"'");
					ArrayList<Object> hocaID_value = database_proses.veri_getir("select hocaID from tdersHocasi where dersKod='"+dersKod+"'");
					//dersAd
					if (ders_value.get(0) != null)
						dersAdlar.add(ders_value.get(0));
					else
						dersAdlar.add("---");
					//VizeNot
					if (vize_value.get(0) != null)
						vizeNotlar.add(vize_value.get(0));
					else
						vizeNotlar.add("---");
					//FinalNot
					if (final_value.get(0) != null)
						finalNotlar.add(final_value.get(0));
					else
						finalNotlar.add("---");
					//BütNot
					if (but_value.get(0) != null)
						butNotu.add(but_value.get(0));
					else
						butNotu.add("---");
					//Gecme Notu
					if (HBN_value.get(0) != null)
						gecmeNotu.add(HBN_value.get(0));
					else
						gecmeNotu.add("---");
					//HarfNotu
					if (harf_value.get(0) != null)
						harfNotu.add(harf_value.get(0));
					else
						harfNotu.add("---");
					if (hocaID_value.get(0) != null)
					{
						for(Object hocaID : hocaID_value)
							hocaAd.add(database_proses.isim_getir(hocaID+"", "tHoca"));
					}
				}
	%>
	<fieldset>
		<legend style="color: #FFEBCD"><%=ders_yili +" "+yariyil %>
			dönemli bilgilerim
		</legend>
		<table class="table table-bordered" style="color: #FFEBCD">
			<tr>
				<th>DersKodu</th>
				<th>DersAd</th>
				<th>Hoca</th>
				<th>Vize</th>
				<th>Final</th>
				<th>Büt</th>
				<th>HBN</th>
				<th>HarfNot</th>
			</tr>
			<%
				if (dersKodlar.size() > 0)
				{
					for (int i=0; i < dersKodlar.size() ; i++)
					{%>
			<tr>
				<td><%=dersKodlar.get(i) %></td>
				<td><%=dersAdlar.get(i) %></td>
				<td><%=hocaAd.get(i) %></td>
				<td><%=vizeNotlar.get(i) %></td>
				<td><%=finalNotlar.get(i) %></td>
				<td><%=butNotu.get(i) %></td>
				<td><%=gecmeNotu.get(i) %></td>
				<td><%=harfNotu.get(i) %></td>
			</tr>
			<%
					}
					dersAdlar.clear();
					vizeNotlar.clear();
					finalNotlar.clear();
					butNotu.clear();
					gecmeNotu.clear();
					harfNotu.clear();
					hocaAd.clear();
				}
				else
				{
				%>
			<tr>
				<td>Ders Yok</td>
				<td>Ders Yok</td>
				<td>Hoca Yok</td>
				<td>Not Yok</td>
				<td>Not Yok</td>
				<td>Not Yok</td>
				<td>Not Yok</td>
				<td>Not Yok</td>
			</tr>
			<%	} %>
		</table>
	</fieldset>
	<%
			}
		}
	%>
</body>
</html>