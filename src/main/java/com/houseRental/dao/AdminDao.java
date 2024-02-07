package com.houseRental.dao;
import java.util.List;

import com.houseRental.model.Admin;
import com.houseRental.model.Customer;

public interface AdminDao {

	boolean register(Admin admin);
	boolean checkAdmin(Admin admin);
	List<Customer> getAllCustomer();
}
