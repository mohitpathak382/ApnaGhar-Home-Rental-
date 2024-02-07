package com.houseRental.dao;

import com.houseRental.model.House;
import java.util.List;

public interface HouseDao {
	boolean addHouse(House  house);
	boolean deleteHouse(int houseid);
	boolean updateHouse(House house);
	List<House>getAllHouses(int start,int total);
	List<House> searchBookmarkedHouse(String userID);
	List<House>searchHouseByParameter(String category,int price_start,int price_end,int bhk);
	List<House>getAllHouses();
	boolean removeHouseAfterBooking(int houseid);
}
