<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello JSP</title>
</head>
<body>
	<% response.setIntHeader("Refresh", 1); %>
	Aşağıda JSP Scripting Elementlerine örnekler Verilmiştir.<p>
	<%! String user = "Doğan Candan"; %><p>
	Date : <%=new Date() %><p>
	SessionID : <%= session.getId() %><p>
	ApplicationPath : <%= application.getContextPath() %><p>
	RequestMethod : <%=request.getMethod() %><p>
	Response-CharacterEncoding : <%=response.getCharacterEncoding() %><p>
	Bu kod <%=user %> tarafından hazırlanmıştır.<p>
</body>
</html>