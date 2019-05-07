package com.liceolapaz.hbnpost.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.liceolapaz.hbnpost.dao.PostDao;
import com.liceolapaz.hbnpost.model.Post;

@Controller
public class MainController {
	@Autowired
	private PostDao postDao;

	@GetMapping(value = "/")
	public String welcome(Model model) {
		List<Post> posts = postDao.getAll();
		model.addAttribute("postList", posts);
		return "index";
	}
}
