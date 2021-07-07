package com.jkoh.hompy.domain.repository;

import java.util.List;

import com.jkoh.hompy.domain.PhotoComment;

public interface PhotoCommentRepository {
	void addPhotoComment(PhotoComment newComment);
	List<PhotoComment> getCommentByPhotoId(int photoId);
	void updatePhotoComment(int num);
	void delPhotoComment(String num);
}
