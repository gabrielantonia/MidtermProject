package com.skilldistillery.carma.controllers;

import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.carma.data.ParkingFailDAO;
import com.skilldistillery.carma.data.UserDAO;
import com.skilldistillery.carma.entities.ParkingFailDTO;
import com.skilldistillery.carma.entities.User;

@Controller
public class AccountController {

	@Autowired
	private UserDAO dao;
	@Autowired
	private ParkingFailDAO parkingdao;

	@RequestMapping(path = "register.do", method=RequestMethod.GET)
	public String registerUser(Model model, @RequestParam("validationfailed") Boolean validationresult) {
		if (validationresult) {
			model.addAttribute("validationresult", validationresult);
		}
		else {
			model.addAttribute("validationresult", false);
		}
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
	public String doLogin(@ModelAttribute("user") User user, Errors errors, HttpSession session, RedirectAttributes ra) {
		User u = dao.validateUser(user);
		if (errors.hasErrors()) {
			return "redirect:/";
		}
		if (u != null) {
			session.setAttribute("loggedInUser", u);
			return "redirect:/userpage.do";
		}
		else {
			ra.addAttribute("validationfailed", true);
			return "redirect:/register.do";
		}
	}
	
	@RequestMapping(path="logout.do")
	public String doLogout(Model model, HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "redirect:/";

	}
	@RequestMapping(path="userpage.do")
	public String goToUserPage(Model model, HttpSession session) {
		User u = (User) session.getAttribute("loggedInUser");
		model.addAttribute("listOfPF", parkingdao.findParkingFailByUserId(u.getId()));
		model.addAttribute("listOfPictures", parkingdao.findPicturesByUserId(u.getId()));
		model.addAttribute("parkingFailDTO", new ParkingFailDTO());
		return "sub/userpage";
	}
	
	
}
