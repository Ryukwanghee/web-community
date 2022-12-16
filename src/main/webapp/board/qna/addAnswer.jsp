<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.vo.Question"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.util.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%	
	//첨부파일 업로드를 지원하는 객체 
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String important = request.getParameter("important");
	String content = request.getParameter("content");
	int originalNo = StringUtils.stringToInt(request.getParameter("originalNo"));

	int writerNo = 1002;
	
	Question question = new Question();
	
	question.setBoardNo(boardNo);
	question.setTitle(title);
	question.setWriterNo(writerNo);
	question.setImportant(important);
	question.setContent(content);
	question.setOriginalNo(originalNo);
	
	QuestionDao questionDao = new QuestionDao();
	questionDao.insertAnswer(question);
	
	response.sendRedirect("detail.jsp?no=" + originalNo );
%>