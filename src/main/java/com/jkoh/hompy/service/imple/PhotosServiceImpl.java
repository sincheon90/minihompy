package com.jkoh.hompy.service.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jkoh.hompy.domain.Photo;
import com.jkoh.hompy.domain.repository.PhotoRepository;
import com.jkoh.hompy.service.PhotosService;

@Service
public class PhotosServiceImpl implements PhotosService {

	@Autowired
	private PhotoRepository photoRepository; 
	
	@Override
	public void addPhotos(Photo photo) {
		photoRepository.addPhotos(photo);

	}

	@Override
	public Photo getPhotoById(String id) {
		return photoRepository.getPhotoById(id);
	}

	@Override
	public List<Photo> getAllPhotos() {
		return photoRepository.getAllPhotos();
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
