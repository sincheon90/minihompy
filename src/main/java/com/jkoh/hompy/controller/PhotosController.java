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

import com.jkoh.hompy.domain.PhotoComment;
import com.jkoh.hompy.domain.PhotoFile;
import com.jkoh.hompy.exception.PhotoNotFoundException;
import com.jkoh.hompy.service.PhotosService;
import com.jkoh.hompy.utiils.PagingVO;

@Controller
@RequestMapping
public class PhotosController {
	
	@Autowired
	private PhotosService photosService;
	
	@RequestMapping("photos")
	public String photosContent(HttpServletRequest request, Model model,
			@RequestParam(value = "page", required=false) String page) throws SQLException {

		/////////////페이징
		String _page =  request.getParameter("page");
		if (_page == null) _page = "1";
		int rownum = Integer.parseInt(_page)*3-2;
		int total = photosService.countPhotos();
		int cntPerPage = 3;
		PagingVO vo = new PagingVO(total, Integer.parseInt(_page), cntPerPage);
		model.addAttribute("paging", vo);
		
		//////////////photos 내용 담기
		for(int i=0; i<cntPerPage; i++) {
			try {
				///////// 사진 게시물 내용
				model.addAttribute("photo"+(i+1), photosService.getPhotoById(rownum+i));
				
				int photoId = photosService.getPhotosIdByRownum(rownum+i);
				List<PhotoFile> photoFile = photosService.getPhotoFileById(photoId);				
				List<PhotoComment> photoComment = photosService.getCommentByPhotoId(photoId);
				model.addAttribute("photoFile"+(i+1), photoFile);				
				model.addAttribute("photoComment"+(i+1), photoComment);
			} catch (Exception e) {
				return "photos";
			}
		}
		return "photos";
	}
	
//	 댓글입력 컨트롤러 
//	@RequestMapping(value = "/photos/addNewComment", method = RequestMethod.POST)
//	public String addNewCommnet(Model model, @RequestParam(value="newComment", required=false) Comment newComment) {
//		댓글 입력 버튼 -> 하얀 댓글 입력창 
//	-> 댓글입력 컨트롤러-처리 후 -> photos 창 원위치. 리다이렉트로 가능?
//	}
	 

	
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
