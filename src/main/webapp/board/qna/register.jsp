<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.util.MultipartRequest"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.vo.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>

<%	
	MultipartRequest mr = new MultipartRequest(request, "");
	int boardNo = StringUtils.stringToInt(mr.getParameter("boardNo"));
	String title = mr.getParameter("title");
	String important = mr.getParameter("important");
	String content = mr.getParameter("content");

	int writerNo = 1002;
	
	Question question = new Question();
	question.setBoardNo(boardNo);
	question.setTitle(title);
	question.setWriterNo(writerNo);
	question.setImportant(important);
	question.setContent(content);
	
	QuestionDao questionDao = new QuestionDao();
	questionDao.insertQuestion(question);
	
	response.sendRedirect("list.jsp");
%>