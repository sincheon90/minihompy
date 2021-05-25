package com.jkoh.hompy.service.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jkoh.hompy.domain.Photo;
import com.jkoh.hompy.domain.PhotoFile;
import com.jkoh.hompy.domain.repository.PhotoFileRepository;
import com.jkoh.hompy.domain.repository.PhotoRepository;
import com.jkoh.hompy.service.PhotosService;

@Service
public class PhotosServiceImpl implements PhotosService {

	@Autowired
	private PhotoRepository photoRepository; 
	
	@Autowired
	private PhotoFileRepository photoFileRepository; 
	
	@Override
	public List<PhotoFile> getPhotoFileById(int id) {
		return photoFileRepository.getPhotoFileById(id);
	}

	@Override
	public void addPhotos(Photo photo) {
		photoRepository.addPhotos(photo);

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
	public String getLatestPhotosId() {
		// TODO Auto-generated method stub
		return photoRepository.getLatestPhotosId();
	}

	@Override
	public void updatePhotos(Photo photo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deletePhotos(Photo photo) {
		// TODO Auto-generated method stub

	}

}
