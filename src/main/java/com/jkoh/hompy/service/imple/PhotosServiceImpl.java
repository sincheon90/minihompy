package com.jkoh.hompy.service.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jkoh.hompy.domain.Photo;
import com.jkoh.hompy.domain.PhotoComment;
import com.jkoh.hompy.domain.PhotoFile;
import com.jkoh.hompy.domain.repository.PhotoCommentRepository;
import com.jkoh.hompy.domain.repository.PhotoFileRepository;
import com.jkoh.hompy.domain.repository.PhotoRepository;
import com.jkoh.hompy.service.PhotosService;

@Service
public class PhotosServiceImpl implements PhotosService {

	@Autowired
	private PhotoRepository photoRepository; 
	
	@Autowired
	private PhotoFileRepository photoFileRepository;

	@Autowired
	private PhotoCommentRepository photoCommentRepository;
	
	@Override
	public List<PhotoFile> getPhotoFileById(int id) {
		return photoFileRepository.getPhotoFileById(id);
	}

	@Override
	public void addPhoto(Photo photo) {
		photoRepository.addPhoto(photo);

	}

	@Override
	public Photo getPhotoById(int id) {
		return photoRepository.getPhotoById(id);
	}

	@Override
	public List<Photo> getAllPhotos() {
		return photoRepository.getAllPhotos();
	}

	@Override
	public int getPhotosIdByRownum(int rownum) {
		return photoRepository.getPhotosIdByRownum(rownum);
	}

	@Override
	public int countPhotos() {
		return photoRepository.countPhotos();
	}

	@Override
	public void updatePhotos(Photo photo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deletePhotos(Photo photo) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<PhotoComment> getCommentByPhotoId(int photoId) {
		return photoCommentRepository.getCommentByPhotoId(photoId);
	}

	@Override
	public void addPhotoFile(int id, int photoFileNum) {
		photoFileRepository.addPhotoFile(id, photoFileNum);
		
	}

	@Override
	public int getPhotoFileNumByRownum(int rownum) {
		return photoFileRepository.getPhotoFileNumByRownum(rownum);
	}

}
