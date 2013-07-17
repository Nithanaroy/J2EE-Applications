<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>RegisterForm</title>
</head>
<body>
	<h3>Register Form</h3>
	<form:form action="registerform.html" commandName="registerForm">
		<table>
			<tr>
				<td>Name:<FONT color="red"><form:errors path="name" /></td>
			</tr>
			<tr>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td>Surname : <FONT color="red"><form:errors path="surname"/></td>
			</tr>
			<tr>
				<td><form:input path="surname" /></td>
			</tr>
			<tr>
				<td>User Name:<FONT color="red"><form:errors path="userName" /></td>
			</tr>
			<tr>
				<td><form:input path="userName" /></td>
			</tr>
			<tr>
				<td>Password:<FONT color="red"><form:errors	path="password" /></td>
			</tr>
			<tr>
				<td><form:password path="password" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit" /></td>
			</tr>
		</table>
	
	</form:form>
</body>
</html>