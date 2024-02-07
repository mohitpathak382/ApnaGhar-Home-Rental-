<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.houseRental.model.House"%>
<%@ page import="com.houseRental.model.Customer"%>
<%@ page import="java.util.List"%>
<%@ page import="com.houseRental.dao.HouseDao"%>
<%@ page import="com.houseRental.daoimpl.HouseDAOImpl"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apna Ghar</title>
<link href="assets/displayHouse.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="/assets/images/old logo.svg">
<script src="https://kit.fontawesome.com/424b06daaf.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<%
	String cat = request.getParameter("category");
	String bhkParam = request.getParameter("bhk");
	String rentStartParam = request.getParameter("rent_start");
	String rentEndParam = request.getParameter("rent_end");

	// Initialize variables to store parsed parameters
	int bhk = 0;
	int rentStart = 0;
	int rentEnd = 0;

	// Parse the parameters if they are not null or empty
	if (bhkParam != null && !bhkParam.isEmpty()) {
		bhk = Integer.parseInt(bhkParam);
	}

	if (rentStartParam != null && !rentStartParam.isEmpty()) {
		rentStart = Integer.parseInt(rentStartParam);
	}

	if (rentEndParam != null && !rentEndParam.isEmpty()) {
		rentEnd = Integer.parseInt(rentEndParam);
	}

	HouseDao daoImpl = new HouseDAOImpl();
	List<House> houseList = daoImpl.searchHouseByParameter(cat, rentStart, rentEnd, bhk);

	Customer cust = (Customer) session.getAttribute("USER");
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

				 <form method="POST" action="bookmark.jsp?category=<%=cat%>&bhk=<%=bhk%>&rent_start=<%=rentStart%>&rent_end=<%=rentEnd%>">
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
