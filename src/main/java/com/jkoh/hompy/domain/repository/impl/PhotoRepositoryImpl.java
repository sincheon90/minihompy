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
import com.jkoh.hompy.exception.PhotoNotFoundException;

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
			return photo;
		}
	}

	@Override
	public void addPhoto(Photo photo) throws DataAccessException{
		String SQL = "insert into cyworld.photos (writer, title, contents)"
				+ " values (:writer, :title, :contents);";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("writer", photo.getWriter());
		params.put("title", photo.getTitle());
		params.put("contents", photo.getContents());
		try {
			jdbcTemplate.update(SQL, params);
		} catch (DataAccessException e) {
			System.out.println(e);
		}

	}

	@Override
	public Photo getPhotoByRownum(int rownum) {
		String SQL = "select row_number() over (order by p.id desc) as rownum, p.* "
				+ "from cyworld.photos p limit "+ (rownum-1) +", 1";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("rownum", rownum);	
		try {
			return jdbcTemplate.queryForObject(SQL, params, new PhotoMapper());
		}catch (DataAccessException e) {
			throw new PhotoNotFoundException();
		}
		
	}

	@Override
	public List<Photo> getAllPhotos() {
		String SQL = "select * from cyworld.photos";
		Map<String, Object> params = new HashMap<String, Object>();
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
	public int getPhotosIdByRownum(int rownum){
		String SQL =  "select row_number() over (order by p.id desc) as rownum, p.* "
				+ "from cyworld.photos p limit "+ (rownum-1) +", 1";
		Map<String, Object> params = new HashMap<String, Object>();
		try {
			Photo result = jdbcTemplate.queryForObject(SQL, params, new PhotoMapper());
			return result.getId();
		} catch (Exception e) {
			throw new PhotoNotFoundException();
		}

	}
	
	@Override
	public int countPhotos() {
		String SQL =  "select count(*) from cyworld.photos";
		Map<String, Object> params = new HashMap<String, Object>();
		int result = jdbcTemplate.queryForObject(SQL, params, Integer.class);
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
