package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.dto.FileShareDto;
import com.community.util.SqlMapper;
import com.community.vo.Employee;
import com.community.vo.FileShare;
import com.community.vo.Post;

public class FileShareDao {
	
	@SuppressWarnings("unchecked")
	public List<FileShareDto> getFileShares(Map<String, Object> param){
		return (List<FileShareDto>) SqlMapper.selectList("fileshares.getFileShares", param);
	}
	
	public int getTotalRows(Map<String, Object> param) {
		return (Integer) SqlMapper.selectOne("fileshares.getTotalRows", param);
	}
	
	public FileShareDto getPostByNo(int no) {
		return (FileShareDto) SqlMapper.selectOne("fileshares.getPostByNo", no);
	}
	
	public void updateCount(FileShareDto post) {
		SqlMapper.update("fileshares.updateCount", post);
	}
	
	public void updateFileShare(FileShareDto post) {
		SqlMapper.update("fileshares.updateFileShare", post);
	}
}
