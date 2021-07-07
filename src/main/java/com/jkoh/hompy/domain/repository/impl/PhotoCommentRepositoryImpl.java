package com.jkoh.hompy.domain.repository.impl;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.jkoh.hompy.domain.PhotoComment;

@Repository
public class PhotoCommentRepositoryImpl implements com.jkoh.hompy.domain.repository.PhotoCommentRepository {
	
	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	private static final class PhotoFileMapper implements RowMapper<PhotoComment> {
		public PhotoComment mapRow(ResultSet rs, int rowNum) throws SQLException {
			PhotoComment photoComment = new PhotoComment();
			photoComment.setNum(rs.getString("num"));
			photoComment.setComment(rs.getString("comment"));
			photoComment.setWriter(rs.getString("writer"));
			photoComment.setPhotos_comments_id(rs.getString("photos_comments_id"));
			return photoComment;
		}
	}

	@Override
	public void addPhotoComment(PhotoComment newComment) {
		String SQL = "insert into cyworld.photos_comments (comment, writer, photos_comments_id)"
				+ " values (:comment, :writer, :photos_comments_id);";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("comment", newComment.getComment());
		params.put("writer", newComment.getWriter());
		params.put("photos_comments_id", newComment.getPhotos_comments_id());
		try {
			jdbcTemplate.update(SQL, params);
		} catch (DataAccessException e) {
			System.out.println(e);
		}
	}

	@Override
	public List<PhotoComment> getCommentByPhotoId(int photos_comments_id) {
		String SQL = "select * from cyworld.photos_comments where photos_comments_id=:photos_comments_id";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("photos_comments_id", photos_comments_id);
		List<PhotoComment> result = jdbcTemplate.query(SQL, params, new PhotoFileMapper());
		return result;
	}

	@Override
	public void updatePhotoComment(int num) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delPhotoComment(String num) {
		String SQL = "DELETE FROM cyworld.photos_comments where num=:num";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("num", num);
		jdbcTemplate.update(SQL, params);
		
	}

}
