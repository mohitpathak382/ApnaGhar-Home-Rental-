package com.houseRental.model;

/**
 * @author MOHIT PATHAK
 *
 */
public class Bookmark {
	String bookmarkId;
	String houseId;
	String customerId;
	
	
	public Bookmark() {
		super();
	}
	public String getBookmarkId() {
		return bookmarkId;
	}
	public void setBookmarkId(String bookmarkId) {
		this.bookmarkId = bookmarkId;
	}
	public String getHouseId() {
		return houseId;
	}
	public void setHouseId(String houseId) {
		this.houseId = houseId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	
	
}
