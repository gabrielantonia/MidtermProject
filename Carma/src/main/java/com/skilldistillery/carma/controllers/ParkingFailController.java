package com.skilldistillery.carma.controllers;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.carma.data.ParkingFailDAOImpl;
import com.skilldistillery.carma.entities.Car;
import com.skilldistillery.carma.entities.Carma;
import com.skilldistillery.carma.entities.Comment;
import com.skilldistillery.carma.entities.Location;
import com.skilldistillery.carma.entities.ParkingFail;
import com.skilldistillery.carma.entities.ParkingFailDTO;
import com.skilldistillery.carma.entities.Picture;
import com.skilldistillery.carma.entities.User;

@Controller
public class ParkingFailController {

	private static final String DATE_FORMATTER = "yyyy-MM-dd HH:mm";

	@Autowired
	private ParkingFailDAOImpl dao;

	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String index(Model model) {
		ArrayList<ParkingFail> parkingFailTopThree = dao.findTopParkingFailByAmount(3);
		model.addAttribute("user", new User());
		model.addAttribute("parkingFailTopThree", parkingFailTopThree);
		ArrayList<String> urls = new ArrayList<String>();
		for (ParkingFail parkingFail : parkingFailTopThree) {
			urls.add(parkingFail.getListOfPictures().get(0).getUrl());
		}
		model.addAttribute("urls", urls);
		return "index";
	}

	@RequestMapping(path = "create.do", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("parkingFailDTO", new ParkingFailDTO());
		mv.setViewName("sub/addParkingFail");
		return mv;
	}

	@RequestMapping(path = "create.do", method = RequestMethod.POST)
	public String addParkingFail(HttpSession session, @ModelAttribute("parkingFail") ParkingFailDTO pfd) {
		ModelAndView mv = new ModelAndView("sub/userpage");
		List<ParkingFail> c = dao.findCarByLicensePlate(pfd.getLicensePlate());
		if (c.size() == 0) {
			Location l = new Location(pfd.getName(), pfd.getStreet(), pfd.getCity(), pfd.getState(), pfd.getZip());
			User u = (User) session.getAttribute("loggedInUser");
			Car newCar = new Car(pfd.getLicensePlate(), pfd.getMake(), pfd.getModel(), pfd.getColor(),
					pfd.getDescription(), pfd.getAlias());
			ParkingFail pf = new ParkingFail(pfd.getTitle(), newCar, u, l, LocalTime.now().toString(), pfd.getDescription());
			dao.createParkingFail(pf);
			dao.addPicture(new Picture(pfd.getUrl(), pf));
			return "redirect:/userpage.do";
		} else {
			User u = (User) session.getAttribute("loggedInUser");
			Location l = new Location(pfd.getName(), pfd.getStreet(), pfd.getCity(), pfd.getState(), pfd.getZip());
			ParkingFail pf = new ParkingFail(pfd.getTitle(), c.get(0).getCar(), u, l, LocalTime.now().toString(),
					pfd.getDescription());
			dao.createParkingFail(pf);
			dao.addPicture(new Picture(pfd.getUrl(), pf));
			return "redirect:/userpage.do";
		}
	}

	@RequestMapping(path = "getParkingFail.do")
	public String showParkingFail(@RequestParam("pfid") Integer pfid, Model model) {
		ParkingFail pf = dao.findParkingFailById(pfid);
		model.addAttribute("parkingFail", pf);
		return "sub/show.jsp";
		// return "show"; // if using a ViewResolver.
	}

	@RequestMapping(path = "updateParkingFail.do", method = RequestMethod.POST)
	public String updateParkingFail(HttpSession session, @RequestParam("val") int pfID,
			@ModelAttribute("parkingFailDTO") ParkingFailDTO pfd, Model model) {
		System.out.println(pfID);
		dao.updateParkingFail(pfd, pfID, pfd.getUrl());
		return "redirect:/userpage.do";
	}

	@RequestMapping(path = "deleteParkingFail.do", method = RequestMethod.GET)
	public ModelAndView deleteParkingFail(@RequestParam("val") int id) {
		ModelAndView mv = new ModelAndView();
		boolean deleteParkingFail = dao.deleteParkingFail(dao.findParkingFailById(id));
		if (deleteParkingFail) {
			mv.setViewName("redirect:/userpage.do");
		} else {
			mv.setViewName("sub/errorDeletion");
		}
		return mv;
	}

	@RequestMapping(path = "wallOfShame.do", method = RequestMethod.GET)
	public ModelAndView getWallOfShame(User user) {
		ArrayList<ParkingFail> parkingFailList = dao.findTopParkingFailByAmount(10);
		ModelAndView mv = new ModelAndView();
		ArrayList<String> urls = new ArrayList<String>();
		for (ParkingFail parkingFail : parkingFailList) {
			urls.add(parkingFail.getListOfPictures().get(0).getUrl());
		}
		mv.addObject("urls", urls);
		mv.addObject("parkingFailList", parkingFailList);
		mv.setViewName("sub/wallOfShame");
		return mv;
	}

////////////////////////////////////////////////////////////////////////////
////GALLERY
	@RequestMapping(path = "gallery.do", method = RequestMethod.GET)
	public ModelAndView findAllPictures() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", new User());
		mv.addObject("pictures", dao.findAllPictures());
		mv.setViewName("sub/gallery");
		return mv;
	}

///////////////////////////////////////////////////////////////////////////
//SEARCH BY LICENSE PLATE
	@RequestMapping(path = "findCarByLicensePlate.do", method = RequestMethod.POST)
	public ModelAndView findCarByLicensePlate(@RequestParam("licensePlate") String licensePlate) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("car", dao.findCarByLicensePlate(licensePlate));
		mv.setViewName("sub/show");
		return mv;
	}

	@RequestMapping(path = "findParkingFailByKeyword.do", method = RequestMethod.POST)
	public ModelAndView findParkingFailByKeyword(@RequestParam("keyword") String keyword, User user) {
		ModelAndView mv = new ModelAndView();
		List<ParkingFail> pfList = dao.findParkingFailByKeyword(keyword);
		mv.addObject("parkingFails", pfList);
		mv.addObject("keyword", keyword);
		mv.setViewName("sub/show");
		return mv;
	}

///////////////////////////////////////////////////////////////////////////
	@RequestMapping(path = "findParkingFail.do", method = RequestMethod.GET)
	public ModelAndView findParkingFailByKeyword(HttpSession session, @RequestParam("val") int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("pf", dao.findParkingFailById(id));
		mv.addObject("carma", dao.findCarmaById(id));
		// hack to get single picture
		// List<Picture> tempList = dao.findPicturesByUserId(id);
		// String tempPic = tempList.get(id).getUrl();
		// mv.addObject("picture", tempPic);
		mv.addObject("user", new User());
		mv.setViewName("sub/showparkingfail");
		return mv;
	}

//////////////////////////////////////////////////////add comments /////////////////////////////
	@RequestMapping(path = "addComment.do", method = RequestMethod.GET)
	public ModelAndView addComment(HttpSession session, @RequestParam("comment") String text,
			@RequestParam("carmaId") int carmaId) {
		User currentUser = (User) session.getAttribute("loggedInUser");

		Comment comment = new Comment();
		LocalDateTime localDateTime = LocalDateTime.now(); // get current date time

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern(DATE_FORMATTER);
		String formatDateTime = localDateTime.format(formatter);

		comment.setDateCreated(formatDateTime);
//		comment.setId(carmaId);
		comment.setText(text);
		comment.setParkingFail(dao.findParkingFailById(carmaId));
		comment.setUser(currentUser);
		dao.addComment(comment);

		ModelAndView mv = new ModelAndView();
		mv.addObject("pf", dao.findParkingFailById(carmaId));
		mv.addObject("carma", dao.findCarmaById(carmaId));
		mv.addObject("user", new User());
		mv.setViewName("sub/showparkingfail");
		return mv;
	}

//////////////////////////////////////////////////////add ranks /////////////////////////////////////
	@RequestMapping(path = "addRankVote.do", method = RequestMethod.GET)
	public ModelAndView addRankVote(HttpSession session, @RequestParam("pfId") int pfId) {
		dao.addRankVote(pfId);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pf", dao.findParkingFailById(pfId));
		mv.addObject("carma", dao.findCarmaById(pfId));
		mv.addObject("user", new User());
		mv.setViewName("sub/showparkingfail");
		return mv;

	}
	@RequestMapping(path = "addPicture.do", method = RequestMethod.POST)
	public String addPicture(HttpSession session, Model model, @RequestParam("imageURL")String imageURL, @RequestParam("pfID") int pfID) {
		Picture picture = new Picture(imageURL, dao.findParkingFailById(pfID));
		dao.addPicture(picture);
		return "redirect:/userpage.do";
	}
}
