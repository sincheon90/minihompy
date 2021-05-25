package com.jkoh.hompy.domain.repository;

import java.util.List;

import com.jkoh.hompy.domain.PhotoFile;

public interface PhotoFileRepository {
	void addPhotoFile(int id);
	List<PhotoFile> getPhotoFileById(int id);
	List<PhotoFile> getAllPhotoFile();
	void updatePhotos(double num);
	void deletePhotos(double num);
}
