package com.jkoh.hompy.domain.repository;

import java.util.List;

import com.jkoh.hompy.domain.PhotoComment;

public interface PhotoCommentRepository {
	void addPhotoComment(PhotoComment newComment);
	List<PhotoComment> getCommentByPhotoId(int photoId);
	void delPhotoComment(String num);
	void updPhotoComment(String num, String comment);
}
