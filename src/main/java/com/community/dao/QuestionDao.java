package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.util.SqlMapper;
import com.community.vo.Question;

public class QuestionDao {

	public void insertQuestion(Question question) {
		SqlMapper.insert("questions.insertQuestion", question);
	}
	
	@SuppressWarnings("unchecked")
	public List<Question> getQuestions(Map<String, Object> param){
		return (List<Question>) SqlMapper.selectList("questions.getQuestions", param);
	}
	
	public int getTotalRows() {
		return (Integer) SqlMapper.selectOne("questions.getTotalRows");
	}
}
