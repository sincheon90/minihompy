package com.jkoh.hompy.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.jkoh.hompy.utiil.PagingVO;

@Controller
@RequestMapping
public class PhotosController {

	@Autowired
	private PhotosService photosService;
	
	@RequestMapping("updCommentForm")
	public String updCommentForm(HttpServletRequest request, Model model) {
		String num = request.getParameter("num");
		model.addAttribute("num", num);
		return "updCommentForm";
	}
	
	@RequestMapping("updComment")
	public String processUpdCommentForm(HttpServletRequest request, Model model) {
		String num = request.getParameter("num");
		String comment = request.getParameter("comment");
		photosService.updPhotoComment(num, comment);
		return "processDone";
	}

	
	@RequestMapping("delComment")
	public String delCommentForm(HttpServletRequest request, Model model) {
		String num = request.getParameter("num");
		photosService.delPhotoComment(num);
		return "redirect:photos";
	}

	@RequestMapping("addComment")
	public String addCommentForm(HttpServletRequest request, Model model) {
		///////////////////// 댓글 입력 처리
		PhotoComment newComment = new PhotoComment();
		String comment = request.getParameter("comment");
		String writer = "방문자";
		String photos_comments_id = request.getParameter("id");
		newComment.setComment(comment);
		newComment.setWriter(writer);
		newComment.setPhotos_comments_id(photos_comments_id);
		try {
			photosService.addPhotoComment(newComment);		
		} catch (Exception e) {
			return "addCommentFail";
		}

		return "redirect:photos";
	}

	@RequestMapping("photos")
	public String photosContent(HttpServletRequest request, Model model,
			@RequestParam(value = "page", required = false) String page) throws SQLException {

		///////////// 페이징
		int total = photosService.countPhotos();
		String _page = request.getParameter("page");
		if (_page == null)
			_page = "1";
		int cntPerPage = 3;

		PagingVO pagingVo = new PagingVO(total, Integer.parseInt(_page), cntPerPage);

		model.addAttribute("paging", pagingVo);

		////////////// photos 내용 담기
		int firstPhotoRownum = Integer.parseInt(_page) * cntPerPage - 2;
		for (int i = 0; i < cntPerPage; i++) {
			try {
				///////// 사진 게시글 (photo1, photo2, photo3)
				model.addAttribute("photo" + (i + 1), photosService.getPhotoByRownum(firstPhotoRownum + i));

				///////// 사진 파일과 사진 댓글
				int photoId = photosService.getPhotosIdByRownum(firstPhotoRownum + i);
				List<PhotoFile> photoFile = photosService.getPhotoFileById(photoId);
				List<PhotoComment> photoComment = photosService.getCommentByPhotoId(photoId);
				model.addAttribute("photoFile" + (i + 1), photoFile);
				model.addAttribute("photoComment" + (i + 1), photoComment);
			} catch (Exception e) {
				return "photos";
			}
		}
		return "photos";
	}

	@RequestMapping(value = "/photos/add", method = RequestMethod.GET)
	public String getAddNewPhotosForm(Model model) {
		Photo newPhoto = new Photo();
		model.addAttribute("newPhoto", newPhoto);
		return "addPhotos";
	}

	@RequestMapping(value = "/photos/add", method = RequestMethod.POST)
	public String processAddNewPhotoForm(Model model, @ModelAttribute("newPhoto") Photo newPhoto, BindingResult result,
			HttpServletRequest request) {

		if (result.hasErrors()) {
			return "addPhotos";
		}

		try {
			String[] suppressedFields = result.getSuppressedFields();
			if (suppressedFields.length > 0) {
				throw new RuntimeException(
						"허용되지 않은 항목을 엮어오려고함: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
			} else {
				String rootDirectory = request.getSession().getServletContext().getRealPath("/");
				MultipartFile photoImage = newPhoto.getPhotoImage();
				if (photoImage != null && !photoImage.isEmpty()) {
					try {
						// 사진 파일 추가
						int nextId = photosService.getPhotosIdByRownum(1) + 1;
						newPhoto.setId(nextId);
						int nextPhotoFileNum = photosService.getPhotoFileNumByRownum(1) + 1;
						photosService.addPhotoFile(nextId, nextPhotoFileNum);

						photoImage.transferTo(
								new File(rootDirectory + "resources\\images\\" + nextPhotoFileNum + ".png"));
					} catch (Exception e) {
						throw new RuntimeException("Photo Image saving failed", e);
					}
				}
				photosService.addPhoto(newPhoto);
			}
			return "processDone";

		} catch (DataAccessException e) {
			model.addAttribute("errorMsg", e);
			return "addPhotos";
		}
	}
}
