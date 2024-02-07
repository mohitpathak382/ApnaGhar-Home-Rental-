<%@page import="com.houseRental.daoimpl.AdminDAOImpl"%>
<%@page import="com.houseRental.dao.AdminDao"%>
<%@page import="com.houseRental.dbConnection.*"%>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Admin | Login Page</title>
<style>

</style>
</head>
<body>
	<div class="container">
<%
		String uid = request.getParameter("txtUid");
		String pass = request.getParameter("txtPassword");
%>
		<jsp:useBean id="admin" class="com.houseRental.model.Admin">
			<jsp:setProperty property="username" value="<%=uid %>" name="admin"></jsp:setProperty>
			<jsp:setProperty property="password" value="<%=pass %>" name="admin"></jsp:setProperty>
		</jsp:useBean>

<%
		AdminDao daoImpl= new AdminDAOImpl();
		if(daoImpl.checkAdmin(admin))
		{
			session.setAttribute("Admin", uid);
			response.sendRedirect("AdminLogin_Success.jsp");
		}
		else
			response.sendRedirect("AdminRegistration_Failure.jsp");
%>

</div>	
</body>
</html>