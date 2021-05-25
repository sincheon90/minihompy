package com.jkoh.hompy.domain.repository;

import java.util.List;
import java.util.Map;

import com.jkoh.hompy.domain.Photo;

public interface PhotoRepository {
	void addPhotos(Photo photo);
	Photo getPhotoById(int id);
	List<Photo> getAllPhotos();
	List<Photo> getPhotosByFilter(Map<String, List<String>> filterParams);
	void updatePhotos(Photo photo);
	void deletePhotos(Photo photo);
	
}
