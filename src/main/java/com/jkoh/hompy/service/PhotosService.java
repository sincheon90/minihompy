package com.jkoh.hompy.service;

import java.util.List;

import com.jkoh.hompy.domain.Photo;
import com.jkoh.hompy.domain.PhotoFile;

public interface PhotosService {
	void addPhotos(Photo photo);
	Photo getPhotoById(int id);
	List<Photo> getAllPhotos();
	void updatePhotos(Photo photo);
	void deletePhotos(Photo photo);
	int getPhotosIdByRownum(int rownum);
	
	List<PhotoFile> getPhotoFileById(int id);
	int countPhotos();
}
