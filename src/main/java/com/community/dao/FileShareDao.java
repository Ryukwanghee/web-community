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
	
	@SuppressWarnings("unchecked")
	public List<FileShareDto> getPostsByEmpNo(Map<String, Object> param){
		return (List<FileShareDto>) SqlMapper.selectList("fileshares.getPostsByEmpNo", param);
	}
	
	public int getTotalRows(Map<String, Object> param) {
		return (Integer) SqlMapper.selectOne("fileshares.getTotalRows", param);
	}
	
	public int getTotalRowsByEmpNo(Map<String, Object> param) {
		return (Integer) SqlMapper.selectOne("fileshares.getTotalRowsByEmpNo", param);
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
	public void insertFile(FileShare fileShare) {
		SqlMapper.insert("fileshares.insertFile", fileShare);
	}
	
	@SuppressWarnings("unchecked")
	public List<FileShare> getFilesByNo(int postNo) {
		return (List<FileShare>) SqlMapper.selectList("fileshares.getFilesByNo", postNo);
	}
	
	public void deleteFiles(int postNo) {
		SqlMapper.delete("fileshares.deleteFiles", postNo);
	}
}
