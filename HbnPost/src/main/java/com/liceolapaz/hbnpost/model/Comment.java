package com.liceolapaz.hbnpost.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Comment {
	@Id
	@GeneratedValue
	private long id;

	@ManyToOne
	@JoinColumn(name = "user_id", updatable = false)
	private User user;

	@ManyToOne
	@JoinColumn(name = "post_id", updatable = false)
	private Post post;

	@Lob
	private String text;

	@CreationTimestamp
	private Date date;

	public Comment() {

	}

	public Comment(User user, Post post, String content, Date date) {
		this.user = user;
		this.post = post;
		this.text = content;
		this.date = date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}
