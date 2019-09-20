package com.skilldistillery.carma.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.carma.entities.User;

@Transactional
@Service
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;
	
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
	public User validateUser(User user) {
		String jpql = "Select u from User u where u.username LIKE :n";
		List<User> u = em.createQuery(jpql, User.class).setParameter("n", user.getUsername()).getResultList();
		if (u.size() == 0) {
			return null;
		}
		else {
			if (u.get(0).getPassword().equals(user.getPassword()))
			return u.get(0);
		}
		return null;
	}
}
