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

import com.jkoh.hompy.domain.Photo;
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
		
		//photo 1 : 없으면 페이지 자체가 안뜨게 3개 전체를 리스트로 담아서 보내기 hashmap? -> view에서 foreach로 부르면 없는 데이터는 안부름
		Photo photo = photosService.getPhotoById(rownum);
		model.addAttribute("photo", photo);
		//else return 전 페이지;
		List<PhotoFile> photoFile = photosService.getPhotoFileById(photosService.getPhotosIdByRownum(rownum));
		model.addAttribute("photoFile", photoFile);

		//photo 2 : 없으면 안뜨게 파일이 없으면 -1을 반환 0보다 작으면 띄우지 않기 
		try {
			Photo photo2 = photosService.getPhotoById(rownum+1);
			model.addAttribute("photo2", photo2);
			List<PhotoFile> photoFile2 = photosService.getPhotoFileById(photosService.getPhotosIdByRownum(rownum+1));
			model.addAttribute("photoFile2", photoFile2);
		} catch (Exception e) {
			return "photos";
		}
		
		//photo 3
		try {
			model.addAttribute("photo3", photosService.getPhotoById(rownum+2));
			List<PhotoFile> photoFile3 = photosService.getPhotoFileById(photosService.getPhotosIdByRownum(rownum+2));
			model.addAttribute("photoFile3", photoFile3);
		} catch (Exception e) {
			return "photos";
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
