package com.skilldistillery.carma.data;

import java.util.List;

import com.skilldistillery.carma.entities.Picture;

public interface PictureDAO {
	public Picture addPicture(Picture picture);
	public List<Picture> findAll();
	public Picture findPictureByUserId(int userId);
}
