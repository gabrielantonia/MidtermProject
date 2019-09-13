package com.skilldistillery.carma.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.carma.data.PictureDAOImpl;
import com.skilldistillery.carma.entities.ParkingFail;
import com.skilldistillery.jpavideostore.entities.Film;

@Controller
public class FilmController {

	@Autowired
	private PictureDAOImpl dao;

	@RequestMapping(path = "/")
	public String index(Model model) {
		List<ParkingFail> parkingFails= dao.findAll();
		model.addAttribute("parkingFails", parkingFails);
		return "index";
		// return "index"; // if using a ViewResolver.
	}
	
	@RequestMapping(path = "getParkingFails.do")
	public String showFilm(@RequestParam("fid") Integer fid, Model model) {
		ParkingFail pf = dao.findByID(fid);
		model.addAttribute("parkingFail", pf);
		return "results";
		// return "show"; // if using a ViewResolver.
	}

	
}
