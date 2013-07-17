<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Scriptlet ile Tüm parametreler</title>
</head>
<body>
	<i>Kullanıcı Adı</i> : <%=request.getParameter("userID") %><p>
	<i>Password</i> : <% request.getParameter("password"); %><p>
	<i>Yaş</i> : <%= request.getParameter("yas") %><p>
	<i>Şehir</i> : <%= request.getParameter("place") %><p>
	<i>Ulke</i> : <% request.getParameter("ulke"); %>
</body>
</html>