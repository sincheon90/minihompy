package com.jkoh.hompy.service;

import java.util.List;

import com.jkoh.hompy.domain.Photo;

public interface PhotosService {
	void addPhotos(Photo photo);
	Photo getPhotoById(String id);
	List<Photo> getAllPhotos();
	void updatePhotos(Photo photo);
	void deletePhotos(Photo photo);
}
