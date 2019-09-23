package com.skilldistillery.carma.data;

import java.util.List;

import com.skilldistillery.carma.entities.Comment;
import com.skilldistillery.carma.entities.User;

public interface UserDAO {

	boolean addUser(User user);
	User validateUser(User user);
	boolean updateImage(User user, String imageURL);
	String getUpdatedImage(User user);
	boolean checkUniqueUsername(String username);
	void deleteComment(int commentId);
	List<Comment> getAllComments(int i);
}
