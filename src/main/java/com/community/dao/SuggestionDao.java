package com.community.dao;

import java.util.List;

import com.community.util.SqlMapper;
import com.community.vo.Suggestion;

public class SuggestionDao {
	public void addSuggestion(Suggestion suggestion) {
		SqlMapper.insert("suggestions.addSuggestion", suggestion);
	}
	
	@SuppressWarnings("unchecked")
	public List<Suggestion> getSuggestionsByEmpNo(int empNo) {
		return (List<Suggestion>) SqlMapper.selectList("suggestions.getSuggestionsByEmpNo", empNo);
	}
}
