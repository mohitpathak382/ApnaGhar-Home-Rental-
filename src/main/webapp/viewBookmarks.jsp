<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page  import = "com.houseRental.model.Customer" %>
    <%@ page  import = "com.houseRental.dao.HouseDao" %>
	<%@ page  import = "com.houseRental.model.House" %>
	<%@ page import="java.util.List"%>
    <%@ page import="com.houseRental.daoimpl.HouseDAOImpl"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="assets/displayHouse.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	HouseDao daoImpl = new HouseDAOImpl();
	Customer cust = (Customer) session.getAttribute("USER");
	String userid = cust.getUserid();
	List<House> houseList = daoImpl.searchBookmarkedHouse(userid);
	// Check if the house list is not empty
	if (houseList != null && !houseList.isEmpty()) {
	%>
	<div class="container">
		<%
		for (House house : houseList) {
			String imgsrc = request.getContextPath() + "/HouseImages/" + house.getImage();
		%>
		<div class="house-card">

			<img class="houseimg" src="<%=imgsrc%>" alt="House Image">
			<div class="house-details">

				<h2><%=house.getAddress()%></h2>
				<p>
					<strong>Owner Name:</strong>
					<%=house.getOwnerName()%></p>
				<p>
					<strong>Contact:</strong>
					<%=house.getLandlordContact()%></p>
				<p>
					<strong>Category:</strong>
					<%=house.getCategory()%></p>
				<p>
					<strong>Description:</strong>
					<%=house.getDescription()%></p>
				<p>
					<strong>Price:</strong>
					<%=house.getPrice()%></p>
				<a
					href="<%=request.getContextPath()%>/HouseImages/<%=house.getImage()%>">View
					Full Image</a>
				<%
				String userRole = (String) session.getAttribute("role");

				int houseId = house.getHouseid(); // Assuming _id is a String

				if ("Admin".equals(userRole)) {
				%>
				<!-- Show delete and modify buttons for admin -->
				<a id="btndelete" href="/removeHouse/<%=houseId%>"><i
					class="fa fa-trash"></i></a> <a class="btnupdate"
					href="/updateHouse/<%=houseId%>"><i class="fa fa-pencil"></i></a>
				<%
				} else if ("customer".equals(userRole)) {
				%>
				<!-- Show bookmark button for user -->

				<form method="POST" action="bookmark.jsp">
					<input type="hidden" name="userID" value="<%=cust.getUserid()%>">
					<input type="hidden" name="houseID" value="<%=houseId%>">


					<button name="wishlist" id="btnwishlist" type="submit"
						value="<%=house.getAddress()%>" title="Wishlist">
						<span><i class="fa-solid fa-bookmark"></i></span>
					</button>

				</form>

				<%
				}
				%>

			</div>
		</div>
		<%
		}
		%>
	</div>

	<%
	}
	%>

</body>
</html>