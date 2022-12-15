package com.community.dao;

import com.community.util.SqlMapper;
import com.community.vo.Suggestion;

public class SuggestionDao {
	
	public void insertSuggestion(Suggestion suggestion) {
		SqlMapper.insert("suggestions.insertSuggestion", suggestion);
	}
}
