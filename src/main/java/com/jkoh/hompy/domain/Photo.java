package com.jkoh.hompy.domain;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Photo {
	private int id;
	private String writer;
	private String title;
	private String contents;
	private Date regdate;
	private int scrap_count;
	private List<PhotoFile> photoFile;
	private double photos_comments_id;
	
	//
	private MultipartFile PhotoImage;
	
	public MultipartFile getPhotoImage() {
		return PhotoImage;
	}
	public void setPhotoImage(MultipartFile photoImage) {
		PhotoImage = photoImage;
	}
	//
	
	@Override
	public String toString() {
		return "Photo [id=" + id + ", photo_file=" + photoFile + "]";
	}
	public int getId() {
		return id;
	}	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getScrap_count() {
		return scrap_count;
	}
	public void setScrap_count(int scrap_count) {
		this.scrap_count = scrap_count;
	}
	public List<PhotoFile> getPhotoFile() {
		return photoFile;
	}
	public void setPhotoFile(List<PhotoFile> photoFile) {
		this.photoFile = photoFile;
	}
	public double getPhotos_comments_id() {
		return photos_comments_id;
	}
	public void setPhotos_comments_id(double photos_comments_id) {
		this.photos_comments_id = photos_comments_id;
	}
	
	
	
}
