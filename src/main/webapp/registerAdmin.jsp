<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.houseRental.dao.AdminDao" %>
 <%@page import="com.houseRental.daoimpl.AdminDAOImpl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert </title>
</head>
<body>
<%
	String uname =request.getParameter("email");
	String pass =request.getParameter("password");
%>
<jsp:useBean id="admin" class="com.houseRental.model.Admin"></jsp:useBean>

<jsp:setProperty property="username" value="<%=uname%>" name="admin"></jsp:setProperty>
<jsp:setProperty property="password" value="<%=pass%>" name="admin"></jsp:setProperty>


<%
	AdminDao daoImpl= new AdminDAOImpl();
	if(daoImpl.register(admin))
		response.sendRedirect("AdminRegistration_Success.jsp");
	else
		response.sendRedirect("AdminRegistration_Failure.jsp");
%>
</body>
</html>