package com.jkoh.hompy.controller;

import java.sql.SQLException;
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
	public String photosContent(HttpServletRequest request, @RequestParam(value = "page", required=false) String page, Model model, Photo photo) throws SQLException {

		String _page =  request.getParameter("page");
		if (_page == null) _page = "1";
		int rownum = Integer.parseInt(_page)*3-2;
		
		//photo 1
		model.addAttribute("photo", photosService.getPhotoById(rownum));
		List<PhotoFile> photoFile = photosService.getPhotoFileById(photosService.getPhotosIdByRownum(rownum));
		model.addAttribute("photoFile", photoFile);

		//photo 2
		model.addAttribute("photo2", photosService.getPhotoById(rownum+1));
		List<PhotoFile> photoFile2 = photosService.getPhotoFileById(photosService.getPhotosIdByRownum(rownum+1));
		model.addAttribute("photoFile2", photoFile2);
		
		//photo 3
		model.addAttribute("photo3", photosService.getPhotoById(rownum+2));
		List<PhotoFile> photoFile3 = photosService.getPhotoFileById(photosService.getPhotosIdByRownum(rownum+2));
		model.addAttribute("photoFile3", photoFile3);
		
		return "photos";
	}

}
