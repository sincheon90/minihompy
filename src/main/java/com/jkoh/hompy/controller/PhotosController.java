package com.jkoh.hompy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jkoh.hompy.domain.Photo;
import com.jkoh.hompy.domain.PhotoFile;
import com.jkoh.hompy.service.PhotosService;

@Controller
@RequestMapping("photos")
public class PhotosController {
	
	@Autowired
	private PhotosService photosService;
	
	@RequestMapping
	public String list(@RequestParam(value = "id", defaultValue = "1") String id, Model model, Photo photo) {
		model.addAttribute("photo", photosService.getPhotoById(photo.getId()));
		List<PhotoFile> photoFile = photosService.getPhotoFileById(photo.getId());
		model.addAttribute("photoFile", photoFile);
		System.out.println(photoFile.toString());
		return "photos";
	}
}
