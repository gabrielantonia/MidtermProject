package com.skilldistillery.carma.controllers;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.carma.data.ParkingFailDAO;
import com.skilldistillery.carma.data.UserDAO;
import com.skilldistillery.carma.entities.ParkingFail;
import com.skilldistillery.carma.entities.Picture;
import com.skilldistillery.carma.entities.User;

@Controller
public class AccountController {

	@Autowired
	private UserDAO dao;
	@Autowired
	private ParkingFailDAO parkingdao;

	@RequestMapping(path = "register.do", method=RequestMethod.GET)
	public String registerUser(Model model) {
		model.addAttribute("user", new User());
		return "sub/register";
	}

	@RequestMapping(path="register.do", method=RequestMethod.POST)
	public String createUser(@ModelAttribute("user") User user, Model model) {
		user.setDateCreated(LocalDate.now().toString());
		dao.addUser(user);
		model.addAttribute("user", user);
		return "sub/userpage";
	}
	
	@RequestMapping(path="login.do", method=RequestMethod.POST)
	public String doLogin(@ModelAttribute("user") User user, Model model, Errors errors, HttpSession session) {
		System.out.println("TESTTESTTEST");
		User u = dao.validateUser(user);
		if (errors.hasErrors()) {
			return "index";
		}
		if (u != null) {
			session.setAttribute("loggedInUser", u);
			model.addAttribute("listOfPF", parkingdao.findParkingFailByUserId(u.getId()));
			model.addAttribute("listOfPictures", parkingdao.findPicturesByUserId(u.getId()));

			return "sub/userpage";
		}
		else {
			return "index";
		}
	}
	
	@RequestMapping(path="logout.do")
	public String doLogout(Model model, HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "redirect:/";
	}
	
	
}
