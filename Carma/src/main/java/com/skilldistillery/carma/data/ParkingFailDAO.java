package com.skilldistillery.carma.data;

import java.util.List;
import java.util.Map;

import com.skilldistillery.carma.entities.Car;
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

	Map<Integer, String> findPicturesByUserId(int userId);

	Map<Integer, String> findAllPictures();

	Map<Integer, String> getImageIds(List<List<Picture>> lp);

	Map<Integer, String> getImageIdsFromList(List<Picture> listOfUrl);


	List<ParkingFail> findCarByLicensePlate(String licensePlate);

}
