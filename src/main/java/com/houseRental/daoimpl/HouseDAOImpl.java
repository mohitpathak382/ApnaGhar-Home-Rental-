package com.houseRental.daoimpl;

import java.sql.ResultSet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Objects;
import java.util.ArrayList;

import com.houseRental.dbConnection.DbConnection;
import com.houseRental.dao.HouseDao;
import com.houseRental.model.House;

public class HouseDAOImpl implements HouseDao {

	@Override
	
		public boolean addHouse(House house) {
		    try (Connection con = DbConnection.getDatabaseConnection();
		         PreparedStatement pst = con.prepareStatement("INSERT INTO House (houseid, address, category,bhk, ownermob, rent, about, ownername, img) VALUES (?, ?, ?,?, ?, ?, ?, ?, ?)")) {
		        pst.setInt(1, house.getHouseid());
		        pst.setString(2, house.getAddress() != null && !house.getAddress().isEmpty() ? house.getAddress() : "No address provided");
		        pst.setString(3, house.getCategory() != null && !house.getCategory().isEmpty() ? house.getCategory() : "No Category provided");
		        pst.setInt(4, house.getBhk());
		        pst.setString(5, house.getLandlordContact() != null && !house.getLandlordContact().isEmpty() ? house.getLandlordContact() : "LandlordContact");
		        pst.setInt(6, house.getPrice() );
		        pst.setString(7, house.getDescription() != null && !house.getDescription().isEmpty() ? house.getDescription() : "No Description provided");
		        pst.setString(8, house.getOwnerName() != null && !house.getOwnerName().isEmpty() ? house.getOwnerName() : "No OwnerName provided");
		        pst.setString(9, house.getImage());

		        int count= pst.executeUpdate();
				System.out.println(count);
		        return count > 0;
		
		    } catch (SQLException ex) {
		        ex.printStackTrace();
		        return false;
		    }
		}

	@Override
	public boolean deleteHouse(int houseid) {
		boolean status=false;
		
		try(Connection con = DbConnection.getDatabaseConnection()) {
			PreparedStatement pst =con.prepareStatement("Delete from house where houseid = ?");
			pst.setInt(1, houseid);
			
			int count = pst.executeUpdate();
			if(count > 0)
				status=true;
			System.out.println(count);
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return status;
	}
	@Override
	public List<House> searchBookmarkedHouse(String userID) {
		List<House> houseList =new ArrayList<>();
		
		try(Connection con = DbConnection.getDatabaseConnection()) {
			System.out.println(userID);
			PreparedStatement pst =con.prepareStatement("SELECT h.* FROM House h JOIN Bookmark b ON h.HouseID = b.HouseID WHERE b.UserID = ? ");
			
			pst.setString(1, userID);
			ResultSet rs = pst.executeQuery();
		
			if(rs.isBeforeFirst()) {
				while(rs.next()) {
					House house = new House();
					house.setHouseid(rs.getInt("houseid"));
					house.setAddress(rs.getString("address"));
					house.setCategory(rs.getString("category"));
					house.setDescription(rs.getString("about"));
					house.setPrice(rs.getInt("rent"));
					house.setLandlordContact(rs.getString("ownermob"));
					house.setOwnerName(rs.getString("ownername"));
					house.setImage(rs.getString("img"));
					house.setBhk(rs.getInt("bhk"));
					houseList.add(house); 
				}
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
			return houseList;
		}
		return houseList;
	}

	@Override
	public boolean updateHouse(House house) {
		boolean status=false;
		
		try(Connection con=DbConnection.getDatabaseConnection()) {
			PreparedStatement pst=con.prepareStatement("update house set rent=? ,about =? where houseid = ?");
			pst.setInt(1,house.getPrice());
			pst.setString(2, house.getDescription());
			pst.setInt(3, house.getHouseid());
			
			int count=pst.executeUpdate();
			if(count > 0)
				status=true;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return status;
	}

	@Override
	public List<House> getAllHouses(int start, int total) {
		List<House> houseList =new ArrayList<>();
		
		try (Connection con =DbConnection.getDatabaseConnection()){
			PreparedStatement pst=con.prepareStatement("Select * from house limit ?,?");
			pst.setInt(1, start-1);
			pst.setInt(2, total);
			
			ResultSet rs =pst.executeQuery();
			if(rs.isBeforeFirst()) {
				while(rs.next()) {
					House house = new House();
					house.setHouseid(rs.getInt("houseid"));
					house.setAddress(rs.getString("address"));
					house.setCategory(rs.getString("category"));
					house.setDescription(rs.getString("about"));
					house.setPrice(rs.getInt("rent"));
					house.setLandlordContact(rs.getString("ownermob"));
					house.setOwnerName(rs.getString("ownername"));
					house.setImage(rs.getString("img"));
					 house.setBhk(rs.getInt("bhk"));
					houseList.add(house); 
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			houseList.clear();
			return houseList;
		}
		return houseList;
	}
	@Override
	public List<House>searchHouseByParameter(String cat,int price_start,int price_end,int bhk){
		List<House> houseList=new ArrayList<>();
		try(Connection con = DbConnection.getDatabaseConnection()) {
			StringBuilder query=new StringBuilder("Select * FROM House Where 1=1 ");
			
			 List<Object> parameters = new ArrayList<>(); // to store parameters

			    if (cat !="") {
			        query.append(" AND category = ?");
			        parameters.add(cat);
			    }

			    if (bhk !=0) {
			        query.append(" AND bhk = ?");
			        parameters.add(bhk);
			    }

			    if (price_start!=0) {
			        query.append(" AND rent >= ?");
			        parameters.add(price_start);
			    }

			    if (price_end!=0) {
			        query.append(" AND rent <= ?");
			        parameters.add(price_end);
			    }
			PreparedStatement pst =con.prepareStatement(query.toString());
			for (int i = 0; i < parameters.size(); i++) {
	            Object paramValue = parameters.get(i);
	                pst.setObject(i + 1, paramValue);
	        }
			System.out.println(query);

			
			ResultSet rs= pst.executeQuery();
			if(rs.isBeforeFirst()) {
				while(rs.next()) {
					House house = new House();
					house.setHouseid(rs.getInt("houseid"));
					house.setAddress(rs.getString("address"));
					house.setCategory(rs.getString("category"));
					house.setDescription(rs.getString("about"));
					house.setPrice(rs.getInt("rent"));
					house.setLandlordContact(rs.getString("ownermob"));
					house.setOwnerName(rs.getString("ownername"));
					house.setImage(rs.getString("img"));
					 house.setBhk(rs.getInt("bhk"));
					houseList.add(house); 
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			houseList.clear();
			return houseList;
		}
		return houseList;
	}
	@Override
	public boolean removeHouseAfterBooking(int houseid) {
		boolean status=false;
		try(Connection con=DbConnection.getDatabaseConnection()) {
			PreparedStatement pst=con.prepareStatement("Delete from house where houseid = ?");
			pst.setInt(1, houseid);
			int count = pst.executeUpdate();
			if(count > 0){
				status=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return status;
	}

	@Override
	public List<House> getAllHouses() {
List<House> houseList =new ArrayList<>();
		
		try (Connection con =DbConnection.getDatabaseConnection()){
			PreparedStatement pst=con.prepareStatement("Select * from house ");
	
			ResultSet rs =pst.executeQuery();
			if(rs.isBeforeFirst()) {
				while(rs.next()) {
					House house = new House();
					house.setHouseid(rs.getInt("houseid"));
					house.setAddress(rs.getString("address"));
					house.setCategory(rs.getString("category"));
					house.setDescription(rs.getString("about"));
					house.setPrice(rs.getInt("rent"));
					house.setLandlordContact(rs.getString("ownermob"));
					house.setOwnerName(rs.getString("ownername"));
					house.setImage(rs.getString("img"));
					 house.setBhk(rs.getInt("bhk"));
					houseList.add(house); 
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			houseList.clear();
			return houseList;
		}
		return houseList;
	}

}
