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


public class PhotosController2 {

	private PhotosService photosService;
	

	public String list(@RequestParam(value = "id", required=false) String id, Model model, Photo photo) {
		return "photos";
	}

//	public String photosContent(HttpServletRequest request, @RequestParam(value = "id", required=false) String id, Model model, Photo photo) {
//		/*
//		 * page = 1 rownum = 1, 2, 3
//		 * page = 2 rownum = 4, 5, 6
//		 * page = 3 rownum = 7, 8, 9
//		 * 
//		 * page = n rownum = 3*n-2, 3*n-1, 3*n
//		 */
//		String _id =  request.getParameter("id");
//		if (_id == null) _id = photosService.getLatestPhotosId();
//		List<PhotoFile> photoFile = photosService.getPhotoFileById(Integer.parseInt(_id));
//		model.addAttribute("photo", photosService.getPhotoById(Integer.parseInt(_id)));
//		model.addAttribute("photoFile", photoFile);
//		
//		List<PhotoFile> photoFile2 = photosService.getPhotoFileById(Integer.parseInt(_id)-1);
//		model.addAttribute("photo2", photosService.getPhotoById(Integer.parseInt(_id)-1));
//		model.addAttribute("photoFile2", photoFile2);
//		
//		System.out.println(photo.toString());
//		System.out.println(photoFile.toString());
//		return "photosContent";
//	}

}