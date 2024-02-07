package com.houseRental.dbConnection;

public interface DbDetails {
	String CONSTR="jdbc:mysql://localhost:3306/houserentalsystem?useSSL=false";
	String USERNAME="root";
	String PASSWORD="password";
	String GETDRIVER="com.mysql.cj.jdbc.Driver";
}
