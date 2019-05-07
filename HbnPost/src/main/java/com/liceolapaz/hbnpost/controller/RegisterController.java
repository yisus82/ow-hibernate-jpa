package com.liceolapaz.hbnpost.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.liceolapaz.hbnpost.dao.UserDao;
import com.liceolapaz.hbnpost.model.User;
import com.liceolapaz.hbnpost.model.beans.RegisterBean;

@Controller
public class RegisterController {
	@Autowired
	private UserDao userDao;

	@GetMapping(value = "/signup")
	public String showForm(Model model) {
		model.addAttribute("userRegister", new RegisterBean());
		return "register";
	}

	@PostMapping(value = "/register")
	public String register(@ModelAttribute("userRegister") RegisterBean r, BindingResult result, Model model) {
		userDao.create(new User(r.getEmail(), r.getName(), r.getCity(), r.getPassword()));
		return "redirect:/authors";
	}
}
