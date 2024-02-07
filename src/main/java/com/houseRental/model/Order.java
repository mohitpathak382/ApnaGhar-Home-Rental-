package com.houseRental.model;
import java.sql.Date;
public class Order {
	private int orderid;
	private String customerid;
	private int houseid;
	private Date bookeddate;
	private Date requesteddate;
	private boolean accepted;
	private boolean cancelled;
	private boolean confirmed; 
	private int rentamount;
	
	public int getRentamount() {
		return rentamount;
	}

	public void setRentamount(int rentamount) {
		this.rentamount = rentamount;
	}

	public Order() {
	super();
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public String getCustomerid() {
		return customerid;
	}

	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}

	public int getHouseid() {
		return houseid;
	}

	public void setHouseid(int houseid) {
		this.houseid = houseid;
	}

	public Date getBookeddate() {
		return bookeddate;
	}

	public void setBookeddate(Date bookeddate) {
		this.bookeddate = bookeddate;
	}

	public Date getRequesteddate() {
		return requesteddate;
	}

	public void setRequesteddate(Date requesteddate) {
		this.requesteddate = requesteddate;
	}

	public boolean isAccepted() {
		return accepted;
	}

	public void setAccepted(boolean accepted) {
		this.accepted = accepted;
	}

	public boolean isCancelled() {
		return cancelled;
	}

	public void setCancelled(boolean cancelled) {
		this.cancelled = cancelled;
	}

	public boolean isConfirmed() {
		return confirmed;
	}

	public void setConfirmed(boolean confirmed) {
		this.confirmed = confirmed;
	}

}
