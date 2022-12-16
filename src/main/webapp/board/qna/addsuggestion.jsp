<%@page import="com.community.dao.SuggestionDao"%>
<%@page import="com.community.vo.Suggestion"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.dto.QuestionDetailDto"%>
<%@page import="com.community.vo.Question"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	Employee employee = (Employee) session.getAttribute("loginedUser");

	if (employee == null ) {
		response.sendRedirect("/web-community/employees/loginform.jsp?error=deny");
		return;
	}
	
	// 글번호를 조회
		int postNo = StringUtils.stringToInt(request.getParameter("no"));
		int empNo = employee.getNo();

	try{
		// 추천정보 추가
		Suggestion suggestion = new Suggestion();
		suggestion.setPostNo(postNo);
		suggestion.setEmpNo(empNo);
	
		SuggestionDao suggestionDao = new SuggestionDao();
		suggestionDao.addSuggestion(suggestion);
		
		
		// 게시글을 조회해서 게시글의 추천자수를 1증가시킨다.
		QuestionDao questionDao = new QuestionDao();
		Question question= questionDao.getQuestionByNo(postNo);
		
		question.setSuggestionCount(question.getSuggestionCount() + 1);
		questionDao.increaseSuggestionCount(postNo); 
				
	    questionDao.updateQuestion(question);
	} catch (Exception e) {
		response.sendRedirect("detail.jsp?no=" + postNo + "&error=suggestion");
		return;
	}
	
	
	// 추가작업 수행으로 재요청URL 서버로 제출
	response.sendRedirect("detail.jsp?no=" + postNo);
%>
