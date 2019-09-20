package com.skilldistillery.carma.data;

import com.skilldistillery.carma.entities.User;

public interface UserDAO {

	boolean addUser(User user);
	User validateUser(User user);
	boolean updateImage(User user, String imageURL);
	String getUpdatedImage(User user);
}
