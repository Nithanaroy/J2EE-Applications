<%@page import="bean.arac_bean"%>
<%@page import="islemler.hiz_karsilastir"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hız Kontrol</title>
</head>
<body>
	<% 
		String hiz = request.getParameter("hiz");
		String plakasi = request.getParameter("plaka");
	%>
	<jsp:useBean id="arac" class="bean.arac_bean"/>
	
	<!--  Bean'e veri eklemenin 1.yöntemi -->
	<jsp:setProperty property="arac_hızı" name="arac" value="<%= Integer.parseInt(hiz) %>"/>
	<jsp:setProperty property="plaka" name="arac" value="<%= plakasi %>"/>
	
	<!-- Bean'e veri eklemenin ikinci yöntemi -->
	<jsp:setProperty property="arac_hızı" name="arac" param="hiz"/>
	<jsp:setProperty property="plaka" name="arac" param="plaka"/>
	
	<!-- Bean'e veri eklemenin 3.yöntemi -->
	<jsp:setProperty name="arac" property="*"/>
	<%! arac_bean arac = new arac_bean(); %>
	<%
		int arac_hizi = arac.getArac_hızı();
		String plaka = arac.getPlaka();
		int hız_sınırı = arac.getHız_sınırı();
		boolean durum = hiz_karsilastir.hız_durumu(arac_hizi, hız_sınırı);
		if(durum)
			out.println(plaka+"'lı araciniz ile hayırlı yolculuklar.");
		else
			out.println(plaka+"'lı araciniza el koymuş bulunmaktayız aşagı ininiz !Lütfen.");
		
	%>
</body>
</html>