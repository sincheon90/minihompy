package com.jkoh.hompy.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jkoh.hompy.domain.Photo;
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
	 
	
	@RequestMapping(value = "/photos/add", method = RequestMethod.GET)
	public String getAddNewPhotosForm(Model model) {
		Photo newPhoto = new Photo();
		model.addAttribute("newPhoto", newPhoto);
		return "addPhotos";
	}
	
	@RequestMapping(value = "/photos/add", method = RequestMethod.POST)
	public String processAddNewPhotoForm(Model model,
			@ModelAttribute("newPhoto") Photo newPhoto,
			BindingResult result, HttpServletRequest request) {
		
		if (result.hasErrors()) {
			return "addPhotos";
		}

		try {
			String[] suppressedFields = result.getSuppressedFields();
			if (suppressedFields.length > 0) {
				throw new RuntimeException(
						"허용되지 않은 항목을 엮어오려고함: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
			} else {
				/**
				 * 사진 파일 정한 폴더에 파일로 보관
				 */
				newPhoto.setId(photosService.getPhotosIdByRownum(1)+1); // newPhoto.getId()를 가지고 add photoFile
				
				String rootDirectory = request.getSession().getServletContext().getRealPath("/"); // 사진 파일 저장 위치 변경				
				MultipartFile photoImage = newPhoto.getPhotoImage();
				if (photoImage != null && !photoImage.isEmpty()) {
					try {
						// 포토파일 데이터 추가
						int photoFileNum = photosService.getPhotoFileNumByRownum(1)+1 ;
						photosService.addPhotoFile(newPhoto.getId(), photoFileNum);
						
						photoImage.transferTo(
								new File(rootDirectory + "resources\\images\\" + photoFileNum + ".png"));						
					} catch (Exception e) {
						throw new RuntimeException("Photo Image saving failed", e);
					}
				}
				photosService.addPhoto(newPhoto);
			}
			return "addPhotosDone";
			
		} catch (DataAccessException e) {
			String msg = e.getMessage();
			int idx = msg.lastIndexOf("Duplicate");
			model.addAttribute("errorMsg", msg.substring(idx));
			return "addPhotos";
		}
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
