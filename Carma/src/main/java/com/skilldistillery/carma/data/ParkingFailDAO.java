package com.skilldistillery.carma.data;

import java.util.List;

import com.skilldistillery.carma.entities.ParkingFail;
import com.skilldistillery.carma.entities.Picture;

public interface ParkingFailDAO {
	public Picture addPicture(Picture picture);
	public List<ParkingFail> findAll();
	public ParkingFail findParkingFailById(int pfId);
}