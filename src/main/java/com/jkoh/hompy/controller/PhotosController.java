package com.jkoh.hompy.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jkoh.hompy.domain.PhotoFile;
import com.jkoh.hompy.exception.PhotoNotFoundException;
import com.jkoh.hompy.service.PhotosService;

@Controller
@RequestMapping
public class PhotosController {
	
	@Autowired
	private PhotosService photosService;
	
	@RequestMapping("photos")
	public String photosContent(HttpServletRequest request, @RequestParam(value = "page", required=false) String page, Model model) throws SQLException {

		String _page =  request.getParameter("page");
		if (_page == null) _page = "1";
		int rownum = Integer.parseInt(_page)*3-2;
		
		for(int i=0; i<=2; i++) {
			try {
				model.addAttribute("photo"+(i+1), photosService.getPhotoById(rownum+i));
				List<PhotoFile> photoFile = photosService.getPhotoFileById(photosService.getPhotosIdByRownum(rownum+i));
				if (photoFile == null || photoFile.isEmpty()) {
					for(int j=0; j<=5; j++) {
						photoFile.add(j, new PhotoFile("0","0"));
					}
					System.out.println(photoFile);
				}
				model.addAttribute("photoFile"+(i+1), photoFile);
				
			} catch (Exception e) {
				return "photos";
				
			}
		}
		return "photos";
	}
	
	@ExceptionHandler(PhotoNotFoundException.class)
	public ModelAndView handleError(HttpServletRequest req, PhotoNotFoundException exception, Model model) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception", exception);
		mav.addObject("url",
		req.getRequestURL()+"?"+req.getQueryString());
		mav.setViewName("photos");
		return mav;
	}


}
