package com.houseRental.daoimpl;

import java.sql.*;

import com.houseRental.dao.HouseBookmarkDao;
import com.houseRental.dbConnection.DbConnection;
import com.houseRental.model.Bookmark;

public class HouseBookmarkDaoImpl implements HouseBookmarkDao {

	@Override
	public boolean addBookmark(Bookmark bookmarked) {
		try (Connection con = DbConnection.getDatabaseConnection();
	             PreparedStatement pst = con.prepareStatement("INSERT INTO bookmark (BookmarkID, UserID, HouseID) VALUES (?, ?, ?)")) {
				System.out.println(bookmarked.getCustomerId());
	            pst.setString(1, bookmarked.getBookmarkId());
	            pst.setString(2, bookmarked.getCustomerId());
	            pst.setString(3, bookmarked.getHouseId());

	            int count = pst.executeUpdate();

	            return count > 0;

	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	@Override
	public boolean deleteBookmark(Bookmark bookmarked) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
