package com.community.dao;

import java.util.List;

import com.community.util.SqlMapper;
import com.community.vo.Suggestion;

public class SuggestionDao {
	private static SuggestionDao instance = new SuggestionDao();
	private SuggestionDao () {}
	public static SuggestionDao getInstance() {
		return instance;
	}
	
	
	/**
	 *  게시물 번호로 추천누른 직원번호리스트 구하기.
	 * @param postNo
	 * @return List<Suggestion>
	 */
	@SuppressWarnings("unchecked")
	public List<Suggestion> getSuggestionByPostNo(int postNo) {
		return (List<Suggestion>)SqlMapper.selectList("suggestions.getSuggestionByPostNo", postNo);
	}
	
	public void insertSuggestion(Suggestion suggestion) {
		SqlMapper.insert("suggestions.insertSuggestion", suggestion);
	}
	
}
