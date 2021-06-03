package com.jkoh.hompy.domain;

import org.springframework.web.multipart.MultipartFile;

public class PhotoFile {
	private String num;
	private String photos_files_id;
	private MultipartFile PhotoImage;

	@Override
	public String toString() {
		return "PhotoFile [num=" + num + ", photos_files_id=" + photos_files_id + "]";
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getPhotos_files_id() {
		return photos_files_id;
	}
	public void setPhotos_files_id(String photos_files_id) {
		this.photos_files_id = photos_files_id;
	}
	public MultipartFile getPhotoImage() {
		return PhotoImage;
	}
	public void setPhotoImage(MultipartFile photoImage) {
		PhotoImage = photoImage;
	}
	
	
}
