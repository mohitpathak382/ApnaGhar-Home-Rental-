package com.houseRental.model;


public class Customer {
	
	private String userid;
	private String Password;
	private String name;
	private String  contact;
	private int age;
	private String state;
	private String city;
	private String pincode;
	private String address;
	
	public Customer(String userid, String name, String contact, int age, String pincode,
			String address) {
		super();
		this.userid = userid;
		this.name = name;
		this.contact = contact;
		this.age = age;
		this.pincode = pincode;
		this.address = address;
	}

	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getPassword() {
		return Password;
	}
	
	public void setPassword(String password) {
		Password = password;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getContact() {
		return contact;
	}
	
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	public String getCity() {
		return city;
	}
	
	public void setCity(String city) {
		this.city = city;
	}
	
	public String getPincode() {
		return pincode;
	}
	
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public Customer() {
		super();
	}
}