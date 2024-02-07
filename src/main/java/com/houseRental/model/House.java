package com.houseRental.model;

import java.io.Serializable;

public class House implements Serializable {

		private int houseid;
		private String address;
		private String category;
		private String landlordContact;
		private String ownerName;
		private int price;
		private int bhk;
		public int getBhk() {
			return bhk;
		}
		public void setBhk(int bhk) {
			this.bhk = bhk;
		}
		private String description;
		public String getOwnerName() {
			return ownerName;
		}
		public void setOwnerName(String ownerName) {
			this.ownerName = ownerName;
		}
		public String getImage() {
			return image;
		}
		public void setImage(String image) {
			this.image = image;
		}
		private String image;
		
		public int getHouseid() {
			return houseid;
		}
		public void setHouseid(int houseid) {
			this.houseid = houseid;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getCategory() {
			return category;
		}
		public void setCategory(String category) {
			this.category = category;
		}
		public String getLandlordContact() {
			return landlordContact;
		}
		public void setLandlordContact(String landlordContact) {
			this.landlordContact = landlordContact;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
}
