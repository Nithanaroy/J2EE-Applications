<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>String Bean</title>
</head>
<body>
	<b><i>Using Java Bean &amp; JSP</i></b><p>
	<jsp:useBean id="s_bean" class="bean.string_bean"/>
	bean_getProperty : <jsp:getProperty property="message" name="s_bean"/><p>
	scriplet_getProperty : <%=s_bean.getMessage() %><p>
	bean_setProperty oldu. <jsp:setProperty property="message" name="s_bean" value="Doğan Candan - 11060565"/><p>
	bean_getProperty : <jsp:getProperty property="message" name="s_bean"/><p>
	scriplet_getProperty : <% s_bean.getMessage(); %> s_bean.getMessage() kullanılarak verinin içeriğine erişilemedi.
	
</body>
</html>