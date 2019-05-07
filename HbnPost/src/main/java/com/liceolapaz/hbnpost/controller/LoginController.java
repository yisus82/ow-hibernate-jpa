package com.liceolapaz.hbnpost.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.liceolapaz.hbnpost.dao.UserDao;
import com.liceolapaz.hbnpost.model.User;
import com.liceolapaz.hbnpost.model.beans.LoginBean;

@Controller
public class LoginController {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private HttpSession httpSession;
	
	@GetMapping(value="/signin") 
	public String showForm(Model model){
		model.addAttribute("userLogin", new LoginBean());
		return "login";
	}
	
	@PostMapping(value="/login")
	public String submit(@ModelAttribute("userLogin") LoginBean loginBean, 
			BindingResult result, Model model) {
		User user = userDao.getByEmailAndPassword(loginBean.getEmail(), loginBean.getPassword());
		if (user != null) {
			httpSession.setAttribute("userLoggedIn", user);
			return "redirect:/";
		} else {
			model.addAttribute("error", "Incorrect user and/or password");
			return "login";
		}
	}
	
	@GetMapping(value="/logout")
	public String logout(Model model) {
		httpSession.removeAttribute("userLoggedIn");
		return "redirect:/";
	}
}
