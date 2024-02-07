package com.houseRental.dao;

import com.houseRental.model.Order;
import java.util.List;

public interface OrderDao {
	boolean placeOrder(Order order);
	List<Order> getAllOrders();
	Order searchOrder(int OrderId);
	boolean changeOrderStatusToConfirmed(int orderId);
	boolean changeOrderStatusToCancelled(int orderId);
	List<Order> getAllOrdersForUser(String customerid);
}
