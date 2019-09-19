package com.skilldistillery.carma.data;

import java.util.ArrayList;
import java.util.List;

import com.skilldistillery.carma.entities.Carma;
import com.skilldistillery.carma.entities.ParkingFail;
import com.skilldistillery.carma.entities.Picture;
import com.skilldistillery.carma.entities.User;

public interface ParkingFailDAO {
	public Picture addPicture(Picture picture);

	public List<ParkingFail> findAll();

	public ParkingFail findParkingFailById(int pfId);

	void createParkingFail(ParkingFail parkingFail);

	boolean deleteParkingFail(ParkingFail parkingFail);

	void updateParkingFail(ParkingFail parkingFail);

	boolean addUser(User user);

	public List<ParkingFail> findParkingFailByUserId(int id);

	ParkingFail findParkingFailOfDay();

	User findUserOfDay();

	ArrayList<ParkingFail> findTopParkingFailByAmount(int j);


	List<ParkingFail> findCarByLicensePlate(String licensePlate);

	List<Picture> findAllPictures();

	public List<Picture> findPicturesByUserId(int id);

	List<ParkingFail> findParkingFailByKeyword(String keyword);

	Carma findCarmaById(int id);
	
	List<Carma> findCarmaListById(int id);


}
