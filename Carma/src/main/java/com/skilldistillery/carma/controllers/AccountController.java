package com.skilldistillery.carma.controllers;

import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
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
	public String registerUser(Model model, @RequestParam(value="validationfailed", defaultValue="false") boolean loginstatus, @RequestParam(value="duplicateUser", defaultValue="false") boolean registerStatus) {
		model.addAttribute("validationfailed", loginstatus);
		model.addAttribute("user", new User());
		model.addAttribute("registerStatus", registerStatus);
		return "sub/register";
	}
	
	@RequestMapping(path= "register.do", method=RequestMethod.POST)
    public String createUser(@ModelAttribute("user") User user, Model model, HttpSession session, RedirectAttributes ra) {
		if (dao.checkUniqueUsername(user.getUsername())) {
			ra.addAttribute("duplicateUser", true);
			return "redirect:/register.do";
		}
        user.setDateCreated(LocalDate.now().toString());
        dao.addUser(user);
        model.addAttribute("parkingFailDTO", new ParkingFailDTO());
        session.setAttribute("loggedInUser", user);
        model.addAttribute("userUpdatedString", dao.getUpdatedImage(user));
        return "sub/userpage";
    }
	
	@RequestMapping(path="login.do", method=RequestMethod.POST)
	public String doLogin(@ModelAttribute("user") User user, Errors errors, HttpSession session, RedirectAttributes ra, @RequestParam(value="fromPFPage", defaultValue="false") boolean fromPF, @RequestParam(value="pfId", defaultValue="0") String pfId) {
		User u = dao.validateUser(user);
		if (errors.hasErrors()) {
			return "redirect:/";
		}
		System.out.println(fromPF);
		if (fromPF) {
			session.setAttribute("loggedInUser", u);
			return "redirect:/findParkingFail.do?val=" + pfId; 
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
		model.addAttribute("userUpdatedString", dao.getUpdatedImage(u));
		model.addAttribute("comments", dao.getAllComments(u.getId()));
		return "sub/userpage";
	}
	
	@RequestMapping(path="updateUserPhoto.do")
	public String updateUserImage(Model model, HttpSession session, @RequestParam("image")String imageURL) {
		User u = (User) session.getAttribute("loggedInUser");
		dao.updateImage(u, imageURL);
		System.out.println(imageURL);
		return "redirect:/userpage.do";
		
	}
	
	@RequestMapping(path="deleteComment.do")
	public String deleteComment(@RequestParam("commentId") int commentId) {
		dao.deleteComment(commentId);
		return "redirect:/userpage.do";
	}
	
}
