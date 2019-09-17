package com.skilldistillery.carma;

import com.skilldistillery.carma.data.ParkingFailDAOImpl;

public class Test {

	public static void main(String[] args) {
		ParkingFailDAOImpl pf = new ParkingFailDAOImpl();
//		System.out.println(pf.findAllPictures());
		System.out.println(pf.findPicturesByUserId(1));
	}

}
