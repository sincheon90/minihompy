package com.jkoh.hompy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jkoh.hompy.domain.Photo;
import com.jkoh.hompy.domain.PhotoFile;
import com.jkoh.hompy.service.PhotosService;

@Controller
@RequestMapping
public class PhotosController {
	
	@Autowired
	private PhotosService photosService;
	
	@RequestMapping("photos")
	public String list(@RequestParam(value = "id", required=false) String id, Model model, Photo photo) {
		return "photos";
	}
	
	@RequestMapping("photosContent")
	public String photosContent(HttpServletRequest request, @RequestParam(value = "id", defaultValue="1") String id, Model model, Photo photo) {
		String _id =  request.getParameter("id");
		if (_id == null) _id = "1";
		List<PhotoFile> photoFile = photosService.getPhotoFileById(Integer.parseInt(_id));
		model.addAttribute("photo", photosService.getPhotoById(Integer.parseInt(_id)));
		model.addAttribute("photoFile", photoFile);
		
		List<PhotoFile> photoFile2 = photosService.getPhotoFileById(Integer.parseInt(_id)+1);
		model.addAttribute("photo2", photosService.getPhotoById(Integer.parseInt(_id)+1));
		model.addAttribute("photoFile2", photoFile2);
		
		System.out.println(photo.toString());
		System.out.println(photoFile.toString());
		return "photosContent";
	}

}
