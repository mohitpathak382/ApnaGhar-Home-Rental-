package com.houseRental.dao;

import com.houseRental.model.Bookmark;

public interface HouseBookmarkDao {
	public boolean addBookmark(Bookmark bookmarked);
	public boolean deleteBookmark(Bookmark bookmarked);
}
