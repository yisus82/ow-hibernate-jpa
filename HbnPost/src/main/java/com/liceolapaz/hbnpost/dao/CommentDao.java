package com.liceolapaz.hbnpost.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.liceolapaz.hbnpost.model.Comment;
import com.liceolapaz.hbnpost.model.Post;
import com.liceolapaz.hbnpost.model.User;

@Repository
@Transactional
public class CommentDao {
	@PersistenceContext
	private EntityManager entityManager;

	public void create(Comment comment) {
		entityManager.persist(comment);
		return;
	}

	public void delete(Comment comment) {
		if (entityManager.contains(comment))
			entityManager.remove(comment);
		else
			entityManager.remove(entityManager.merge(comment));
		return;
	}

	@SuppressWarnings("unchecked")
	public List<Post> getAll() {
		return entityManager.createQuery("select c from Comment c").getResultList();
	}

	public Post getById(long id) {
		return entityManager.find(Post.class, id);
	}

	public Comment update(Comment comment) {
		return entityManager.merge(comment);
	}

	public Comment refresh(Comment comment) {
		entityManager.refresh(comment);
		return comment;
	}

	@SuppressWarnings("unchecked")
	public List<Post> getByAuthor(User user) {
		return entityManager.createQuery("select c from Comment c where c.author :author").setParameter("author", user)
				.getResultList();
	}
}
