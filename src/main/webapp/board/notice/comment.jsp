<%-- <%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
	// 게시글번호, 작성자, 내용을 조회한다.
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	String content = request.getParameter("content");
	
	// Comment객체 생성해서 정보저장
	Comment comment = new Comment();
	comment.setPostNo(postNo);
	comment.setContent(content);
	
	CommentDao commentDao = new CommentDao();
	commentDao.insertComment(comment);
	
	response.sendRedirect("detail.jsp?no=" + postNo);
%> --%>