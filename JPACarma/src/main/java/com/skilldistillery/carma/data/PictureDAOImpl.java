package com.skilldistillery.carma.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.carma.entities.Picture;

public class PictureDAOImpl implements PictureDAO {
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("Carma");
	private EntityManager em;

	@Override
	public Picture addPicture(Picture picture) {
			em = emf.createEntityManager();
			em.getTransaction().begin();
			em.persist(picture);
			em.flush();
			em.getTransaction().commit();
			em.close();
			return picture;
	}
	
	
}
