<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="com.houseRental.dao.HouseBookmarkDao" %>
<%@ page import="com.houseRental.daoimpl.HouseBookmarkDaoImpl" %>
<%@ page import="com.houseRental.model.Bookmark" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Bookmark Page</title>
    <!-- Include SweetAlert library -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>

<%
    // Retrieve parameters from the form action URL
    String category = request.getParameter("category");
    String bhk = request.getParameter("bhk");
    String rentStart = request.getParameter("rent_start");
    String rentEnd = request.getParameter("rent_end");

    String userID = request.getParameter("userID");
    String houseID = request.getParameter("houseID");

    // Print values to the console
    System.out.println("User ID: " + userID);
    System.out.println("House ID: " + houseID);
    System.out.println("Category: " + category);
    System.out.println("BHK: " + bhk);
    System.out.println("Rent Start: " + rentStart);
    System.out.println("Rent End: " + rentEnd);

    HouseBookmarkDao daoImpl = new HouseBookmarkDaoImpl();
    Bookmark bookmarked = new Bookmark();
    bookmarked.setCustomerId(userID);
    bookmarked.setHouseId(houseID);

    try {
        if (daoImpl.addBookmark(bookmarked)) {
%>
            <script>
                $(document).ready(function(){
                    swal('Message From Server', 'House Saved successfully !!!', 'information');
                });
            </script>
<%
        } else {
%>
            <script>
                $(document).ready(function(){
                    swal('Error', 'An error occurred while bookmarking the house.', 'error');
                });
            </script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            $(document).ready(function(){
                swal('Error', 'An unexpected error occurred.', 'error');
            });
        </script>
<%
    }
%>

<jsp:include page="search.jsp">
    <jsp:param name="category" value="<%= category %>"/>
    <jsp:param name="bhk" value="<%= bhk %>"/>
    <jsp:param name="rent_start" value="<%= rentStart %>"/>
    <jsp:param name="rent_end" value="<%= rentEnd %>"/>
</jsp:include>

</body>
</html>
