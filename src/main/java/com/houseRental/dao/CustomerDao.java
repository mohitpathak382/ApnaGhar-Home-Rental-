package com.houseRental.dao;
import com.houseRental.model.Customer;

public interface CustomerDao {
	boolean register(Customer customer);
	boolean checkCustomer(Customer customer);
	Customer getUsname(Customer customer);
}
