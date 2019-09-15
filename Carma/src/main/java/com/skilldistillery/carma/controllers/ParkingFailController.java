package com.skilldistillery.carma.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.carma.data.ParkingFailDAOImpl;
import com.skilldistillery.carma.entities.ParkingFail;

@Controller
public class ParkingFailController {

	@Autowired
	private ParkingFailDAOImpl dao;

	@RequestMapping(path = "/")
	public String index(Model model) {
		List<ParkingFail> parkingFail= dao.findAll();
		model.addAttribute("parkingFail", parkingFail);
		return "index.jsp";
		// return "index"; // if using a ViewResolver.
	}
	@RequestMapping(path = "create.do")
	public ModelAndView create() {
		ModelAndView mv = new ModelAndView();
		ParkingFail parkingFail = new ParkingFail();
		mv.addObject("parkingFail", parkingFail);
		mv.setViewName("sub/create.jsp");
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
	public String createPokemon( ParkingFail parkingFail, Model model) {
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
	public String updateParkingFail( ParkingFail parkingFail, Model model) {
		dao.updateParkingFail(parkingFail , parkingFail.getId());
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
	
	

	
}
