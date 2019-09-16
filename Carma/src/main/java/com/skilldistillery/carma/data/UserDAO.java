package com.skilldistillery.carma.data;

import com.skilldistillery.carma.entities.User;

public interface UserDAO {

	boolean addUser(User user);
	User validateUser(User user);
}
