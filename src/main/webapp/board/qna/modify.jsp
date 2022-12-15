<%@page import="com.community.dto.QuestionDetailDto"%>
<%@page import="com.community.util.MultipartRequest"%>
<%@page import="com.community.vo.Question"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
	// 수정폼의 입력값을 요청객체에서 가져온다.
	int no = StringUtils.stringToInt(request.getParameter("no"));
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String important = request.getParameter("important");
	String content = request.getParameter("content"); 
	
	int writerNo = 1002;
	
	// QuestionDao객체 생성, getQuestionByNo(int questionNo)를 실행, 게시글 번호에 해당하는 게시글 정보 조회
	QuestionDao questionDao = new QuestionDao();
	Question question = questionDao.getQuestionByNo(no);
	
	// 조회된 게시글 정보의 값을 수정폼의 입력값으로 변경
	question.setBoardNo(boardNo);
	question.setTitle(title);
	question.setImportant(important);
	question.setContent(content);
	
	// 변경된 게시글정보 QuestionDao의 updateQuestion(question)을 실행해서 반영
	questionDao.updateQuestion(question);
	
	// 변경작업을 수행으로 재요청URL 서버로 제출
	response.sendRedirect("detail.jsp?no=" + no);
	
	
	
%>