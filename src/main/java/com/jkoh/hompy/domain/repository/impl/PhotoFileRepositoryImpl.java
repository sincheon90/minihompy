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

import com.jkoh.hompy.domain.PhotoFile;
import com.jkoh.hompy.domain.repository.PhotoFileRepository;
import com.jkoh.hompy.exception.PhotoNotFoundException;

@Repository
public class PhotoFileRepositoryImpl implements PhotoFileRepository {
	

	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	private static final class PhotoFileMapper implements RowMapper<PhotoFile> {
		public PhotoFile mapRow(ResultSet rs, int rowNum) throws SQLException {
			PhotoFile photoFile = new PhotoFile();
			photoFile.setNum(rs.getString("num"));
			photoFile.setPhotos_files_id(rs.getString("photos_files_id"));
			return photoFile;
		}
	}

	@Override
	public void addPhotoFile(int id, int photoFileNum) {
		String SQL = "insert into cyworld.photos_files (num, photos_files_id)"
				+ " values (:num, :photos_files_id);";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("num", photoFileNum);
		params.put("photos_files_id", id);
		try {
			jdbcTemplate.update(SQL, params);
		} catch (DataAccessException e) {

		}
	}

	@Override
	public List<PhotoFile> getPhotoFileById(int photos_files_id) {
		String SQL = "select * from cyworld.photos_files where photos_files_id=:photos_files_id";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("photos_files_id", photos_files_id);
		List<PhotoFile> result = jdbcTemplate.query(SQL, params, new PhotoFileMapper());
		return result;
	}
	
	@Override
	public List<PhotoFile> getAllPhotoFile() {
		String SQL = "select * from cyworld.photos_files";
		Map<String, Object> params = new HashMap<String, Object>();	
		List<PhotoFile> result = jdbcTemplate.query(SQL, params, new PhotoFileMapper());
		return result;
	}

	@Override
	public void updatePhotos(double num) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deletePhotos(double num) {
		// TODO Auto-generated method stub

	}

	@Override
	public int getPhotoFileNumByRownum(int rownum) {
		String SQL = "select row_number() over (order by p.num desc) as rownum, p.* "
				+ "from cyworld.photos_files p limit "+ (rownum-1) +", 1";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("rownum", rownum);	
		try {
			PhotoFile photoFile = jdbcTemplate.queryForObject(SQL, params, new PhotoFileMapper());
			return Integer.parseInt(photoFile.getNum());
		}catch (DataAccessException e) {
			throw new PhotoNotFoundException();
		}
	}

}
