package com.skilldistillery.carma.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.carma.entities.ParkingFail;
import com.skilldistillery.carma.entities.Picture;
import com.skilldistillery.carma.entities.User;

@Transactional
@Service
public class ParkingFailDAOImpl implements ParkingFailDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Picture addPicture(Picture picture) {
			em.persist(picture);
			return picture;
	}

	@Override
	public List<ParkingFail> findAll() {
		String jpql = "Select p from ParkingFail p";
		List<ParkingFail> listOfParkingFails = em.createQuery(jpql, ParkingFail.class).getResultList();
		return listOfParkingFails;
	}

	@Override
	public ParkingFail findParkingFailById(int pfId) {
		return em.find(ParkingFail.class, pfId);
	}

	@Override
	public void createParkingFail(ParkingFail parkingFail) {
		em.persist(parkingFail);
		em.flush();
	}
	
	@Override
	public void updateParkingFail(ParkingFail parkingFail) {
		ParkingFail managed = em.find(ParkingFail.class, parkingFail.getId());
		managed.setCar(parkingFail.getCar());
		managed.setDescription(parkingFail.getDescription());
		managed.setFailTime(parkingFail.getFailTime());
		managed.setListOfPictures(parkingFail.getListOfPictures());
		managed.setLocation(parkingFail.getLocation());
		managed.setText(parkingFail.getText());
		managed.setTitle(parkingFail.getTitle());
		managed.setUser(parkingFail.getUser());
	}

	@Override
	public boolean deleteParkingFail(ParkingFail parkingFail) {
		if (em.contains(parkingFail)) {
			em.remove(em.find(ParkingFail.class, parkingFail.getId()));
			return true;
		}
		return false;
	}

	@Override
	public boolean addUser(User user) {
		if (em.contains(user)) {
			return false;
		} else {
			em.persist(user);
			em.flush();
			return true;
		}
	}
	
	

}
