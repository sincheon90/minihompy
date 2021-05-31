package com.jkoh.hompy.domain;

public class PhotoFile {
	private String num;
	private String photos_files_id;
	
	public PhotoFile() {}
	
	public PhotoFile(String num, String photos_files_id) {
		super();
		this.num = num;
		this.photos_files_id = photos_files_id;
	}
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
	
	
}
