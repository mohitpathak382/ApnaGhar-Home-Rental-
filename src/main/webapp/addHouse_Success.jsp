<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	out.println("<script>");
	out.println("$(document).ready(function(){");
	out.println("swal ( 'Message From Server' ,  'House Added successfully !!!' ," + "  'warning' );");
	out.println("});");
	out.println("</script>");
	%>

	<jsp:include page="adminHome.jsp"></jsp:include>
</body>
</html>