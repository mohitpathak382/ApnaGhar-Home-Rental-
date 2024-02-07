<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.houseRental.model.Customer"%>
<%@page import="com.houseRental.dao.CustomerDao"%>
<%@page import="com.houseRental.daoimpl.CustomerDAOImpl"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home Rental</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="shortcut icon" href="/assets/images/old logo.svg">
<link href="assets/profile.css" rel="stylesheet" type="text/css" />
<link href="assets/jquery.lightbox-0.5.css" rel="stylesheet"
	type="text/css" media="screen" />
</head>
<body>

	<%
	Customer cust = (Customer) session.getAttribute("USER");
	%>


	<div id="header">
		<div id="btns">
			<button class="icons" id="HomeIcon" onclick="location.href='./dashboard.jsp'">
				<div class="headerDiv">Home</div>
			</button>
			<button class="icons" id="BookmarkIcon"
				onclick="location.href='/viewbookmarks.jsp'">
				<div class="headerDiv">Saved</div>
			</button>
			<button class="icons active" id="viewprofileIcon"
				onclick="location.href='viewprofile.jsp'">
				<div class="headerDiv">View Profile</div>
			</button>
			<button class="icons " id="LogOut"
				onclick="location.href='./userlogout.jsp'">
				<div class="headerDiv">Logout</div>
			</button>
		</div>
	</div>

	<div class="user-profile">
		<h1 style="text-align:center">User Profile</h1><br>
		<div class="profile-item">
			<div class="profile-label">Email ID:</div>
			<div class="profile-value"><%=cust.getUserid()%></div>
		</div>
		<div class="profile-item">
			<div class="profile-label">Name:</div>
			<div class="profile-value"><%=cust.getName()%></div>
		</div>
		<div class="profile-item">
			<div class="profile-label">Contact:</div>
			<div class="profile-value"><%=cust.getContact()%></div>
		</div>
		<div class="profile-item">
			<div class="profile-label">Age:</div>
			<div class="profile-value"><%=cust.getAge()%></div>
		</div>
		<div class="profile-item">
			<div class="profile-label">Pincode:</div>
			<div class="profile-value"><%=cust.getPincode()%></div>
		</div>
		<div class="profile-item">
			<div class="profile-label">Address:</div>
			<div class="profile-value"><%=cust.getAddress()%></div>
		</div>
	</div>


</body>
</html>