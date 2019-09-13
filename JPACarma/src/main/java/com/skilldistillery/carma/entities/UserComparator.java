package com.skilldistillery.carma.entities;

import java.util.Comparator;

public class UserComparator implements Comparator<User> {
    
	
	@Override
    public int compare(User o1, User o2) {
		int carma1 = 0;
		int carma2 = 0;
		for (Carma carma : o1.getListOfCarma()) {
			carma1 = carma1 + carma.getVote();
		}
		for (Carma carma : o2.getListOfCarma()) {
			carma2 = carma2 + carma.getVote();
		}
		return carma1 - carma2;
    }


}