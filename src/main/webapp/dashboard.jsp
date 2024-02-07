
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
 <%@page import="com.houseRental.model.Customer" %>
 <%@page import="com.houseRental.daoimpl.CustomerDAOImpl"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Apna Ghar Home</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="assets/dashboardStyle.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="/assets/images/old logo.svg">
</head>

<body background="assets/images/dBg.jpg">

  <div id="header">
    <div id="btns">
      <button class="icons active " id="HomeIcon" onclick="location.href='dashboard.jsp'">
        <div class="headerDiv">Home</div>
      </button>
      <button class="icons" id="BookmarkIcon" onclick="location.href='viewBookmarks.jsp'">
        <div class="headerDiv">Saved</div>
      </button>
      <button class="icons" id="viewprofileIcon"  onclick="location.href='viewprofile.jsp'">
        <div class="headerDiv">View Profile</div>
      </button>
      <button class="icons" id="LogOut"  onclick="location.href='userlogout.jsp'">
         <div class="headerDiv">Logout</div>
      </button>
    </div>
 </div>
 <% Customer cust = (Customer) session.getAttribute("USER");%>
 <div class="hellomessage">
 Hello <%= cust.getName() %>
		</div>
		
    <div id="preferenceForm">
    <p id="title"><span id="title1">Search as per your requirements </span></p>
    <form id="pform" action="search.jsp" method="post">
         <input type="text" list="category" name="category" placeholder="House/flat" >
   	   	   <datalist id="category">
   	   	   	    <option value="House">
   	   	   	    <option value="Flat">
   	   	   </datalist>
         <input type="number" min="1" list="Size(BHK)" name="bhk" placeholder="1 BHK" > 
    
         <datalist id="Size(BHK)">
                <option value="1">
                <option value="2">
                <option value="3">
                <option value="4">
                <option value="5">
                <option value="6">               
        </datalist>
        <input type="number" name="rent_start" placeholder="Mininum Rent" >
        <input type="number" name="rent_end" placeholder="Maximum Rent" >
        <input type="submit" id="submitBtn" name="search">
    </form>
</div>
    
</body>

<script type="text/javascript">
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("scrollToTopBtn").style.display = "block";
  } else {
    document.getElementById("scrollToTopBtn").style.display = "none";
  }
  
  if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
    document.getElementById("scrollToTopBtn").style.display = "block";
  }
}

function scrollToTop() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}


    var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
    (function(){
    var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
    s1.async=true;
    s1.src='https://embed.tawk.to/631a4d6054f06e12d893953c/1gcfbshqu';
    s1.charset='UTF-8';
    s1.setAttribute('crossorigin','*');
    s0.parentNode.insertBefore(s1,s0);
    })();
    
    </script>
</html>

