package com.liceolapaz.hbnpost.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.ColumnTransformer;
import org.hibernate.annotations.CreationTimestamp;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	private String name;

	private String email;

	@CreationTimestamp
	private Date registrationDate;

	private String city;

	@ColumnTransformer(write = " MD5(?) ")
	private String password;

	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	private Set<Comment> comments = new HashSet<>();

	@OneToMany(mappedBy = "author", fetch = FetchType.EAGER)
	private Set<Post> posts = new HashSet<>();

	public User() {

	}

	public User(String email, String name, String city, String password) {
		this.email = email;
		this.name = name;
		this.city = city;
		this.password = password;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Post> getPosts() {
		return posts;
	}

	public Set<Comment> getComments() {
		return comments;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", registrationDate=" + registrationDate
				+ ", city=" + city + ", password=" + password + "]";
	}
}
