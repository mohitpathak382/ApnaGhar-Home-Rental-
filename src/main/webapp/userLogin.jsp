<%@page import="com.houseRental.daoimpl.CustomerDAOImpl"%>
<%@page import="com.houseRental.dao.CustomerDao"%>
<%@page import="com.houseRental.model.Customer"%>
<%@page import="com.houseRental.dbConnection.*"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>USER | Login Page</title>
<style>
.container .warning {
	
}
</style>
</head>
<body>
	<div class="container">
		<%
		String uid = request.getParameter("txtUid");
		String pass = request.getParameter("txtPassword");
		%>
		<jsp:useBean id="user" class="com.houseRental.model.Customer">
			<jsp:setProperty property="userid" value="<%=uid%>" name="user"></jsp:setProperty>
			<jsp:setProperty property="password" value="<%=pass%>" name="user"></jsp:setProperty>
		</jsp:useBean>

		<%
		CustomerDao daoImpl = new CustomerDAOImpl();

		if (daoImpl.checkCustomer(user)) {

			try (Connection con = DbConnection.getDatabaseConnection()) {
				Customer cust = daoImpl.getUsname(user);
				session.setAttribute("USER", cust);
				session.setAttribute("role", "customer");
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			response.sendRedirect("dashboard.jsp");
		} else {
		%>
		<div class="form-group">
			<p style="color: red; font-size: 20px; text-align: center;">userId
				or password didn't match !!!</p>
		</div>
		<jsp:include page="customerLogin.html"></jsp:include>

		<%
		}
		%>
	</div>
</body>
</html>