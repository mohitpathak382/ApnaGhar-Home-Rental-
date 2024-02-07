package com.houseRental.daoimpl;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

import com.houseRental.dao.OrderDao;
import com.houseRental.dbConnection.DbConnection;
import com.houseRental.model.Order;

public class OrderDAOImpl implements OrderDao {

@Override
	public boolean placeOrder(Order order) {
		boolean status=false;
		try (Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = con.prepareStatement("insert into bookedhouse"
													+"(bookeddate,requesteddate,accepted,cancelled"
													+"confirmed,rent,custid,houseid)");
			pst.setDate(1, order.getBookeddate());
			pst.setDate(2, order.getRequesteddate());
			pst.setBoolean(3, true);
			pst.setBoolean(4, false);
			pst.setBoolean(5, false);
			pst.setInt(6, order.getRentamount());
			pst.setString(7, order.getCustomerid());
			pst.setInt(8, order.getHouseid());
			
			int count = pst.executeUpdate();
			
			if(count > 0 )
				status=true;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return status;
	}

	@Override
	public List<Order> getAllOrders() {
		List<Order> orderList = new ArrayList<>();
		
		try (Connection con = DbConnection.getDatabaseConnection()){
			PreparedStatement pst= con.prepareStatement("select * from bookedhouse");
			
		ResultSet rs=pst.executeQuery();
		if(rs.isBeforeFirst()) {
			while(rs.next()) {
				Order order = new Order();
				order.setOrderid(rs.getInt("orderid"));
				order.setHouseid(rs.getInt("houseid"));
				order.setCancelled(rs.getBoolean("cancelled"));
				order.setConfirmed(rs.getBoolean("confirmed"));
				order.setAccepted(rs.getBoolean("Accepted"));
				order.setRentamount(rs.getInt("rent"));
				order.setBookeddate(rs.getDate("bookeddate"));
				order.setRequesteddate(rs.getDate("requesteddate"));
				order.setCustomerid(rs.getString("custid"));
				
				orderList.add(order);
			}
		}
	} catch (SQLException e) {
			e.printStackTrace();
			orderList.clear();
			return orderList;
		}
		return null;
	}

	@Override
	public Order searchOrder(int OrderId) {
		
		Order order = null;
		try(Connection con = DbConnection.getDatabaseConnection()) {
			PreparedStatement pst  = con.prepareStatement("Select * from bookedhouse where orderid = ? ");
			pst.setInt(1, OrderId);
			ResultSet rs=pst.executeQuery();
			
			if(rs.isBeforeFirst()) {
				rs.next();
				order.setOrderid(rs.getInt("orderid"));
				order.setHouseid(rs.getInt("houseid"));
				order.setCancelled(rs.getBoolean("cancelled"));
				order.setConfirmed(rs.getBoolean("confirmed"));
				order.setAccepted(rs.getBoolean("Accepted"));
				order.setRentamount(rs.getInt("rent"));
				order.setBookeddate(rs.getDate("bookeddate"));
				order.setRequesteddate(rs.getDate("requesteddate"));
				order.setCustomerid(rs.getString("custid"));
				
			}
		} catch (SQLException e) {
		e.printStackTrace();
		return null;
		}
		return order;
	}

	@Override
	public boolean changeOrderStatusToConfirmed(int orderId) {
		boolean status=false;
		try (Connection con=DbConnection.getDatabaseConnection()){
			PreparedStatement pst = con.prepareStatement("Update bookedhouse "
													+"set confirmed = true where orderid=?");
			
			pst.setInt(1, orderId);
			int count = pst.executeUpdate();
			if(count >0)
				status= true;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return status;
	}

	@Override
	public boolean changeOrderStatusToCancelled(int orderId) {
		boolean status=false;
		try (Connection con = DbConnection.getDatabaseConnection()){
			PreparedStatement pst = con.prepareStatement("Update bookedhouse set cancelled = true where orderid = ?");
			pst.setInt(1, orderId);
			int count=pst.executeUpdate();
		if(count>0)
			status=true;
		
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return status;
	}

	@Override
	public List<Order> getAllOrdersForUser(String customerid) {
List<Order> orderList = new ArrayList<>();
		
		try(Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = 
					con.prepareStatement(
							"select * from bookedhouse"
							+ " where custid = ?");
			
			pst.setString(1, customerid);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.isBeforeFirst())
			{
				while(rs.next())
				{
					Order order = new Order();
					order.setOrderid(rs.getInt("orderid"));
					order.setBookeddate(rs.getDate("bookeddate"));
					order.setRequesteddate(
							rs.getDate("requesteddate"));
					order.setAccepted(rs.getBoolean("accepted"));
					order.setCancelled(rs.getBoolean("cancelled"));
					order.setConfirmed(rs.getBoolean("confirmed"));
					order.setRentamount(rs.getInt("rent"));
					order.setCustomerid(rs.getString("custrid"));
					order.setHouseid(rs.getInt("houseid"));
					
					orderList.add(order);
				}
			}
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
			orderList.clear();
			return orderList;
		}
		
		return orderList;
	}
	
	}
