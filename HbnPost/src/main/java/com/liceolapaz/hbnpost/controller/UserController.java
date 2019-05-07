package com.liceolapaz.hbnpost.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.liceolapaz.hbnpost.dao.UserDao;
import com.liceolapaz.hbnpost.model.User;

@Controller
public class UserController {
	@Autowired
	private UserDao userDao;
	
	@GetMapping(value="/authors")
	public String authorList(Model model) {	
		List<User> authors = userDao.getAll();
		model.addAttribute("authors", authors);
		return "user-list";
	}
}
