package com.liceolapaz.hbnpost.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.liceolapaz.hbnpost.model.Post;
import com.liceolapaz.hbnpost.model.User;

@Repository
@Transactional
public class PostDao {
	@PersistenceContext
	private EntityManager entityManager;

	public void create(Post post) {
		entityManager.persist(post);
		return;
	}

	public void delete(Post post) {
		if (entityManager.contains(post))
			entityManager.remove(post);
		else
			entityManager.remove(entityManager.merge(post));
		return;
	}

	@SuppressWarnings("unchecked")
	public List<Post> getAll() {
		return entityManager.createQuery("select p from Post p").getResultList();
	}

	public Post getById(long id) {
		return entityManager.find(Post.class, id);
	}

	public Post update(Post post) {
		return entityManager.merge(post);
	}

	public Post refresh(Post post) {
		entityManager.refresh(post);
		return post;
	}

	@SuppressWarnings("unchecked")
	public List<Post> getByAuthor(User user) {
		return entityManager.createQuery("select p from Post p where p.author :author").setParameter("author", user)
				.getResultList();
	}
}
