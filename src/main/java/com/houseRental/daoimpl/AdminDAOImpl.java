package com.houseRental.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

import com.houseRental.dao.AdminDao;
import com.houseRental.dbConnection.DbConnection;
import com.houseRental.model.Admin;
import com.houseRental.model.Customer;
import com.houseRental.model.House;

public class AdminDAOImpl implements AdminDao {

	@Override
	public boolean register(Admin admin) {
		boolean status = false;
		
		try(Connection con = DbConnection.getDatabaseConnection()){
			PreparedStatement pst=con.prepareStatement(
					"Insert Into Admin values(?,?)");
			
			pst.setString(1,admin.getUsername());
			pst.setString(2,admin.getPassword());
			
			int count =pst.executeUpdate();
			
			if(count > 0)
				status=true;
			
			}
		catch(SQLException ex) {
			ex.printStackTrace();
			return false;
		}
				
		return status;
	}

	@Override
	public boolean checkAdmin(Admin admin) {
		boolean status=false;
		
		try (Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst=con.prepareStatement(
													"select * From Admin " 
													+"where username Like ? and password like ?");
			pst.setString(1, admin.getUsername());
			pst.setString(2, admin.getPassword());
			
			ResultSet rs=pst.executeQuery();
			
			if(rs.isBeforeFirst())
				status=true;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return status;
	}
	

	@Override
	public List<Customer> getAllCustomer() {
List<Customer> Users =new ArrayList<>();
		
		try (Connection con =DbConnection.getDatabaseConnection()){
			PreparedStatement pst=con.prepareStatement("Select * from customer ");
	
			ResultSet rs =pst.executeQuery();
			if(rs.isBeforeFirst()) {
				while(rs.next()) {
					Customer cust = new Customer();
					cust.setName(rs.getString("name"));
					cust.setAddress(rs.getString("address"));
					cust.setUserid(rs.getString("username"));
					cust.setAge(rs.getInt("age"));
					cust.setCity(rs.getString("city"));
					cust.setContact(rs.getString("contact"));
					cust.setState(rs.getString("State"));
					cust.setPincode(rs.getString("pincode"));
					
					Users.add(cust);

				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			Users.clear();
			return Users;
		}
		return Users;
	}

}
