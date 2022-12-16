package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.dto.QuestionDetailDto;
import com.community.util.SqlMapper;
import com.community.vo.Question;

public class QuestionDao {

	public void insertQuestion(Question question) {
		SqlMapper.insert("questions.insertQuestion", question);
	}
	
	public void insertAnswer(Question question) {
		SqlMapper.insert("questions.insertAnswer", question);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Question> getQuestions(Map<String, Object> param){
		return (List<Question>) SqlMapper.selectList("questions.getQuestions", param);
	}
	
	// Map객체 추가    
	public int getTotalRows(Map<String, Object> param) {
		return (Integer) SqlMapper.selectOne("questions.getTotalRows", param);
	}
	
	public QuestionDetailDto getQuestionDetailDtoByNo(int questionNo) {
	 	return (QuestionDetailDto) SqlMapper.selectOne("questions.getQuestionDetailDtoByNo", questionNo);
	}
	
	public Question getQuestionByNo(int questionNo) {
		return (Question) SqlMapper.selectOne("questions.getQuestionByNo", questionNo);
	}
	
	public void updateQuestion(Question question) {
		SqlMapper.update("questions.updateQuestion", question);
	}
	
	public void increaseReadCount(int questionNo) {
		SqlMapper.update("questions.increaseReadCount", questionNo);
	}
	
	public void increaseSuggestionCount(int questionNo) {
		SqlMapper.update("questions.increaseSuggestionCount", questionNo);
	}
}
