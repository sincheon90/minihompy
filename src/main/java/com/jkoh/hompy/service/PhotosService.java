package com.jkoh.hompy.service;

import java.util.List;

import com.jkoh.hompy.domain.Photo;
import com.jkoh.hompy.domain.PhotoComment;
import com.jkoh.hompy.domain.PhotoFile;

public interface PhotosService {
	void addPhoto(Photo photo);
	Photo getPhotoByRownum(int Rownum);
	List<Photo> getAllPhotos();
	void updatePhotos(Photo photo);
	void deletePhotos(Photo photo);
	int getPhotosIdByRownum(int rownum);
	
	List<PhotoFile> getPhotoFileById(int id);
	void addPhotoFile(int id, int photoFileNum);	
	int getPhotoFileNumByRownum(int rownum);
	
	List<PhotoComment> getCommentByPhotoId(int photoId);
	void addPhotoComment(PhotoComment newComment);
	void delPhotoComment(String num);
	void updPhotoComment(String num, String comment);
	
	int countPhotos();
}
