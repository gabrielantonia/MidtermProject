package com.skilldistillery.carma.data;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.carma.entities.Car;
import com.skilldistillery.carma.entities.Carma;
import com.skilldistillery.carma.entities.Comment;
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

	private static final String DATE_FORMATTER = "yyyy-MM-dd HH:mm:ss";
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
		List<ParkingFail> p = em.createQuery(jpql, ParkingFail.class).setParameter("keyword", "%" + keyword + "%")
				.getResultList();

		return p;
	}

//////////////////////////////////////////GALLERY///////////////////////////////////////
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
		Carma c = new Carma(em.find(User.class, parkingFail.getUser().getId()), parkingFail, 1, LocalDateTime.now());
		em.persist(parkingFail);
		em.persist(c);
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
		String jpql2 = "Delete from Carma c where c.parkingFail.id = :id";
		em.createQuery(jpql).setParameter("id", parkingFail.getId()).executeUpdate();
		em.createQuery(jpql2).setParameter("id", parkingFail.getId()).executeUpdate();
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
	public User findUserByUserId(int id) {
		String jpql = "Select u from User u where u.user.id=:id";
		return em.createQuery(jpql, User.class).setParameter("id", id).getSingleResult();
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
	public void addComment(Comment comment) {
		em.persist(comment);
		em.flush();
	}

	@Override
	public void addRankVote(int pfId) {
		LocalDateTime time = LocalDateTime.now();
		ParkingFail pf = em.find(ParkingFail.class, pfId);
		Carma carma = pf.getListOfCarma().get(0);
		if (carma != null) {
			carma.setVote(carma.getVote() + 1);
			carma.setDateVoted(time);
			// carma.setUser(findUserByUserId(userId);
			em.persist(carma);
			em.flush();
		}
	}

	public void insertCarma(Carma carma) {
		em.persist(carma);
		em.flush();
	}

}
