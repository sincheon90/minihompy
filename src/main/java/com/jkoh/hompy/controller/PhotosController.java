package com.jkoh.hompy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jkoh.hompy.service.PhotosService;

@Controller
@RequestMapping("photos")
public class PhotosController {
	
	@Autowired
	private PhotosService photosService;
	
	@RequestMapping
	public String list(Model model) {
		model.addAttribute("photo", photosService.getAllPhotos());
		return "photos";
	}
}
