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

import com.jkoh.hompy.domain.Photo;
import com.jkoh.hompy.domain.repository.PhotoRepository;

@Repository
public class PhotoRepositoryImpl implements PhotoRepository {
	
	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;
	
	private static final class PhotoMapper implements RowMapper<Photo> {
		
		public Photo mapRow(ResultSet rs, int rowNum) throws SQLException {
			Photo photo = new Photo();
			photo.setId(rs.getInt("id"));
			photo.setWriter(rs.getString("writer"));
			photo.setTitle(rs.getString("title"));
			photo.setContents(rs.getString("contents"));
			photo.setRegdate(rs.getDate("regdate"));
			photo.setScrap_count(rs.getInt("scrap_count"));
			//photo.setPhotoFile(new PhotoFileRepositoryImpl().getPhotoFileById(rs.getInt("id")));
			return photo;
		}
	}

	@Override
	public void addPhotos(Photo photo) throws DataAccessException{
		String SQL = "insert into cyworld.photos (title, contents)"
				+ " values (:title, :contents, :photos_files_id);";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("title", photo.getTitle());
		params.put("contents", photo.getContents());
		//photoFileRepository.addPhotoFile(photo.getId());
//		try {
			jdbcTemplate.update(SQL, params);
//		} catch (DataAccessException e) {
//
//		}

	}

	@Override
	public Photo getPhotoById(int id) { //writer?
		String SQL = "select * from cyworld.photos where id=:id";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		//params.put("photoFile", photoFileRepository.getPhotoFileById(id));		
		return jdbcTemplate.queryForObject(SQL, params, new PhotoMapper());
	}

	@Override
	public List<Photo> getAllPhotos() {
		String SQL = "select * from cyworld.photos";
		Map<String, Object> params = new HashMap<String, Object>();
		//params.put("photo_file", photoFileRepository.getAllPhotoFile());		
		List<Photo> result = jdbcTemplate.query(SQL, params, new PhotoMapper());
		return result;
	}

	@Override
	public List<Photo> getPhotosByFilter(Map<String, List<String>> filterParams) {
		/*
		 * String SQL = "SELECT * FROM cyworld.photos " +
		 * "WHERE writer IN (:writer) or title like %:title% or contents like %:contents%;"
		 * ; return jdbcTemplate.query(SQL, filterParams, new PhotoMapper());
		 */
		return null;
	}

	@Override
	public String getLatestPhotosId() {
		String SQL = "select * from cyworld.photos order by id desc limit 1";
		Map<String, Object> params = new HashMap<String, Object>();
		Photo photo = jdbcTemplate.queryForObject(SQL, params, new PhotoMapper());
		String result = Integer.toString(photo.getId());
		return result;
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
