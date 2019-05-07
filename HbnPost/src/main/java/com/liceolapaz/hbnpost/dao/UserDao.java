package com.liceolapaz.hbnpost.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.liceolapaz.hbnpost.model.User;

@Repository
@Transactional
public class UserDao {
	@PersistenceContext
	private EntityManager entityManager;

	public void create(User user) {
		entityManager.persist(user);
		return;
	}

	public void delete(User user) {
		if (entityManager.contains(user))
			entityManager.remove(user);
		else
			entityManager.remove(entityManager.merge(user));
		return;
	}

	@SuppressWarnings("unchecked")
	public List<User> getAll() {
		return entityManager.createQuery("select u from User u").getResultList();
	}

	public User getById(int id) {
		return entityManager.find(User.class, id);
	}

	public User update(User user) {
		return entityManager.merge(user);
	}

	public User getByEmailAndPassword(String email, String password) {
		User result;

		try {
			result = (User) entityManager
					.createNativeQuery("SELECT * FROM USER WHERE EMAIL = :email AND PASSWORD = MD5(:password)",
							User.class)
					.setParameter("email", email).setParameter("password", password).getSingleResult();
		} catch (NoResultException ex) {
			result = null;
		}

		return result;
	}

	public int getNumPostByUser(User user) {
		int result;

		result = (int) entityManager.createQuery("select count(p) from Post p WHERE p.author = :author")
				.setParameter("author", user).setFirstResult(0).setMaxResults(1).getSingleResult();

		return result;
	}
}
