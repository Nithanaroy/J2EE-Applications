<%@page import="user.controller.database_proses"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<jsp:useBean id="user" class="user.model.user_model" />
	<jsp:setProperty property="*" name="user" />
	<%
		database_proses proses = new database_proses();
		String secilen = session.getAttribute("secilen").toString();
		
		String username = user.getUsername();
		String parola = user.getPassword();
		
		if (secilen.equals("giris")) {
			
		}
		if (secilen.equals("kayit")) {
			proses.insert(username, parola);
		}
	%>
</body>
</html>