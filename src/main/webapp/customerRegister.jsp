<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="com.houseRental.dao.CustomerDao"%>
<%@page import="com.houseRental.daoimpl.CustomerDAOImpl"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Registration</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="Homepage/style.css">
</head>
<body>
	<%
		String name = request.getParameter("name");
		String uid = request.getParameter("email");
		String contact = request.getParameter("contact");
		String address = request.getParameter("address");
		int age = Integer.parseInt(request.getParameter("age"));
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String pincode = request.getParameter("pincode");
		String pass = request.getParameter("password");
	%>	
	
	    <jsp:useBean id="customer" class="com.houseRental.model.Customer"> </jsp:useBean>
	
		<jsp:setProperty property="userid" value="<%=uid %>" name="customer"></jsp:setProperty>
		<jsp:setProperty property="password" value="<%=pass %>" name="customer"></jsp:setProperty>
		<jsp:setProperty property="name" value="<%=name %>" name="customer"></jsp:setProperty>
		<jsp:setProperty property="age" value="<%=age %>" name="customer"></jsp:setProperty>
		<jsp:setProperty property="contact" value="<%=contact %>" name="customer"></jsp:setProperty>
		<jsp:setProperty property="city" value="<%=city %>" name="customer"></jsp:setProperty>
		<jsp:setProperty property="state" value="<%=state %>" name="customer"></jsp:setProperty>
		<jsp:setProperty property="pincode" value="<%=pincode %>" name="customer"></jsp:setProperty>
		<jsp:setProperty property="address" value="<%=address %>" name="customer"></jsp:setProperty>
	
	<%
		CustomerDao daoImpl = new CustomerDAOImpl();
		if(daoImpl.register(customer)) {
			response.sendRedirect("UserRegistration_Success.jsp");		
		}
		else {
			response.sendRedirect("UserRegistration_Failure.jsp");
		}
	%>
</body>
</html>