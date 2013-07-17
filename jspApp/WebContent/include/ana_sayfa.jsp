<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<b><i>Bugunku Haberlerimiz Aşağıda Belirtilmiştir.<code>Hayırlı Günler</code> </i></b>
	<hr>
		<jsp:include page="./haber_one.jsp">
			<jsp:param value="bgColor" name="RED"/>
		</jsp:include>
	<hr>
		<jsp:include page="./haber_two.jsp">
			<jsp:param value="bgColor" name="Yellow"/>
		</jsp:include>
	<hr>
	<jsp:plugin code="" codebase="" type="bean">
		<jsp:fallback>
			<b>Error javada</b>
		</jsp:fallback>
	</jsp:plugin>
	<hr>
</body>
</html>