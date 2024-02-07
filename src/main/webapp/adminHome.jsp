<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
<link rel="stylesheet" href="assets/AdminHome.css" type="text/css">
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
				onclick="location.href='./userlogout.jsp'">
				<div class="headerDiv">Logout</div>
			</button>
		</div>
	</div>
	<h2> Welcome <%=session.getAttribute("Admin")%> </h2>
	
</body>
</html>