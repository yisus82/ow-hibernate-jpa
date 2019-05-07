package com.liceolapaz.hbnpost.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.liceolapaz.hbnpost.dao.CommentDao;
import com.liceolapaz.hbnpost.dao.PostDao;
import com.liceolapaz.hbnpost.model.Comment;
import com.liceolapaz.hbnpost.model.Post;
import com.liceolapaz.hbnpost.model.User;
import com.liceolapaz.hbnpost.model.beans.CommentBean;
import com.liceolapaz.hbnpost.model.beans.PostBean;

@Controller
public class PostController {
	@Autowired
	private PostDao postDao;

	@Autowired
	CommentDao commentDao;

	@Autowired
	private HttpSession httpSession;

	@GetMapping(value = "/posts")
	public String showForm(Model model) {
		model.addAttribute("post", new PostBean());
		return "post";
	}

	@PostMapping(value = "/posts")
	public String submitPost(@ModelAttribute("post") PostBean postBean, BindingResult result, Model model) {
		Post post = new Post();
		post.setTitle(postBean.getTitle());
		post.setContent(postBean.getContent());
		post.setUrl(postBean.getUrl());
		User author = (User) httpSession.getAttribute("userLoggedIn");
		post.setAuthor(author);
		postDao.create(post);
		author.getPosts().add(post);
		return "redirect:/";
	}

	@GetMapping(value = "/posts/{id}")
	public String detail(@PathVariable("id") long id, Model model) {
		Post result = null;
		if ((result = postDao.getById(id)) != null) {
			model.addAttribute("post", result);
			model.addAttribute("commentForm", new CommentBean());
			return "post-detail";
		} else {
			return "redirect:/";
		}
	}

	@PostMapping(value = "/posts/comment")
	public String submitComment(@ModelAttribute("commentForm") CommentBean commentBean, BindingResult result,
			Model model) {
		User author = (User) httpSession.getAttribute("userLoggedIn");

		Comment comment = new Comment();
		comment.setUser(author);

		Post post = postDao.getById(commentBean.getPost_id());
		comment.setPost(post);
		comment.setText(commentBean.getContent());

		commentDao.create(comment);

		post.getComments().add(comment);
		author.getComments().add(comment);

		return "redirect:/posts/" + commentBean.getPost_id();
	}

}
