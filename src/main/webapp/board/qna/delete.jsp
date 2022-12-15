<%@page import="com.community.vo.Question"%>
<%@page import="com.community.dto.QuestionDetailDto"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
	// 게시글 번호를 조회
	int questionNo = StringUtils.stringToInt(request.getParameter("no"));

	//Question객체 생성, getQuestionByNo(int questionNo) 실행하여 게시글 정보를 조회하고 출력
	QuestionDao questionDao = new QuestionDao();
	Question question = questionDao.getQuestionByNo(questionNo);
	
	// 게시글정보의 삭제여부를 "D"로 변경("Y"는 완전삭제이다.)
	// QuestionDao객체의 updateQuestion(int question)을 실행해서 변경된 정보를 반영시킨다. 
	question.setDeleted("D");
	questionDao.updateQuestion(question);
	
	// 삭제(변경) 수행후 재요청 URL을 을답으로 보낸다.
	response.sendRedirect("list.jsp");
	
%>