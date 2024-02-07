package com.houseRental.model;

import java.io.Serializable;

public class Admin implements Serializable {
	
	private String Username;
	private String Password;
	public Admin() {
		super();
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
}
