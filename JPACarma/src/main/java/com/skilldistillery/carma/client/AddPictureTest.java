package com.skilldistillery.carma.client;

import java.time.LocalDateTime;

import com.skilldistillery.carma.data.PictureDAOImpl;
import com.skilldistillery.carma.entities.Car;
import com.skilldistillery.carma.entities.Location;
import com.skilldistillery.carma.entities.ParkingFail;
import com.skilldistillery.carma.entities.Picture;
import com.skilldistillery.carma.entities.User;

public class AddPictureTest {

	public static void main(String[] args) {
		LocalDateTime ldt = LocalDateTime.now();
		PictureDAOImpl pdi = new PictureDAOImpl();
		pdi.addPicture(new Picture("google.com/images", new ParkingFail("newtest", new Car("212", "Honda", "civic", "black", "fast", "dsf"), new User("test3", "test", "test"), new Location("name", "715", "test", "CA", "ttest"), ldt, "terrible")));
	}
}
