<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.houseRental.dao.AdminDao" %>
      <%@ page import="com.houseRental.daoimpl.AdminDAOImpl" %>
        <%@ page import="com.houseRental.model.Customer" %>
          <%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/profile.css" type="text/css">
</head>
<body>

	<div id="header">
		<div id="btns">
			<button class="icons" id="HomeIcon" onclick="location.href='./adminHome.jsp'">
				<div class="headerDiv">Home</div>
			</button>
			<button class="icons" id="BookmarkIcon"
				onclick="location.href='houseImage_register.jsp'">
				<div class="headerDiv">Register House</div>
			</button>
			<button class="icons" id="BookmarkIcon"
				onclick="location.href='/search.jsp?category=&bhk=&rent_start=&rent_end=&search=Submit.jsp'">
				<div class="headerDiv">Houses</div>
			</button>
			<button class="icons active" id="viewprofileIcon"
				onclick="location.href='viewAllUsers.jsp'">
				<div class="headerDiv">View Profile</div>
			</button>
			<button class="icons " id="LogOut"
				onclick="location.href='./adminlogout.jsp'">
				<div class="headerDiv">Logout</div>
			</button>
		</div>
		
		<div class="user-profile">
        <h1 style="text-align:center">All Users</h1><br>

        <% 
            AdminDAOImpl adminDao = new AdminDAOImpl();
            List<Customer> userList = adminDao.getAllCustomer();
            
            for (Customer cust : userList) {
        %>

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

        <hr> <!-- Optional: Add a horizontal line between profiles -->

        <% } // end of for loop %>

    </div>
	</div>
	
	

</body>
</html>