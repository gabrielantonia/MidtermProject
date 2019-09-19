package com.skilldistillery.carma.data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.carma.entities.Carma;
import com.skilldistillery.carma.entities.ParkingFail;
import com.skilldistillery.carma.entities.ParkingFailComparator;
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
	public Carma findCarmaById(int pfId) {
		return em.find(Carma.class, pfId);
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
	public List<Carma> findCarmaListById(int id) {
		String jpql = "Select c from Carma c where p.user.id=:id";
		return em.createQuery(jpql, Carma.class).setParameter("id", id).getResultList();
	}


	@Override
	public List<Picture> findPicturesByUserId(int id) {
		String jpql = "select p from Picture p where p.parkingFail.user.id = :id";
		return em.createQuery(jpql, Picture.class).setParameter("id", id).getResultList();

	}
	
	@Override
	public void addCommentToCarma(Carma carma)
	{	
		em.persist(carma);
		em.flush();
	}
		
	}

