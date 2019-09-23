package com.skilldistillery.carma.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.carma.entities.Comment;
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
	
	@Override
	public boolean updateImage(User user, String imageURL) {
		boolean updated = false;
		User updatedUser = em.find(User.class, user.getId());
		updatedUser.setImage(imageURL);
		if(em.contains(updatedUser)) {
			updated = true;
		}
		
		return updated;
		
	}

	@Override
	public String getUpdatedImage(User user) {
		return em.find(User.class, user.getId()).getImage();
	}

	@Override
	public boolean checkUniqueUsername(String username) {
		String jpql = "Select u.username from User u";
		List<String> ls = em.createQuery(jpql, String.class).getResultList();
		if (ls.contains(username)) {
			return true;
		}
		return false;
	}

	@Override
	public void deleteComment(int commentId) {
		em.remove(em.find(Comment.class, commentId));
		return;
	}

	@Override
	public List<Comment> getAllComments(int userId) {
		String jpql = "Select c from Comment c where c.user.id = :id";
		return em.createQuery(jpql, Comment.class).setParameter("id", userId).getResultList();
	}
}
