package com.skilldistillery.carma.data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.carma.entities.Car;
import com.skilldistillery.carma.entities.Location;
import com.skilldistillery.carma.entities.ParkingFail;
import com.skilldistillery.carma.entities.ParkingFailComparator;
import com.skilldistillery.carma.entities.ParkingFailDTO;
import com.skilldistillery.carma.entities.Picture;
import com.skilldistillery.carma.entities.User;
import com.skilldistillery.carma.entities.UserComparator;

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

////////////////////////////////////////////////////////////////////////////////
//SEARCH LICENSE PLATES
	@Override
	public List<ParkingFail> findCarByLicensePlate(String licensePlate) {
		String jpql = "SELECT p FROM ParkingFail p WHERE p.car.licensePlate LIKE :id";
		List<ParkingFail> p = em.createQuery(jpql, ParkingFail.class).setParameter("id", licensePlate).getResultList();
		
		return p;
	}
////////////////////////////////////////////////////////////////////////////////
	@Override
	public List<ParkingFail> findParkingFailByKeyword(String keyword) {
		String jpql = "SELECT p FROM ParkingFail p WHERE p.title LIKE :keyword ";
		List<ParkingFail> p = em.createQuery(jpql, ParkingFail.class).setParameter("keyword", "%"+ keyword+ "%").getResultList();
		
		return p;
	}
	
	
	
	
////GALLERY
	@Override
	public List<Picture> findAllPictures() {
		String jpql = "SELECT picture FROM Picture picture";
		List<Picture> listOfPictures = em.createQuery(jpql, Picture.class).getResultList();
		return listOfPictures;
	}

////////////////////////////////////////////////////////////////////////////////
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
	public void updateParkingFail(ParkingFailDTO pfd, int id, String url) {
		ParkingFail managed = em.find(ParkingFail.class, id);
		Car car = managed.getCar();
		car.setLicensePlate(pfd.getLicensePlate());
		car.setAlias(pfd.getAlias());
		car.setColor(pfd.getColor());
		car.setDescription(pfd.getDescription());
		car.setMake(pfd.getMake());
		car.setModel(pfd.getModel());
		Location location = managed.getLocation();
		location.setCity(pfd.getCity());
		location.setName(pfd.getName());
		location.setState(pfd.getState());
		location.setStreet(pfd.getStreet());
		location.setZip(pfd.getZip());
		managed.setTitle(pfd.getTitle());
		managed.getListOfPictures().get(0).setUrl(pfd.getUrl());
		em.flush();
	}

	@Override
	public boolean deleteParkingFail(ParkingFail parkingFail) {
		String jpql = "Delete from Picture p where p.parkingFail.id = :id";
		int deleted = em.createQuery(jpql).setParameter("id", parkingFail.getId()).executeUpdate();
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
	@Override
	public ParkingFail findParkingFailOfDay() {
		ArrayList<ParkingFail> allPF = (ArrayList<ParkingFail>) findAll();
		ParkingFailComparator pfc = new ParkingFailComparator();
		// need to alter so only get results from current day, if none for day, most
		// recent day
		Collections.sort(allPF, pfc);
		Collections.reverse(allPF);
		return allPF.get(0);
	}

	// Implement session
	@Override
	public ArrayList<ParkingFail> findTopParkingFailByAmount(int j) {
		ArrayList<ParkingFail> allPF = (ArrayList<ParkingFail>) findAll();
		ParkingFailComparator pfc = new ParkingFailComparator();
		Collections.sort(allPF, pfc);
		Collections.reverse(allPF);
		ArrayList<ParkingFail> topList = new ArrayList<ParkingFail>();
		for (int i = 0; i < j; i++) {
			topList.add(allPF.get(i));
		}
		return topList;
	}

//	Implement session
	@Override
	public User findUserOfDay() {
		ArrayList<User> userList = new ArrayList<User>();
		ArrayList<ParkingFail> allPF = (ArrayList<ParkingFail>) findAll();
		for (ParkingFail parkingFail : allPF) {
			userList.add(parkingFail.getUser());
		}

		UserComparator pfc = new UserComparator();
		Collections.sort(userList, pfc);
		return userList.get(0);
	}

	@Override
	public List<ParkingFail> findParkingFailByUserId(int id) {
		String jpql = "Select p from ParkingFail p where p.user.id=:id";
		return em.createQuery(jpql, ParkingFail.class).setParameter("id", id).getResultList();
	}


	@Override
	public List<Picture> findPicturesByUserId(int id) {
		String jpql = "select p from Picture p where p.parkingFail.user.id = :id";
		return em.createQuery(jpql, Picture.class).setParameter("id", id).getResultList();

	}

}
