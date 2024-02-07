<%@ page import="java.io.*, java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="com.houseRental.dao.HouseDao"%>
<%@ page import="com.houseRental.model.House"%>
<%@ page import="com.houseRental.daoimpl.HouseDAOImpl"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>House register</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="assets/HouseRegisterFrm.css">
    <link rel="shortcut icon" href="/assets/images/old logo.svg">
</head>

<body>

    <form class="form-container" action="" method="post">

        <div class="form-group">
            <label for="owner-name">Owner Name:</label>
            <input type="text" id="owner-name" name="owner-name" required>
        </div>

        <div class="form-group">
            <label for="owner-mobile">Owner Mobile:</label>
            <input type="text" id="owner-mobile" name="owner-mobile" required>
        </div>

        <div class="form-group">
            <label for="address">Address:</label>
            <textarea id="address" name="address" rows="1" required></textarea>
        </div>

        <div class="form-group">
            <label for="category">Category:</label>
            <select id="category" name="category" required>
                <option value="flat">Flat</option>
                <option value="house">House</option>
            </select>
        </div>
		<div class="form-group">
            <label>Bedroom:</label>
            <input type="number" id="bhk" name="bhk" Placeholder="BHK" required>
        </div>
        <div class="form-group">
            <label for="rent">Rent:</label>
            <input type="number" id="rent" name="rent" required>
        </div>

        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="2" required></textarea>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>

    </form>

    <%
    	String imgName = (String) session.getAttribute("imageName");
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String ownerName = request.getParameter("owner-name");
            String ownerMobile = request.getParameter("owner-mobile");
            String address = request.getParameter("address");
            String category = request.getParameter("category");
            String description = request.getParameter("description");
            int rent = Integer.parseInt(request.getParameter("rent"));
            int bhk=Integer.parseInt(request.getParameter("bhk"));

            HouseDao daoImpl = new HouseDAOImpl();
            House house = new House();
            house.setOwnerName(ownerName);
            house.setLandlordContact(ownerMobile);
            house.setAddress(address);
            house.setCategory(category);
        	house.setPrice(rent);
            house.setDescription(description);
            house.setImage(imgName);
            house.setBhk(bhk);

            if (daoImpl.addHouse(house)) {
                response.sendRedirect("addHouse_Success.jsp");
            } else {
                response.sendRedirect("addHouse_Failure.jsp");
            }
        }
    %>

</body>
</html>
