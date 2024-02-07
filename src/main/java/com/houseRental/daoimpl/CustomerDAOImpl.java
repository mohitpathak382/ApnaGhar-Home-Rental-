package com.houseRental.daoimpl;

import java.sql.Connection;



import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.houseRental.dao.CustomerDao;
import com.houseRental.dbConnection.DbConnection;
import com.houseRental.model.Customer;

public class CustomerDAOImpl implements CustomerDao {

	@Override
	public boolean register(Customer customer) {
		boolean status=false;
		
		try (Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst =con.prepareStatement("Insert into customer values(?,?,?,?,?,?,?,?,?)");
			
			pst.setString(1, customer.getUserid());
			pst.setString(2, customer.getPassword());
			pst.setString(3, customer.getName());
			pst.setString(4, customer.getContact());
			pst.setInt(5, customer.getAge());
			pst.setString(6, customer.getState());
			pst.setString(7, customer.getCity());
			pst.setString(8, customer.getPincode());
			pst.setString(9, customer.getAddress());
			
			int count= pst.executeUpdate();
			System.out.println(count);
			if(count> 0)
				status=true;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return status;
	}

	@Override
	public boolean checkCustomer(Customer customer) {
		boolean status= false;
		
		try(Connection con = DbConnection.getDatabaseConnection()){
		
			PreparedStatement pst = con.prepareStatement(
					"select * from customer where email = ? and password = ?");
		
			pst.setString(1,customer.getUserid() );
			pst.setString(2,customer.getPassword() );
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.isBeforeFirst()) {
				System.out.println("Done : ");
				status=true;
			}	
		}
		catch(SQLException ex) {
			ex.printStackTrace();
			return false;
		}
		return status;
	}

	@Override
	public Customer getUsname(Customer cust) {
			Customer user=null;
			try(Connection con = DbConnection.getDatabaseConnection()){
				
				PreparedStatement pst = con.prepareStatement(
						"select * from customer where email = ?" );
				
					pst.setString(1,cust.getUserid());
					
					ResultSet rs = pst.executeQuery();
					
					if(rs.isBeforeFirst()) {
						rs.next();
						user = new Customer(rs.getString("email"),rs.getString("name"),rs.getString("contact"),rs.getInt("age"),rs.getString("pincode"),rs.getString("address"));
					}	
				}
				catch(SQLException ex) {
					ex.printStackTrace();
					return null ;
				}
				return user;
			}

}
