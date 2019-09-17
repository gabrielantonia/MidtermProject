package com.skilldistillery.carma.controllers;

import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.carma.data.ParkingFailDAOImpl;
import com.skilldistillery.carma.entities.Car;
import com.skilldistillery.carma.entities.Location;
import com.skilldistillery.carma.entities.ParkingFail;
import com.skilldistillery.carma.entities.ParkingFailDTO;
import com.skilldistillery.carma.entities.Picture;
import com.skilldistillery.carma.entities.User;

@Controller
public class ParkingFailController {

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
		mv.addObject("parkingFail", new ParkingFailDTO());
		mv.setViewName("sub/addParkingFail");
		return mv;
		// return "index"; // if using a ViewResolver.
	}

	@RequestMapping(path = "create.do", method = RequestMethod.POST)
	public ModelAndView addParkingFail(@ModelAttribute("parkingFail") ParkingFailDTO pfd) {
		ModelAndView mv = new ModelAndView("sub/show");
		Car c = new Car(pfd.getLicensePlate(), pfd.getMake(), pfd.getModel(), pfd.getColor(), pfd.getDescription(),
				pfd.getAlias());
		User u = new User("finaltest", "test2", "test3");
		Location l = new Location(pfd.getName(), pfd.getStreet(), pfd.getCity(), pfd.getState(), pfd.getZip());
		ParkingFail pf = new ParkingFail(pfd.getTitle(), c, u, l, "8:30", pfd.getDescription());
		dao.createParkingFail(pf);
		dao.addPicture(new Picture("google.com", pf));
		mv.addObject("parkingFail", pf);
		return mv;
		// return "index"; // if using a ViewResolver.
	}

	@RequestMapping(path = "getParkingFail.do")
	public String showParkingFail(@RequestParam("pfid") Integer pfid, Model model) {
		ParkingFail pf = dao.findParkingFailById(pfid);
		model.addAttribute("parkingFail", pf);
		return "sub/show.jsp";
		// return "show"; // if using a ViewResolver.
	}

	@RequestMapping(path = "createParkingFail.do", method = RequestMethod.POST)
	public String createPokemon(ParkingFail parkingFail, Model model) {
		model.addAttribute("parkingFail", dao.findAll());
		dao.createParkingFail(parkingFail);
		return "index";
	}

	@RequestMapping(path = "update.do")
	public ModelAndView update(ParkingFail parkingFail) {
		ModelAndView mv = new ModelAndView();
		parkingFail = dao.findParkingFailById(parkingFail.getId());
		mv.addObject("parkingFail", parkingFail);
		mv.setViewName("sub/update");
		return mv;
		// return "index"; // if using a ViewResolver.
	}

	@RequestMapping(path = "updateParkingFail.do", method = RequestMethod.POST)
	public String updateParkingFail(ParkingFail parkingFail, Model model) {
		dao.updateParkingFail(parkingFail);
		model.addAttribute("parkingFail", dao.findAll());
		return "index";
	}

	@RequestMapping(path = "deleteParkingFail.do", method = RequestMethod.POST)
	public ModelAndView deleteParkingFail(@ModelAttribute("parkingFail") ParkingFail parkingFail) {
		ModelAndView mv = new ModelAndView();
		boolean deleteParkingFail = dao.deleteParkingFail(parkingFail);
		if (deleteParkingFail) {
			mv.setViewName("sub/delete");
		} else {
			mv.setViewName("sub/errorDeletion");
		}
		return mv;
	}

//	@RequestMapping(path = "/", method = RequestMethod.GET)
//	public ModelAndView getParkingFailOfDay() {
//		ArrayList<ParkingFail> parkingFailList = dao.findParkingAllTime();
//		User user = dao.findUserOfDay();
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("parkingFailList", parkingFailList);
//		mv.addObject("user", user);
//		mv.setViewName("index");
//		return mv;
	// return "show"; // if using a ViewResolver.
////	}
//
//	@RequestMapping(path = "getWallOfShame.do", method = RequestMethod.GET)
//	public ModelAndView getWallOfShame() {
//		ArrayList<ParkingFail> parkingFailList = dao.findParkingAllTime();
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("parkingFailList", parkingFailList);
//		mv.setViewName("sub/wallofshame");
//		return mv;
//		// return "show"; // if using a ViewResolver.
//	}

////////////////////////////////////////////////////////////////////////////
////GALLERY
//	@RequestMapping(path = "gallery.do", method = RequestMethod.GET)
//	public ModelAndView findAllPictures() {
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("user", new User());
//		List<List<Picture>> gallery = new ArrayList<>();
//		List<ParkingFail> parkingFailList = dao.findParkingAllTime();
//		for (ParkingFail parkingFail : parkingFailList) {
//				gallery.add(parkingFail.getListOfPictures());
//		}
//		Map<Integer, String> pictureMap = dao.getImageIds(gallery);
//		mv.addObject(pictureMap);
//		mv.setViewName("sub/gallery");
//		return mv;
//	}
///////////////////////////////////////////////////////////////////////////

}
