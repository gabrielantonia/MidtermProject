package com.skilldistillery.carma.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.carma.entities.ParkingFail;
import com.skilldistillery.carma.entities.Picture;

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

	public void createParkingFail(ParkingFail parkingFail) {
		// TODO Auto-generated method stub
		
	}

	public void updateParkingFail(ParkingFail parkingFail, int id) {
		// TODO Auto-generated method stub
		
	}

	public boolean deleteParkingFail(ParkingFail parkingFail) {
		// TODO Auto-generated method stub
		return false;
	}
}
